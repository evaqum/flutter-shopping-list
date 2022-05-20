// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ShoppingList {
  @HiveField(0)
  String get name => throw _privateConstructorUsedError;
  @HiveField(1)
  List<Product> get products =>
      throw _privateConstructorUsedError; // @HiveField(2) String? emoji,
// @HiveField(3) int? colorHex,
  @HiveField(4)
  int get styleIndex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ShoppingListCopyWith<ShoppingList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShoppingListCopyWith<$Res> {
  factory $ShoppingListCopyWith(
          ShoppingList value, $Res Function(ShoppingList) then) =
      _$ShoppingListCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) String name,
      @HiveField(1) List<Product> products,
      @HiveField(4) int styleIndex});
}

/// @nodoc
class _$ShoppingListCopyWithImpl<$Res> implements $ShoppingListCopyWith<$Res> {
  _$ShoppingListCopyWithImpl(this._value, this._then);

  final ShoppingList _value;
  // ignore: unused_field
  final $Res Function(ShoppingList) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? products = freezed,
    Object? styleIndex = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      products: products == freezed
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product>,
      styleIndex: styleIndex == freezed
          ? _value.styleIndex
          : styleIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_DefaultCopyWith<$Res>
    implements $ShoppingListCopyWith<$Res> {
  factory _$$_DefaultCopyWith(
          _$_Default value, $Res Function(_$_Default) then) =
      __$$_DefaultCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) String name,
      @HiveField(1) List<Product> products,
      @HiveField(4) int styleIndex});
}

/// @nodoc
class __$$_DefaultCopyWithImpl<$Res> extends _$ShoppingListCopyWithImpl<$Res>
    implements _$$_DefaultCopyWith<$Res> {
  __$$_DefaultCopyWithImpl(_$_Default _value, $Res Function(_$_Default) _then)
      : super(_value, (v) => _then(v as _$_Default));

  @override
  _$_Default get _value => super._value as _$_Default;

  @override
  $Res call({
    Object? name = freezed,
    Object? products = freezed,
    Object? styleIndex = freezed,
  }) {
    return _then(_$_Default(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      products: products == freezed
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product>,
      styleIndex: styleIndex == freezed
          ? _value.styleIndex
          : styleIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@HiveType(typeId: 1, adapterName: 'ShoppingListAdapter')
class _$_Default extends _Default {
  _$_Default(
      {@HiveField(0) required this.name,
      @HiveField(1) required final List<Product> products,
      @HiveField(4) this.styleIndex = 0})
      : _products = products,
        super._();

  @override
  @HiveField(0)
  final String name;
  final List<Product> _products;
  @override
  @HiveField(1)
  List<Product> get products {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

// @HiveField(2) String? emoji,
// @HiveField(3) int? colorHex,
  @override
  @JsonKey()
  @HiveField(4)
  final int styleIndex;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Default &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            const DeepCollectionEquality()
                .equals(other.styleIndex, styleIndex));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(_products),
      const DeepCollectionEquality().hash(styleIndex));

  @JsonKey(ignore: true)
  @override
  _$$_DefaultCopyWith<_$_Default> get copyWith =>
      __$$_DefaultCopyWithImpl<_$_Default>(this, _$identity);
}

abstract class _Default extends ShoppingList {
  factory _Default(
      {@HiveField(0) required final String name,
      @HiveField(1) required final List<Product> products,
      @HiveField(4) final int styleIndex}) = _$_Default;
  _Default._() : super._();

  @override
  @HiveField(0)
  String get name => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  List<Product> get products => throw _privateConstructorUsedError;
  @override // @HiveField(2) String? emoji,
// @HiveField(3) int? colorHex,
  @HiveField(4)
  int get styleIndex => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_DefaultCopyWith<_$_Default> get copyWith =>
      throw _privateConstructorUsedError;
}
