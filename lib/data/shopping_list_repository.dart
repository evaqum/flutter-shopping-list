import 'package:flutter/foundation.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import '../domain/lists/list.dart';

@singleton
class ShoppingListRepository {
  static final Box<ShoppingList> _box = Hive.box(ShoppingList.boxName);
  final _streamController = BehaviorSubject<List<ShoppingList>>.seeded(
    _box.values.toList(),
  );
  final _boxListenable = _box.listenable();
  late final VoidCallback _boxListener;

  ShoppingListRepository() {
    _boxListener = () {
      _streamController.add(_box.values.toList());
    };

    _boxListenable.addListener(_boxListener);
  }

  ValueStream<List<ShoppingList>> get lists => _streamController.stream;

  int getFreeId() => _streamController.value.isEmpty ? 1 : _streamController.value.last.id + 1;

  void updateList(ShoppingList list) async {
    await _box.put('id_${list.id}', list);
  }

  void deleteList(ShoppingList list) {
    if (list.key == null) {
      return;
    }
    _box.delete(list.key);
  }

  @disposeMethod
  void dispose() {
    _boxListenable.removeListener(_boxListener);
  }
}
