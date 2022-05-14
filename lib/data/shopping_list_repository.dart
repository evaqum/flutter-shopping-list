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

  ValueStream<List<ShoppingList>> get lists => _streamController.stream;

  void _updateStreamValue() => _streamController.add(_box.values.toList());

  void updateList(ShoppingList list, [dynamic key]) async {
    if (key == null) {
      await _box.add(list);
      _updateStreamValue();
      return;
    }

    await _box.put(key, list);
    _updateStreamValue();
  }

  void deleteList(ShoppingList list) {
    if (list.key == null) {
      return;
    }
    _box.delete(list.key);
    _updateStreamValue();
  }

  // List<ShoppingList> getLists() {
  //   return _box.values.toList();
  // }
}
