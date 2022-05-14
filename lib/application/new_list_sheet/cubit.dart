import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../data/shopping_list_repository.dart';
import '../../domain/lists/list.dart';

part 'cubit.freezed.dart';
part 'state.dart';

@injectable
class NewListSheetCubit extends Cubit<NewListSheetState> {
  final ShoppingListRepository _shoppingListRepository;
  NewListSheetCubit(this._shoppingListRepository)
      : super(const NewListSheetState());

  void nameChanged(String name) {
    emit(state.copyWith(name: name));
  }

  void styleSelected(ShoppingListStyle style) {
    emit(state.copyWith(
      listStyle: style,
      showStyleSelector: false,
    ));
  }

  void toggleStyleSelector([bool show = true]) {
    emit(state.copyWith(showStyleSelector: show));
  }

  void listSaved() {
    _shoppingListRepository.updateList(
      ShoppingList(
        name: state.name,
        styleIndex: state.listStyle.index,
        products: [],
      ),
    );
  }
}
