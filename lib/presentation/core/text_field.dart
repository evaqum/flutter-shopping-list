import 'package:flutter/material.dart';

class QTextField extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final void Function(String)? onChanged;
  final String? initialValue;
  final FocusNode? focusNode;

  const QTextField({
    super.key,
    this.width,
    this.height,
    this.backgroundColor,
    this.onChanged,
    this.initialValue,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                decoration: const InputDecoration.collapsed(hintText: ''),
                initialValue: initialValue,
                focusNode: focusNode,
                onChanged: onChanged,
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
