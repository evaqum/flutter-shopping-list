import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/shopping_list_repository.dart';
import '../../domain/lists/list.dart';
import '../../domain/products/product.dart';

part 'cubit.freezed.dart';
part 'state.dart';

class ShoppingListScreenCubit extends Cubit<ShoppingListScreenState> {
  final ShoppingListRepository repository;
  final TextEditingController newProductNameController = TextEditingController();

  ShoppingListScreenCubit({
    required ShoppingList shoppingList,
    required this.repository,
  }) : super(ShoppingListScreenState(shoppingList));

  void newProductNameChanged(String newProductName) {
    emit(state.copyWith(newProductName: newProductName));
  }

  List<Product> _saveProduct(String productName) {
    List<Product> newProducts = [
      ...state.products,
      Product(
        title: productName,
        id: state.products.isEmpty ? 1 : state.products.last.id + 1,
      ),
    ];

    repository.updateList(
      state.shoppingList.copyWith(products: newProducts),
    );

    return newProducts;
  }

  void newProductFromBarcode(String productName) {
    emit(state.copyWith(
      products: _saveProduct(productName),
    ));
  }

  void newProductSaved([_]) {
    final name = state.newProductName;

    newProductNameController.clear();
    emit(state.copyWith(
      newProductName: '',
      products: _saveProduct(name),
    ));
  }

  void productChecked(Product product, {bool? isDone}) {
    List<Product> newProducts = [...state.products];
    int productIndex = newProducts.indexWhere((e) => e.id == product.id);
    newProducts.replaceRange(productIndex, productIndex + 1, [
      product.copyWith(isDone: isDone ?? product.isDone),
    ]);

    repository.updateList(
      state.shoppingList.copyWith(products: newProducts),
    );

    emit(state.copyWith(
      products: newProducts,
    ));
  }

  void productRemoved(Product product) {
    List<Product> newProducts = [...state.products];
    log('new products: $newProducts');
    newProducts.removeWhere((e) => e.id == product.id);
    log('after deleted: $newProducts');

    repository.updateList(
      state.shoppingList.copyWith(products: newProducts),
    );

    emit(state.copyWith(
      products: newProducts,
    ));
  }
}
