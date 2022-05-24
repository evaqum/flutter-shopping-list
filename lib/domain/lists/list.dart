import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import '../products/product.dart';

part 'list.freezed.dart';
part 'list.g.dart';

enum ShoppingListStyle {
  unknown('🗒️', 0xFFF5F5F5),
  tomato('🍅', 0xFFEF9A9A),
  apple('🍏', 0xFFC8E6C9),
  chocolate('🍫', 0xFFD7CCC8),
  watermelon('🍉', 0xFFEF9A9A),
  berry('🫐', 0xFFE1BEE7),
  bread('🍞', 0xFFFFE0B2),
  lollipop('🍭', 0xFFF8BBD0),
  kiwi('🥝', 0xFFC8E6C9),
  ice('🧊', 0xFFBBDEFB);

  final int _color;
  final String emoji;
  const ShoppingListStyle(this.emoji, this._color);

  Color get color => Color(_color);
}

@freezed
class ShoppingList extends HiveObject with _$ShoppingList {
  static const boxName = 'shopping_lists_box';
  static final adapter = ShoppingListAdapter();

  ShoppingList._();

  @HiveType(typeId: 1, adapterName: 'ShoppingListAdapter')
  factory ShoppingList({
    @HiveField(0) required String name,
    @HiveField(1) required List<Product> products,
    // @HiveField(2) String? emoji,
    // @HiveField(3) int? colorHex,
    @HiveField(4) @Default(0) int styleIndex,
    @HiveField(5) required int id,
  }) = _Default;

  ShoppingListStyle get style => ShoppingListStyle.values[styleIndex];
}
