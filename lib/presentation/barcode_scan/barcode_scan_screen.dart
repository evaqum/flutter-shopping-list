import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../application/barcode_scan_screen/cubit.dart';
import '../../application/shopping_list_screen/cubit.dart';
import '../../injection.dart';
import '../../utils/helpers/extensions.dart';

class BarcodeScanScreen extends StatelessWidget {
  final ShoppingListScreenCubit shoppingListScreenCubit;
  const BarcodeScanScreen({super.key, required this.shoppingListScreenCubit});

  static Route<void> route(ShoppingListScreenCubit shoppingListScreenCubit) {
    return MaterialPageRoute(
      builder: (_) => BarcodeScanScreen(shoppingListScreenCubit: shoppingListScreenCubit),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<BarcodeScanScreenCubit>(),
      child: _BarcodeScanView(shoppingListScreenCubit),
    );
  }
}

class _BarcodeScanView extends StatelessWidget {
  final ShoppingListScreenCubit shoppingListScreenCubit;
  const _BarcodeScanView(this.shoppingListScreenCubit);

  String getMessageForStatus(BarcodeScanScreenCubit cubit) {
    switch (cubit.state.status) {
      case BarcodeScanScreenStatus.lookingForBarcode:
        return 'Looking for barcode 👀';
      case BarcodeScanScreenStatus.fetchingBarcodeInfo:
        return 'Getting info...';
      case BarcodeScanScreenStatus.unresolvedBarcode:
        return 'Barcode is not found';
      case BarcodeScanScreenStatus.resolvedBarcode:
        return 'ADD ${cubit.state.productName}';
      case BarcodeScanScreenStatus.failedToResolve:
        return 'Failed to resolve barcode';
    }
  }

  @override
  Widget build(BuildContext context) {
    BarcodeScanScreenCubit cubit = context.watch();
    final state = cubit.state;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white10,
        title: const Text('Barcode scanner'),
      ),
      body: Stack(
        children: [
          MobileScanner(
            allowDuplicates: false,
            onDetect: cubit.foundBarcode,
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Material(
                  type: MaterialType.transparency,
                  child: Ink(
                    height: 54.0,
                    color: state.status.isResolved ? Colors.green : Colors.grey,
                    child: InkWell(
                      onTap: state.status.isResolved
                          ? () {
                              shoppingListScreenCubit.newProductFromBarcode(state.productName!);
                              context.navigator.pop();
                            }
                          : null,
                      child: Center(
                        child: Text(getMessageForStatus(cubit)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
