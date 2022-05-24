import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../data/barcode_repository.dart';

part 'cubit.freezed.dart';
part 'state.dart';

@injectable
class BarcodeScanScreenCubit extends Cubit<BarcodeScanScreenState> {
  final BarcodeRepository repository;
  BarcodeScanScreenCubit(this.repository) : super(const BarcodeScanScreenState());

  void foundBarcode(Barcode barcode, _) async {
    if (barcode.rawValue == null) {
      return;
    }

    if (state.status != BarcodeScanScreenStatus.lookingForBarcode) {
      return;
    }

    emit(state.copyWith(
      status: BarcodeScanScreenStatus.fetchingBarcodeInfo,
      scannedBarcode: barcode.rawValue,
    ));
    try {
      String? product = await repository.resolveBarcode(barcode.rawValue);

      if (isClosed) {
        return;
      }

      emit(state.copyWith(
        status: product == null ? BarcodeScanScreenStatus.unresolvedBarcode : BarcodeScanScreenStatus.resolvedBarcode,
        productName: product,
      ));
    } catch (e) {
      if (e is SocketException) {
        log(e.message);
      }
      emit(state.copyWith(
        status: BarcodeScanScreenStatus.failedToResolve,
        productName: '',
      ));
    }
  }
}
