// ignore_for_file: unused_element

part of 'cubit.dart';

@freezed
class ShoppingListScreenState with _$ShoppingListScreenState {
  const factory ShoppingListScreenState._({
    required ShoppingList shoppingList,
    required List<Product> products,
    @Default('') String newProductName,
  }) = _Private;

  factory ShoppingListScreenState(ShoppingList shoppingList) {
    return ShoppingListScreenState._(
      shoppingList: shoppingList,
      products: shoppingList.products,
    );
  }
}
