import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute(
      builder: (_) => const SplashScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Icon(
          Icons.shopping_basket_outlined,
          size: 64.0,
        ),
      ),
    );
  }
}
