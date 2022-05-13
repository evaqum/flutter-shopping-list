import 'package:flutter/material.dart';

import '../../../utils/helpers/extensions.dart';

class NoListsPlaceholder extends StatelessWidget {
  const NoListsPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.shopping_bag_outlined, size: 64.0),
          const SizedBox(height: 14.0),
          Text.rich(
            const TextSpan(
              children: [
                TextSpan(text: 'no '),
                TextSpan(
                  text: 'bitches',
                  style: TextStyle(decoration: TextDecoration.lineThrough),
                ),
                TextSpan(text: ' shopping lists?'),
              ],
            ),
            style: context.textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
