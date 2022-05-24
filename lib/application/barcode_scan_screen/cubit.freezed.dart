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
mixin _$BarcodeScanScreenState {
  String? get scannedBarcode => throw _privateConstructorUsedError;
  String? get productName => throw _privateConstructorUsedError;
  BarcodeScanScreenStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BarcodeScanScreenStateCopyWith<BarcodeScanScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BarcodeScanScreenStateCopyWith<$Res> {
  factory $BarcodeScanScreenStateCopyWith(BarcodeScanScreenState value,
          $Res Function(BarcodeScanScreenState) then) =
      _$BarcodeScanScreenStateCopyWithImpl<$Res>;
  $Res call(
      {String? scannedBarcode,
      String? productName,
      BarcodeScanScreenStatus status});
}

/// @nodoc
class _$BarcodeScanScreenStateCopyWithImpl<$Res>
    implements $BarcodeScanScreenStateCopyWith<$Res> {
  _$BarcodeScanScreenStateCopyWithImpl(this._value, this._then);

  final BarcodeScanScreenState _value;
  // ignore: unused_field
  final $Res Function(BarcodeScanScreenState) _then;

  @override
  $Res call({
    Object? scannedBarcode = freezed,
    Object? productName = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      scannedBarcode: scannedBarcode == freezed
          ? _value.scannedBarcode
          : scannedBarcode // ignore: cast_nullable_to_non_nullable
              as String?,
      productName: productName == freezed
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BarcodeScanScreenStatus,
    ));
  }
}

/// @nodoc
abstract class _$$_DefaultCopyWith<$Res>
    implements $BarcodeScanScreenStateCopyWith<$Res> {
  factory _$$_DefaultCopyWith(
          _$_Default value, $Res Function(_$_Default) then) =
      __$$_DefaultCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? scannedBarcode,
      String? productName,
      BarcodeScanScreenStatus status});
}

/// @nodoc
class __$$_DefaultCopyWithImpl<$Res>
    extends _$BarcodeScanScreenStateCopyWithImpl<$Res>
    implements _$$_DefaultCopyWith<$Res> {
  __$$_DefaultCopyWithImpl(_$_Default _value, $Res Function(_$_Default) _then)
      : super(_value, (v) => _then(v as _$_Default));

  @override
  _$_Default get _value => super._value as _$_Default;

  @override
  $Res call({
    Object? scannedBarcode = freezed,
    Object? productName = freezed,
    Object? status = freezed,
  }) {
    return _then(_$_Default(
      scannedBarcode: scannedBarcode == freezed
          ? _value.scannedBarcode
          : scannedBarcode // ignore: cast_nullable_to_non_nullable
              as String?,
      productName: productName == freezed
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BarcodeScanScreenStatus,
    ));
  }
}

/// @nodoc

class _$_Default implements _Default {
  const _$_Default(
      {this.scannedBarcode,
      this.productName,
      this.status = BarcodeScanScreenStatus.lookingForBarcode});

  @override
  final String? scannedBarcode;
  @override
  final String? productName;
  @override
  @JsonKey()
  final BarcodeScanScreenStatus status;

  @override
  String toString() {
    return 'BarcodeScanScreenState(scannedBarcode: $scannedBarcode, productName: $productName, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Default &&
            const DeepCollectionEquality()
                .equals(other.scannedBarcode, scannedBarcode) &&
            const DeepCollectionEquality()
                .equals(other.productName, productName) &&
            const DeepCollectionEquality().equals(other.status, status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(scannedBarcode),
      const DeepCollectionEquality().hash(productName),
      const DeepCollectionEquality().hash(status));

  @JsonKey(ignore: true)
  @override
  _$$_DefaultCopyWith<_$_Default> get copyWith =>
      __$$_DefaultCopyWithImpl<_$_Default>(this, _$identity);
}

abstract class _Default implements BarcodeScanScreenState {
  const factory _Default(
      {final String? scannedBarcode,
      final String? productName,
      final BarcodeScanScreenStatus status}) = _$_Default;

  @override
  String? get scannedBarcode => throw _privateConstructorUsedError;
  @override
  String? get productName => throw _privateConstructorUsedError;
  @override
  BarcodeScanScreenStatus get status => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_DefaultCopyWith<_$_Default> get copyWith =>
      throw _privateConstructorUsedError;
}
