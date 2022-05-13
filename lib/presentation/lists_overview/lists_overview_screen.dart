import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/lists/cubit.dart';
import '../../injection.dart';
import '../../utils/constants.dart';
import '../../utils/helpers/extensions.dart';
import '../core/app_bar.dart';
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
      create: (context) => getIt<ListsCubit>(),
      child: const _ListsOverviewView(),
    );
  }
}

class _ListsOverviewView extends StatelessWidget {
  const _ListsOverviewView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: QAppBar(
        title: const Text('Shopping lists'),
        systemOverlayStyle: transparentStatusBarOverlayStyle,
      ),
      body: BlocConsumer<ListsCubit, ListsState>(
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
                  onPressed: () =>
                      context.read<ListsCubit>().restoreLastDeleted(),
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
                height: 8.0,
                indent: 16.0,
                endIndent: 16.0,
              );
            },
            itemCount: state.shoppingLists.length,
            itemBuilder: (context, index) {
              return ShoppingListTile(
                shoppingList: state.shoppingLists[index],
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.add),
        label: const Text('Add list'),
        onPressed: () => context.navigator.pushNamed('editList'),
      ),
    );
  }
}
