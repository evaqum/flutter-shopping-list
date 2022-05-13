import 'package:flutter/material.dart';

import '../../../domain/lists/list.dart';

class StyleCard extends StatelessWidget {
  final ShoppingListStyle style;
  final void Function()? onTap;
  const StyleCard({
    required this.style,
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        color: style.color,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: InkWell(
        hoverColor: Colors.white10,
        splashColor: Colors.white10,
        borderRadius: BorderRadius.circular(12.0),
        onTap: onTap,
        child: Center(
          child: Text(
            style.emoji,
            style: const TextStyle(fontSize: 28.0),
          ),
        ),
      ),
    );
  }
}
