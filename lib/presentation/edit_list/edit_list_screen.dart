import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/edit_list_screen/cubit.dart';
import '../../data/shopping_list_repository.dart';
import '../../domain/lists/list.dart';
import '../../injection.dart';
import '../core/app_bar.dart';
import 'widgets/list_name_field.dart';
import 'widgets/save_button.dart';
import 'widgets/style_select_button.dart';
import 'widgets/style_select_sheet.dart';

class EditListScreen extends StatelessWidget {
  final ShoppingList? initialShoppingList;
  const EditListScreen({super.key, this.initialShoppingList});

  static Route<void> route(ShoppingList? initialShoppingList) {
    return MaterialPageRoute(
      builder: (_) => EditListScreen(initialShoppingList: initialShoppingList),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => EditListScreenCubit(
        shoppingListRepository: getIt<ShoppingListRepository>(),
        initialShoppingList: initialShoppingList,
      ),
      child: _EditListView(isNewList: initialShoppingList == null),
    );
  }
}

class _EditListView extends StatelessWidget {
  final bool isNewList;
  final FocusNode titleFocusNode = FocusNode();
  _EditListView({required this.isNewList}) {
    if (isNewList) {
      titleFocusNode.requestFocus();
    }
  }

  void _showModal(BuildContext context, EditListScreenCubit cubit) {
    showModalBottomSheet(
      context: context,
      enableDrag: true,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16.0),
        ),
      ),
      builder: (_) => StyleSelectSheet(cubit: cubit),
    );
  }

  @override
  Widget build(BuildContext context) {
    EditListScreenCubit cubit = context.watch();

    return Theme(
      data: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: cubit.state.style.color,
        ),
        useMaterial3: true,
      ),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: QAppBar(
            title: Text(isNewList ? 'Add shopping list' : 'Edit shopping list'),
          ),
          floatingActionButton: SaveButton(cubit: cubit),
          body: _Body(
            cubit: cubit,
            titleFocusNode: titleFocusNode,
            onStyleSelectButtonTap: () => _showModal(context, cubit),
          ),
        );
      }),
    );
  }
}

class _Body extends StatelessWidget {
  final FocusNode titleFocusNode;
  final EditListScreenCubit cubit;
  final void Function()? onStyleSelectButtonTap;
  const _Body({
    required this.titleFocusNode,
    required this.cubit,
    this.onStyleSelectButtonTap,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                StyleSelectButton(
                  style: cubit.state.style,
                  onTap: onStyleSelectButtonTap,
                ),
                ListNameField(
                  focusNode: titleFocusNode,
                  cubit: cubit,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
