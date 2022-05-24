import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/shopping_list_screen/cubit.dart';
import '../../data/shopping_list_repository.dart';
import '../../domain/lists/list.dart';
import '../../injection.dart';
import '../../utils/helpers/extensions.dart';
import '../barcode_scan/barcode_scan_screen.dart';
import 'widgets/product_list_tile.dart';

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
        floatingActionButton: FloatingActionButton.extended(
          icon: const Icon(Icons.camera_alt_outlined),
          label: const Text('Scan a barcode'),
          onPressed: () => context.navigator.push(BarcodeScanScreen.route(cubit)),
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                controller: cubit.newProductNameController,
                onChanged: cubit.newProductNameChanged,
                onEditingComplete: cubit.newProductSaved,
                decoration: InputDecoration(
                  hintText: 'Add a new product...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
              ),
            ),
            for (var product in cubit.state.products) ...[
              const SizedBox(height: 4.0),
              ProductListTile(product: product),
            ],
          ],
        ),
      ),
    );
  }
}
