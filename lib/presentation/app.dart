import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../application/app/cubit.dart';
import '../injection.dart';
import '../routing/router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AppCubit>(),
      child: const _AppView(),
    );
  }
}

class _AppView extends StatelessWidget {
  const _AppView();

  @override
  Widget build(BuildContext context) {
    bool seenIntro = context.select((AppCubit cubit) => cubit.state.seenIntro);

    return MaterialApp(
      initialRoute: seenIntro ? QRouter.overviewRoute : QRouter.introRoute,
      onGenerateRoute: QRouter.onGenerateRoute,
      theme: ThemeData(useMaterial3: true),
    );
  }
}
