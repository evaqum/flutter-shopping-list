import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
class Product with _$Product {
  static final adapter = ProductAdapter();

  @HiveType(typeId: 0, adapterName: 'ProductAdapter')
  const factory Product({
    @HiveField(0) required String title,
    @HiveField(1) @Default(false) bool checked,
  }) = _Default;
}
