part of 'cubit.dart';

// enum NewListButtonState {
//   button,
//   nameField;

//   bool get isButton => this == button;
//   bool get isNameFiled => this == nameField;
// }

@freezed
class ListsOverviewScreenState with _$ListsOverviewScreenState {
  const factory ListsOverviewScreenState({
    @Default([]) List<ShoppingList> shoppingLists,
    ShoppingList? lastDeletedShoppingList,
    // @Default(NewListButtonState.button) NewListButtonState buttonState,
  }) = _Initial;
}
