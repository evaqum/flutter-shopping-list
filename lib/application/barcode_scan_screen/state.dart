part of 'cubit.dart';

enum BarcodeScanScreenStatus {
  lookingForBarcode,
  fetchingBarcodeInfo,
  unresolvedBarcode,
  resolvedBarcode,
  failedToResolve;

  bool get isResolved => this == resolvedBarcode;
}

@freezed
class BarcodeScanScreenState with _$BarcodeScanScreenState {
  const factory BarcodeScanScreenState({
    String? scannedBarcode,
    String? productName,
    @Default(BarcodeScanScreenStatus.lookingForBarcode) BarcodeScanScreenStatus status,
  }) = _Default;
}
