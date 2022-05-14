import 'package:flutter/material.dart';

import '../../utils/helpers/extensions.dart';

class QTextField extends StatelessWidget {
  final double? width;
  final double height;
  final Color? backgroundColor;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final String? initialValue;
  final FocusNode? focusNode;
  final String? hintText;

  const QTextField({
    super.key,
    this.width,
    this.height = 64.0,
    this.backgroundColor,
    this.onChanged,
    this.initialValue,
    this.focusNode,
    this.hintText,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor ?? context.theme.colorScheme.surfaceVariant,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                decoration: InputDecoration.collapsed(hintText: hintText ?? ''),
                initialValue: initialValue,
                focusNode: focusNode,
                onChanged: onChanged,
                onFieldSubmitted: onSubmitted,
                style: const TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
