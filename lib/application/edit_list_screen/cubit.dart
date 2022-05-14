import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/shopping_list_repository.dart';
import '../../domain/lists/list.dart';
import '../../domain/products/product.dart';

part 'cubit.freezed.dart';
part 'state.dart';

class EditListScreenCubit extends Cubit<EditListScreenState> {
  final ShoppingListRepository _shoppingListRepository;
  EditListScreenCubit({
    required ShoppingListRepository shoppingListRepository,
    ShoppingList? initialShoppingList,
  })  : _shoppingListRepository = shoppingListRepository,
        super(EditListScreenState(
          initialShoppingList: initialShoppingList,
          name: initialShoppingList?.name ?? '',
          style: initialShoppingList?.style ?? ShoppingListStyle.unknown,
          products: initialShoppingList?.products ?? [],
        )) {
    log(
      'initialShoppingList is null? ${state.initialShoppingList == null}',
      name: 'EditListScreenCubit.new',
    );
    log(
      'initialShoppingList.key: ${state.initialShoppingList?.key}',
      name: 'EditListScreenCubit.new',
    );
  }

  void nameChanged(String name) {
    emit(state.copyWith(name: name));
  }

  void stylePicked(ShoppingListStyle style) {
    emit(state.copyWith(style: style));
  }

  void productNameUpdated(String productName) {
    emit(state.copyWith(productName: productName));
  }

  void productAdded() {
    Product product = Product(
      title: state.productName,
      id: state.products.length,
    );

    emit(state.copyWith(
      products: [...state.products, product],
    ));
  }

  void productDeleted(Product product) {
    List<Product> products = [...state.products];
    products.removeWhere((p) => p.id == product.id);
    emit(state.copyWith(products: products));
  }

  void productChecked(Product product, bool checked) {
    List<Product> products = [...state.products];
    int i = products.indexWhere((p) => p.id == product.id);

    products.replaceRange(i, i + 1, [product.copyWith(checked: checked)]);
    emit(state.copyWith(products: products));
  }

  void listSaved() {
    ShoppingList newList = ShoppingList(
      name: state.name,
      styleIndex: state.style.index,
      products: state.products,
    );
    log(
      'initialShoppingList is null? ${state.initialShoppingList == null}',
      name: 'EditListScreenCubit.listSaved',
    );
    log(
      'initialShoppingList.key: ${state.initialShoppingList?.key}',
      name: 'EditListScreenCubit.listSaved',
    );
    if (state.initialShoppingList != null) {
      return _shoppingListRepository.updateList(
        newList,
        state.initialShoppingList!.key,
      );
    }

    return _shoppingListRepository.updateList(newList);
  }
}
