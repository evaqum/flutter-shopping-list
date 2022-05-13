import 'package:flutter/material.dart';

import '../../../domain/lists/list.dart';

class StyleSelectButton extends StatelessWidget {
  final ShoppingListStyle style;
  final void Function()? onTap;
  const StyleSelectButton({super.key, required this.style, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Ink(
      height: 64.0,
      width: 64.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32.0),
        color: style.color,
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(32.0),
        child: Center(
          child: Text(
            style.emoji,
            style: const TextStyle(fontSize: 22.0),
          ),
        ),
      ),
    );
  }
}
