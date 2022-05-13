part of 'cubit.dart';

@freezed
class EditListScreenState with _$EditListScreenState {
  const factory EditListScreenState({
    ShoppingList? initialShoppingList,
    // String? selectedEmoji,
    // Color? emojiColor,
    @Default(ShoppingListStyle.unknown) ShoppingListStyle style,
    @Default('') String name,
  }) = _Default;
}
