import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/shopping_list_repository.dart';
import '../../domain/lists/list.dart';

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
        ));

  void nameChanged(String name) {
    emit(state.copyWith(name: name));
  }

  void stylePicked(ShoppingListStyle style) {
    emit(state.copyWith(style: style));
  }

  void savePressed() {
    ShoppingList newList = ShoppingList(
      name: state.name,
      styleIndex: state.style.index,
      products: [],
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
