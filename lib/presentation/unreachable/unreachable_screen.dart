import 'package:flutter/material.dart';

import '../core/app_bar.dart';

class UnreachableScreen extends StatelessWidget {
  final RouteSettings settings;

  const UnreachableScreen({
    super.key,
    required this.settings,
  });

  static Route<void> route(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (_) => UnreachableScreen(settings: settings),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: QAppBar(
        title: const Text('⚠️ Oops'),
      ),
      body: Text(
        "If you're seeing this, then you're probably in a wrong place\n"
        'You might want to file this as an issue on {urlheresoon}\n'
        'settings.name: ${settings.name}\n'
        'settings.arguments: ${settings.arguments}',
      ),
    );
  }
}
