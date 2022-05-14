import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiver/time.dart';

import '../../application/lists_overview_screen/cubit.dart';
import '../../application/new_list_sheet/cubit.dart';
import '../../injection.dart';
import '../../utils/constants.dart';
import '../core/app_bar.dart';
import 'widgets/new_list_sheet.dart';
import 'widgets/no_lists_placeholder.dart';
import 'widgets/shopping_list_tile.dart';

class ListsOverviewScreen extends StatelessWidget {
  const ListsOverviewScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute(
      builder: (_) => const ListsOverviewScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ListsOverviewScreenCubit>(),
      child: const _ListsOverviewView(),
    );
  }
}

class _ListsOverviewView extends StatelessWidget {
  const _ListsOverviewView();

  void _showNewListModal(BuildContext context) {
    final FocusNode nameFocusNode = FocusNode();
    nameFocusNode.requestFocus();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
      ),
      builder: (_) {
        return BlocProvider(
          create: (_) => getIt<NewListSheetCubit>(),
          child: NewListSheet(nameFocusNode: nameFocusNode),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: QAppBar(
        title: const Text('Shopping lists'),
        systemOverlayStyle: transparentStatusBarOverlayStyle,
      ),
      body: BlocConsumer<ListsOverviewScreenCubit, ListsOverviewScreenState>(
        listenWhen: (previous, current) {
          return previous.lastDeletedShoppingList !=
                  current.lastDeletedShoppingList &&
              current.lastDeletedShoppingList != null;
        },
        listener: (context, state) {
          ScaffoldMessenger.of(context)
            ..clearSnackBars()
            ..showSnackBar(
              SnackBar(
                content: const Text('1 list deleted'),
                dismissDirection: DismissDirection.horizontal,
                behavior: SnackBarBehavior.floating,
                action: SnackBarAction(
                  label: 'UNDO',
                  onPressed: () => context
                      .read<ListsOverviewScreenCubit>()
                      .restoreLastDeleted(),
                ),
              ),
            );
        },
        builder: (context, state) {
          if (state.shoppingLists.isEmpty) {
            return const NoListsPlaceholder();
          }

          return ListView.separated(
            separatorBuilder: (context, index) {
              return const Divider(
                height: 2.0,
                indent: 16.0,
                endIndent: 16.0,
              );
            },
            itemCount: state.shoppingLists.length,
            itemBuilder: (context, index) {
              final shoppingList = state.shoppingLists[index];
              return ShoppingListTile(
                key: Key('ShoppingListTile_${shoppingList.key}'),
                shoppingList: shoppingList,
              );
            },
          );
        },
      ),
      floatingActionButton: NewListButton(
        onPressed: () => _showNewListModal(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class NewListButton extends StatelessWidget {
  final void Function()? onPressed;
  const NewListButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: AnimatedContainer(
        height: 56.0,
        width: screenSize.width * 0.9,
        // width: 56.0,
        curve: Curves.easeInOutCubic,
        duration: aMillisecond * 300.0,
        child: FloatingActionButton(
          onPressed: onPressed,
          child: const Text(
            'Create new list',
            overflow: TextOverflow.clip,
            maxLines: 1,
          ),
        ),
      ),
    );
  }
}
