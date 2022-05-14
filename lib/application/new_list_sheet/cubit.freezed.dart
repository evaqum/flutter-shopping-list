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
mixin _$NewListSheetState {
  String get name => throw _privateConstructorUsedError;
  ShoppingListStyle get listStyle => throw _privateConstructorUsedError;
  bool get showStyleSelector => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NewListSheetStateCopyWith<NewListSheetState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewListSheetStateCopyWith<$Res> {
  factory $NewListSheetStateCopyWith(
          NewListSheetState value, $Res Function(NewListSheetState) then) =
      _$NewListSheetStateCopyWithImpl<$Res>;
  $Res call({String name, ShoppingListStyle listStyle, bool showStyleSelector});
}

/// @nodoc
class _$NewListSheetStateCopyWithImpl<$Res>
    implements $NewListSheetStateCopyWith<$Res> {
  _$NewListSheetStateCopyWithImpl(this._value, this._then);

  final NewListSheetState _value;
  // ignore: unused_field
  final $Res Function(NewListSheetState) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? listStyle = freezed,
    Object? showStyleSelector = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      listStyle: listStyle == freezed
          ? _value.listStyle
          : listStyle // ignore: cast_nullable_to_non_nullable
              as ShoppingListStyle,
      showStyleSelector: showStyleSelector == freezed
          ? _value.showStyleSelector
          : showStyleSelector // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_DefaultCopyWith<$Res>
    implements $NewListSheetStateCopyWith<$Res> {
  factory _$$_DefaultCopyWith(
          _$_Default value, $Res Function(_$_Default) then) =
      __$$_DefaultCopyWithImpl<$Res>;
  @override
  $Res call({String name, ShoppingListStyle listStyle, bool showStyleSelector});
}

/// @nodoc
class __$$_DefaultCopyWithImpl<$Res>
    extends _$NewListSheetStateCopyWithImpl<$Res>
    implements _$$_DefaultCopyWith<$Res> {
  __$$_DefaultCopyWithImpl(_$_Default _value, $Res Function(_$_Default) _then)
      : super(_value, (v) => _then(v as _$_Default));

  @override
  _$_Default get _value => super._value as _$_Default;

  @override
  $Res call({
    Object? name = freezed,
    Object? listStyle = freezed,
    Object? showStyleSelector = freezed,
  }) {
    return _then(_$_Default(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      listStyle: listStyle == freezed
          ? _value.listStyle
          : listStyle // ignore: cast_nullable_to_non_nullable
              as ShoppingListStyle,
      showStyleSelector: showStyleSelector == freezed
          ? _value.showStyleSelector
          : showStyleSelector // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Default implements _Default {
  const _$_Default(
      {this.name = '',
      this.listStyle = ShoppingListStyle.unknown,
      this.showStyleSelector = false});

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final ShoppingListStyle listStyle;
  @override
  @JsonKey()
  final bool showStyleSelector;

  @override
  String toString() {
    return 'NewListSheetState(name: $name, listStyle: $listStyle, showStyleSelector: $showStyleSelector)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Default &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.listStyle, listStyle) &&
            const DeepCollectionEquality()
                .equals(other.showStyleSelector, showStyleSelector));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(listStyle),
      const DeepCollectionEquality().hash(showStyleSelector));

  @JsonKey(ignore: true)
  @override
  _$$_DefaultCopyWith<_$_Default> get copyWith =>
      __$$_DefaultCopyWithImpl<_$_Default>(this, _$identity);
}

abstract class _Default implements NewListSheetState {
  const factory _Default(
      {final String name,
      final ShoppingListStyle listStyle,
      final bool showStyleSelector}) = _$_Default;

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  ShoppingListStyle get listStyle => throw _privateConstructorUsedError;
  @override
  bool get showStyleSelector => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_DefaultCopyWith<_$_Default> get copyWith =>
      throw _privateConstructorUsedError;
}
