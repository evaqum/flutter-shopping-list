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
mixin _$ShoppingListScreenState {
  ShoppingList get shoppingList => throw _privateConstructorUsedError;
  List<Product> get products => throw _privateConstructorUsedError;
  String get newProductName => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ShoppingListScreenStateCopyWith<ShoppingListScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShoppingListScreenStateCopyWith<$Res> {
  factory $ShoppingListScreenStateCopyWith(ShoppingListScreenState value,
          $Res Function(ShoppingListScreenState) then) =
      _$ShoppingListScreenStateCopyWithImpl<$Res>;
  $Res call(
      {ShoppingList shoppingList,
      List<Product> products,
      String newProductName});

  $ShoppingListCopyWith<$Res> get shoppingList;
}

/// @nodoc
class _$ShoppingListScreenStateCopyWithImpl<$Res>
    implements $ShoppingListScreenStateCopyWith<$Res> {
  _$ShoppingListScreenStateCopyWithImpl(this._value, this._then);

  final ShoppingListScreenState _value;
  // ignore: unused_field
  final $Res Function(ShoppingListScreenState) _then;

  @override
  $Res call({
    Object? shoppingList = freezed,
    Object? products = freezed,
    Object? newProductName = freezed,
  }) {
    return _then(_value.copyWith(
      shoppingList: shoppingList == freezed
          ? _value.shoppingList
          : shoppingList // ignore: cast_nullable_to_non_nullable
              as ShoppingList,
      products: products == freezed
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product>,
      newProductName: newProductName == freezed
          ? _value.newProductName
          : newProductName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  $ShoppingListCopyWith<$Res> get shoppingList {
    return $ShoppingListCopyWith<$Res>(_value.shoppingList, (value) {
      return _then(_value.copyWith(shoppingList: value));
    });
  }
}

/// @nodoc
abstract class _$$_PrivateCopyWith<$Res>
    implements $ShoppingListScreenStateCopyWith<$Res> {
  factory _$$_PrivateCopyWith(
          _$_Private value, $Res Function(_$_Private) then) =
      __$$_PrivateCopyWithImpl<$Res>;
  @override
  $Res call(
      {ShoppingList shoppingList,
      List<Product> products,
      String newProductName});

  @override
  $ShoppingListCopyWith<$Res> get shoppingList;
}

/// @nodoc
class __$$_PrivateCopyWithImpl<$Res>
    extends _$ShoppingListScreenStateCopyWithImpl<$Res>
    implements _$$_PrivateCopyWith<$Res> {
  __$$_PrivateCopyWithImpl(_$_Private _value, $Res Function(_$_Private) _then)
      : super(_value, (v) => _then(v as _$_Private));

  @override
  _$_Private get _value => super._value as _$_Private;

  @override
  $Res call({
    Object? shoppingList = freezed,
    Object? products = freezed,
    Object? newProductName = freezed,
  }) {
    return _then(_$_Private(
      shoppingList: shoppingList == freezed
          ? _value.shoppingList
          : shoppingList // ignore: cast_nullable_to_non_nullable
              as ShoppingList,
      products: products == freezed
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product>,
      newProductName: newProductName == freezed
          ? _value.newProductName
          : newProductName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Private implements _Private {
  const _$_Private(
      {required this.shoppingList,
      required final List<Product> products,
      this.newProductName = ''})
      : _products = products;

  @override
  final ShoppingList shoppingList;
  final List<Product> _products;
  @override
  List<Product> get products {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  @JsonKey()
  final String newProductName;

  @override
  String toString() {
    return 'ShoppingListScreenState._(shoppingList: $shoppingList, products: $products, newProductName: $newProductName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Private &&
            const DeepCollectionEquality()
                .equals(other.shoppingList, shoppingList) &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            const DeepCollectionEquality()
                .equals(other.newProductName, newProductName));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(shoppingList),
      const DeepCollectionEquality().hash(_products),
      const DeepCollectionEquality().hash(newProductName));

  @JsonKey(ignore: true)
  @override
  _$$_PrivateCopyWith<_$_Private> get copyWith =>
      __$$_PrivateCopyWithImpl<_$_Private>(this, _$identity);
}

abstract class _Private implements ShoppingListScreenState {
  const factory _Private(
      {required final ShoppingList shoppingList,
      required final List<Product> products,
      final String newProductName}) = _$_Private;

  @override
  ShoppingList get shoppingList => throw _privateConstructorUsedError;
  @override
  List<Product> get products => throw _privateConstructorUsedError;
  @override
  String get newProductName => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_PrivateCopyWith<_$_Private> get copyWith =>
      throw _privateConstructorUsedError;
}
