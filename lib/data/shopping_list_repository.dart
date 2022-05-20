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

  void updateList(ShoppingList list, [dynamic key]) async {
    if (key == null && list.key == null) {
      await _box.add(list);
      return;
    }

    await _box.put(key ?? list.key, list);
  }

  void deleteList(ShoppingList list) {
    if (list.key == null) {
      return;
    }
    _box.delete(list.key);
  }

  void dispose() {
    _boxListenable.removeListener(_boxListener);
  }
}
