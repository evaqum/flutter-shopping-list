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
  final TextEditingController newProductNameController =
      TextEditingController();

  ShoppingListScreenCubit({
    required ShoppingList shoppingList,
    required this.repository,
  }) : super(ShoppingListScreenState(shoppingList));

  void newProductNameChanged(String newProductName) {
    emit(state.copyWith(newProductName: newProductName));
  }

  void newProductSaved([_]) {
    List<Product> newProducts = [
      ...state.products,
      Product(
        title: state.newProductName,
        id: state.products.length,
      ),
    ];

    // SEVERE FIXME: info in comment
    // For some reason state.shoppingList loses its [key] after adding one product
    //
    // Because of that when you add more products after that
    // the shopping list is saved as a new one
    //
    // no idea how to fix it atm
    repository.updateList(
      state.shoppingList.copyWith(products: newProducts),
      state.shoppingList.key,
    );

    newProductNameController.clear();
    emit(state.copyWith(
      newProductName: '',
      products: newProducts,
    ));
  }
}

class HACK {}
