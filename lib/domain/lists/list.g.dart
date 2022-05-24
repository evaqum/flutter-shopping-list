// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ShoppingListAdapter extends TypeAdapter<_$_Default> {
  @override
  final int typeId = 1;

  @override
  _$_Default read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_Default(
      name: fields[0] as String,
      products: (fields[1] as List).cast<Product>(),
      styleIndex: fields[4] as int,
      id: fields[5] as int,
    );
  }

  @override
  void write(BinaryWriter writer, _$_Default obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(4)
      ..write(obj.styleIndex)
      ..writeByte(5)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.products);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShoppingListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
