// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EditListScreenState {
  ShoppingList? get initialShoppingList => throw _privateConstructorUsedError;
  ShoppingListStyle get style => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get productName => throw _privateConstructorUsedError;
  List<Product> get products => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditListScreenStateCopyWith<EditListScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditListScreenStateCopyWith<$Res> {
  factory $EditListScreenStateCopyWith(
          EditListScreenState value, $Res Function(EditListScreenState) then) =
      _$EditListScreenStateCopyWithImpl<$Res>;
  $Res call(
      {ShoppingList? initialShoppingList,
      ShoppingListStyle style,
      String name,
      String productName,
      List<Product> products});

  $ShoppingListCopyWith<$Res>? get initialShoppingList;
}

/// @nodoc
class _$EditListScreenStateCopyWithImpl<$Res>
    implements $EditListScreenStateCopyWith<$Res> {
  _$EditListScreenStateCopyWithImpl(this._value, this._then);

  final EditListScreenState _value;
  // ignore: unused_field
  final $Res Function(EditListScreenState) _then;

  @override
  $Res call({
    Object? initialShoppingList = freezed,
    Object? style = freezed,
    Object? name = freezed,
    Object? productName = freezed,
    Object? products = freezed,
  }) {
    return _then(_value.copyWith(
      initialShoppingList: initialShoppingList == freezed
          ? _value.initialShoppingList
          : initialShoppingList // ignore: cast_nullable_to_non_nullable
              as ShoppingList?,
      style: style == freezed
          ? _value.style
          : style // ignore: cast_nullable_to_non_nullable
              as ShoppingListStyle,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      productName: productName == freezed
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      products: products == freezed
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product>,
    ));
  }

  @override
  $ShoppingListCopyWith<$Res>? get initialShoppingList {
    if (_value.initialShoppingList == null) {
      return null;
    }

    return $ShoppingListCopyWith<$Res>(_value.initialShoppingList!, (value) {
      return _then(_value.copyWith(initialShoppingList: value));
    });
  }
}

/// @nodoc
abstract class _$$_DefaultCopyWith<$Res>
    implements $EditListScreenStateCopyWith<$Res> {
  factory _$$_DefaultCopyWith(
          _$_Default value, $Res Function(_$_Default) then) =
      __$$_DefaultCopyWithImpl<$Res>;
  @override
  $Res call(
      {ShoppingList? initialShoppingList,
      ShoppingListStyle style,
      String name,
      String productName,
      List<Product> products});

  @override
  $ShoppingListCopyWith<$Res>? get initialShoppingList;
}

/// @nodoc
class __$$_DefaultCopyWithImpl<$Res>
    extends _$EditListScreenStateCopyWithImpl<$Res>
    implements _$$_DefaultCopyWith<$Res> {
  __$$_DefaultCopyWithImpl(_$_Default _value, $Res Function(_$_Default) _then)
      : super(_value, (v) => _then(v as _$_Default));

  @override
  _$_Default get _value => super._value as _$_Default;

  @override
  $Res call({
    Object? initialShoppingList = freezed,
    Object? style = freezed,
    Object? name = freezed,
    Object? productName = freezed,
    Object? products = freezed,
  }) {
    return _then(_$_Default(
      initialShoppingList: initialShoppingList == freezed
          ? _value.initialShoppingList
          : initialShoppingList // ignore: cast_nullable_to_non_nullable
              as ShoppingList?,
      style: style == freezed
          ? _value.style
          : style // ignore: cast_nullable_to_non_nullable
              as ShoppingListStyle,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      productName: productName == freezed
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      products: products == freezed
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product>,
    ));
  }
}

/// @nodoc

class _$_Default implements _Default {
  const _$_Default(
      {this.initialShoppingList,
      this.style = ShoppingListStyle.unknown,
      this.name = '',
      this.productName = '',
      final List<Product> products = const []})
      : _products = products;

  @override
  final ShoppingList? initialShoppingList;
  @override
  @JsonKey()
  final ShoppingListStyle style;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String productName;
  final List<Product> _products;
  @override
  @JsonKey()
  List<Product> get products {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  String toString() {
    return 'EditListScreenState(initialShoppingList: $initialShoppingList, style: $style, name: $name, productName: $productName, products: $products)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Default &&
            const DeepCollectionEquality()
                .equals(other.initialShoppingList, initialShoppingList) &&
            const DeepCollectionEquality().equals(other.style, style) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.productName, productName) &&
            const DeepCollectionEquality().equals(other._products, _products));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(initialShoppingList),
      const DeepCollectionEquality().hash(style),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(productName),
      const DeepCollectionEquality().hash(_products));

  @JsonKey(ignore: true)
  @override
  _$$_DefaultCopyWith<_$_Default> get copyWith =>
      __$$_DefaultCopyWithImpl<_$_Default>(this, _$identity);
}

abstract class _Default implements EditListScreenState {
  const factory _Default(
      {final ShoppingList? initialShoppingList,
      final ShoppingListStyle style,
      final String name,
      final String productName,
      final List<Product> products}) = _$_Default;

  @override
  ShoppingList? get initialShoppingList => throw _privateConstructorUsedError;
  @override
  ShoppingListStyle get style => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get productName => throw _privateConstructorUsedError;
  @override
  List<Product> get products => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_DefaultCopyWith<_$_Default> get copyWith =>
      throw _privateConstructorUsedError;
}
