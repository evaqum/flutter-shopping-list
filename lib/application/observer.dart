import 'dart:developer';

import 'package:bloc/bloc.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    log('STATE CHANGE:', name: 'obs:${bloc.runtimeType}');
    log('current: ${change.currentState}', name: 'obs:${bloc.runtimeType}');
    log('   next: ${change.nextState}', name: 'obs:${bloc.runtimeType}');
    super.onChange(bloc, change);
  }
}
