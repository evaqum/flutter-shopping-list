part of 'cubit.dart';

@freezed
class NewListSheetState with _$NewListSheetState {
  const factory NewListSheetState({
    @Default('') String name,
    @Default(ShoppingListStyle.unknown) ShoppingListStyle listStyle,
    @Default(false) bool showStyleSelector,
  }) = _Default;
}
