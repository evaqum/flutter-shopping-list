import 'package:flutter/material.dart';

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
      appBar: AppBar(
        title: const Text('⚠️ Oops'),
      ),
      body: Text(
        "This route shouldn't be reached\n\n"
        "This usually means that either the route with given name doesn't exist\n"
        'or arguments passed to that route were incorrect\n\n'
        '<RouteSettings>.name: ${settings.name}\n'
        '<RouteSettings>.arguments: ${settings.arguments}',
      ),
    );
  }
}
