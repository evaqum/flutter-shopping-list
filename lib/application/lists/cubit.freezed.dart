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
mixin _$ListsState {
  List<ShoppingList> get shoppingLists => throw _privateConstructorUsedError;
  ShoppingList? get lastDeletedShoppingList =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ListsStateCopyWith<ListsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListsStateCopyWith<$Res> {
  factory $ListsStateCopyWith(
          ListsState value, $Res Function(ListsState) then) =
      _$ListsStateCopyWithImpl<$Res>;
  $Res call(
      {List<ShoppingList> shoppingLists,
      ShoppingList? lastDeletedShoppingList});

  $ShoppingListCopyWith<$Res>? get lastDeletedShoppingList;
}

/// @nodoc
class _$ListsStateCopyWithImpl<$Res> implements $ListsStateCopyWith<$Res> {
  _$ListsStateCopyWithImpl(this._value, this._then);

  final ListsState _value;
  // ignore: unused_field
  final $Res Function(ListsState) _then;

  @override
  $Res call({
    Object? shoppingLists = freezed,
    Object? lastDeletedShoppingList = freezed,
  }) {
    return _then(_value.copyWith(
      shoppingLists: shoppingLists == freezed
          ? _value.shoppingLists
          : shoppingLists // ignore: cast_nullable_to_non_nullable
              as List<ShoppingList>,
      lastDeletedShoppingList: lastDeletedShoppingList == freezed
          ? _value.lastDeletedShoppingList
          : lastDeletedShoppingList // ignore: cast_nullable_to_non_nullable
              as ShoppingList?,
    ));
  }

  @override
  $ShoppingListCopyWith<$Res>? get lastDeletedShoppingList {
    if (_value.lastDeletedShoppingList == null) {
      return null;
    }

    return $ShoppingListCopyWith<$Res>(_value.lastDeletedShoppingList!,
        (value) {
      return _then(_value.copyWith(lastDeletedShoppingList: value));
    });
  }
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> implements $ListsStateCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<ShoppingList> shoppingLists,
      ShoppingList? lastDeletedShoppingList});

  @override
  $ShoppingListCopyWith<$Res>? get lastDeletedShoppingList;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res> extends _$ListsStateCopyWithImpl<$Res>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, (v) => _then(v as _$_Initial));

  @override
  _$_Initial get _value => super._value as _$_Initial;

  @override
  $Res call({
    Object? shoppingLists = freezed,
    Object? lastDeletedShoppingList = freezed,
  }) {
    return _then(_$_Initial(
      shoppingLists: shoppingLists == freezed
          ? _value._shoppingLists
          : shoppingLists // ignore: cast_nullable_to_non_nullable
              as List<ShoppingList>,
      lastDeletedShoppingList: lastDeletedShoppingList == freezed
          ? _value.lastDeletedShoppingList
          : lastDeletedShoppingList // ignore: cast_nullable_to_non_nullable
              as ShoppingList?,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial(
      {final List<ShoppingList> shoppingLists = const [],
      this.lastDeletedShoppingList})
      : _shoppingLists = shoppingLists;

  final List<ShoppingList> _shoppingLists;
  @override
  @JsonKey()
  List<ShoppingList> get shoppingLists {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_shoppingLists);
  }

  @override
  final ShoppingList? lastDeletedShoppingList;

  @override
  String toString() {
    return 'ListsState(shoppingLists: $shoppingLists, lastDeletedShoppingList: $lastDeletedShoppingList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initial &&
            const DeepCollectionEquality()
                .equals(other._shoppingLists, _shoppingLists) &&
            const DeepCollectionEquality().equals(
                other.lastDeletedShoppingList, lastDeletedShoppingList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_shoppingLists),
      const DeepCollectionEquality().hash(lastDeletedShoppingList));

  @JsonKey(ignore: true)
  @override
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);
}

abstract class _Initial implements ListsState {
  const factory _Initial(
      {final List<ShoppingList> shoppingLists,
      final ShoppingList? lastDeletedShoppingList}) = _$_Initial;

  @override
  List<ShoppingList> get shoppingLists => throw _privateConstructorUsedError;
  @override
  ShoppingList? get lastDeletedShoppingList =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}
