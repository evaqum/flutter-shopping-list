import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../data/shopping_list_repository.dart';
import '../../domain/lists/list.dart';

part 'cubit.freezed.dart';
part 'state.dart';

@injectable
class ListsCubit extends Cubit<ListsState> {
  final ShoppingListRepository _shoppingListRepository;
  late final StreamSubscription<List<ShoppingList>> _streamSubscription;

  ListsCubit(this._shoppingListRepository) : super(const ListsState()) {
    _streamSubscription = _shoppingListRepository.lists.listen((listsList) {
      emit(state.copyWith(shoppingLists: listsList));
    });
  }

  void listRemoved(ShoppingList list) {
    _shoppingListRepository.deleteList(list);
    emit(state.copyWith(lastDeletedShoppingList: list));
  }

  void restoreLastDeleted() {
    if (state.lastDeletedShoppingList == null) {
      return;
    }

    _shoppingListRepository.updateList(state.lastDeletedShoppingList!);
    emit(state.copyWith(lastDeletedShoppingList: null));
  }

  @override
  Future<void> close() {
    _streamSubscription.cancel();
    return super.close();
  }
}
