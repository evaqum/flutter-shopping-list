part of 'cubit.dart';

@freezed
class EditListScreenState with _$EditListScreenState {
  const factory EditListScreenState({
    ShoppingList? initialShoppingList,
    @Default(ShoppingListStyle.unknown) ShoppingListStyle style,
    @Default('') String name,
    @Default('') String productName,
    @Default([]) List<Product> products,
  }) = _Default;
}
