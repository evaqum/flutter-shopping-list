import 'package:flutter/material.dart';

import '../../../utils/helpers/extensions.dart';

class IntroPage extends StatelessWidget {
  final String header;
  final String? subheader;
  final Widget? child;
  const IntroPage({
    super.key,
    required this.header,
    this.child,
    this.subheader,
  });

  @override
  Widget build(BuildContext context) {
    FontWeight.w100;
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (child != null) ...[
          Expanded(child: child!),
          const SizedBox(height: 16.0),
        ],
        Text(
          header,
          style: context.textTheme.headline5,
        ),
        if (subheader != null) ...[
          const SizedBox(height: 8.0),
          Text(
            subheader!,
            style: context.textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ]
      ],
    );
  }
}
