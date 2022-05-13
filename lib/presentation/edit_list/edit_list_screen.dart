import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/edit_list_screen/cubit.dart';
import '../../data/shopping_list_repository.dart';
import '../../domain/lists/list.dart';
import '../../injection.dart';
import '../../utils/helpers/extensions.dart';
import '../core/app_bar.dart';
import '../core/text_field.dart';

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
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          minChildSize: 0.25,
          maxChildSize: 0.6,
          initialChildSize: 0.25,
          builder: (_, controller) => Padding(
            padding: const EdgeInsets.all(16.0),
            child: GridView(
              controller: controller,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 78.0,
                childAspectRatio: 1.0,
                mainAxisSpacing: 6.0,
                crossAxisSpacing: 6.0,
              ),
              children: [
                for (var style in ShoppingListStyle.values)
                  _StyleCard(style: style, cubit: cubit),
              ],
            ),
          ),
        );
      },
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
            title: Text(
              isNewList ? 'Add shopping list' : 'Edit shopping list',
            ),
            actions: const [
              // IconButton(
              //   onPressed: cubit.state.name.isNotEmpty
              //       ? () {
              //           cubit.savePressed();
              //           context.navigator.pop();
              //         }
              //       : null,
              //   icon: const Icon(Icons.save_outlined),
              // ),
            ],
          ),
          floatingActionButton: cubit.state.name.isNotEmpty
              ? FloatingActionButton(
                  onPressed: () {
                    cubit.savePressed();
                    context.navigator.pop();
                  },
                  child: const Icon(Icons.save_outlined),
                )
              : null,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Ink(
                        height: 64.0,
                        width: 64.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32.0),
                          color: cubit.state.style.color,
                        ),
                        child: InkWell(
                          onTap: () => _showModal(context, cubit),
                          borderRadius: BorderRadius.circular(32.0),
                          child: Center(
                            child: Text(
                              cubit.state.style.emoji,
                              style: const TextStyle(fontSize: 22.0),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: QTextField(
                            height: 64.0,
                            focusNode: titleFocusNode,
                            backgroundColor:
                                context.theme.colorScheme.surfaceVariant,
                            initialValue: cubit.state.name,
                            onChanged: cubit.nameChanged,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

class _StyleCard extends StatelessWidget {
  final ShoppingListStyle style;
  final EditListScreenCubit cubit;
  const _StyleCard({
    required this.style,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        color: style.color,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: InkWell(
        hoverColor: Colors.white10,
        splashColor: Colors.white10,
        borderRadius: BorderRadius.circular(12.0),
        onTap: () {
          cubit.stylePicked(style);
          context.navigator.pop();
        },
        child: Center(
          child: Text(
            style.emoji,
            style: const TextStyle(fontSize: 28.0),
          ),
        ),
      ),
    );
  }
}
