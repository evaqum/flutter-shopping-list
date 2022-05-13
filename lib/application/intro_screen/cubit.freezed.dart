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
mixin _$IntroScreenState {
  dynamic get currentPageIndex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $IntroScreenStateCopyWith<IntroScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IntroScreenStateCopyWith<$Res> {
  factory $IntroScreenStateCopyWith(
          IntroScreenState value, $Res Function(IntroScreenState) then) =
      _$IntroScreenStateCopyWithImpl<$Res>;
  $Res call({dynamic currentPageIndex});
}

/// @nodoc
class _$IntroScreenStateCopyWithImpl<$Res>
    implements $IntroScreenStateCopyWith<$Res> {
  _$IntroScreenStateCopyWithImpl(this._value, this._then);

  final IntroScreenState _value;
  // ignore: unused_field
  final $Res Function(IntroScreenState) _then;

  @override
  $Res call({
    Object? currentPageIndex = freezed,
  }) {
    return _then(_value.copyWith(
      currentPageIndex: currentPageIndex == freezed
          ? _value.currentPageIndex
          : currentPageIndex // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
abstract class _$$_DefaultCopyWith<$Res>
    implements $IntroScreenStateCopyWith<$Res> {
  factory _$$_DefaultCopyWith(
          _$_Default value, $Res Function(_$_Default) then) =
      __$$_DefaultCopyWithImpl<$Res>;
  @override
  $Res call({dynamic currentPageIndex});
}

/// @nodoc
class __$$_DefaultCopyWithImpl<$Res>
    extends _$IntroScreenStateCopyWithImpl<$Res>
    implements _$$_DefaultCopyWith<$Res> {
  __$$_DefaultCopyWithImpl(_$_Default _value, $Res Function(_$_Default) _then)
      : super(_value, (v) => _then(v as _$_Default));

  @override
  _$_Default get _value => super._value as _$_Default;

  @override
  $Res call({
    Object? currentPageIndex = freezed,
  }) {
    return _then(_$_Default(
      currentPageIndex: currentPageIndex == freezed
          ? _value.currentPageIndex
          : currentPageIndex,
    ));
  }
}

/// @nodoc

class _$_Default implements _Default {
  const _$_Default({this.currentPageIndex = 0});

  @override
  @JsonKey()
  final dynamic currentPageIndex;

  @override
  String toString() {
    return 'IntroScreenState(currentPageIndex: $currentPageIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Default &&
            const DeepCollectionEquality()
                .equals(other.currentPageIndex, currentPageIndex));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(currentPageIndex));

  @JsonKey(ignore: true)
  @override
  _$$_DefaultCopyWith<_$_Default> get copyWith =>
      __$$_DefaultCopyWithImpl<_$_Default>(this, _$identity);
}

abstract class _Default implements IntroScreenState {
  const factory _Default({final dynamic currentPageIndex}) = _$_Default;

  @override
  dynamic get currentPageIndex => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_DefaultCopyWith<_$_Default> get copyWith =>
      throw _privateConstructorUsedError;
}
