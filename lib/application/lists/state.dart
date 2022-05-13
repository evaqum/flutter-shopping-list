part of 'cubit.dart';

@freezed
class ListsState with _$ListsState {
  const factory ListsState({
    @Default([]) List<ShoppingList> shoppingLists,
    ShoppingList? lastDeletedShoppingList,
  }) = _Initial;
}
