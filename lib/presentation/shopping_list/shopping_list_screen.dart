import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/shopping_list_screen/cubit.dart';
import '../../data/shopping_list_repository.dart';
import '../../domain/lists/list.dart';
import '../../injection.dart';
import '../../utils/helpers/extensions.dart';

class ShoppingListScreen extends StatelessWidget {
  final ShoppingList shoppingList;
  const ShoppingListScreen({
    super.key,
    required this.shoppingList,
  });

  static Route<void> route(ShoppingList shoppingList) {
    return MaterialPageRoute(
      builder: (_) => ShoppingListScreen(shoppingList: shoppingList),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ShoppingListScreenCubit(
        repository: getIt<ShoppingListRepository>(),
        shoppingList: shoppingList,
      ),
      child: const _ShoppingListScreenView(),
    );
  }
}

class _ShoppingListScreenView extends StatelessWidget {
  const _ShoppingListScreenView();

  @override
  Widget build(BuildContext context) {
    ShoppingListScreenCubit cubit = context.watch();
    ShoppingList shoppingList = cubit.state.shoppingList;

    return Theme(
      data: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(seedColor: shoppingList.style.color),
        useMaterial3: true,
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: shoppingList.style.color,
          title: Text(shoppingList.name),
          leading: IconButton(
            onPressed: () => context.navigator.maybePop(),
            icon: Stack(children: [
              const Center(child: BackButtonIcon()),
              Align(
                alignment: Alignment.bottomRight,
                child: Text(shoppingList.style.emoji),
              ),
            ]),
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8.0),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 8.0,
              ),
              child: const Text(
                'DO NOT TRY TO ADD MORE THAN ONE PRODUCT AT A TIME\n'
                "BELIEVE ME YOU DON'T WANT THAT",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            TextFormField(
              controller: cubit.newProductNameController,
              onChanged: cubit.newProductNameChanged,
              onEditingComplete: cubit.newProductSaved,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
              ),
            ),
            for (var product in cubit.state.products)
              ListTile(title: Text(product.title))
          ],
        ),
      ),
    );
  }
}
