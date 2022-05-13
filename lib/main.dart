import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'application/observer.dart';
import 'hive.dart';
import 'injection.dart';
import 'presentation/app.dart';

void main() async {
  await initHive();
  await initDI();

  BlocOverrides.runZoned(
    () => runApp(const App()),
    blocObserver: AppBlocObserver(),
  );
}
