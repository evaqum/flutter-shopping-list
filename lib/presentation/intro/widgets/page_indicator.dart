import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiver/time.dart';

import '../../../application/intro_screen/cubit.dart';
import '../../../utils/helpers/extensions.dart';

class PageIndicator extends StatelessWidget {
  final int pagesLength;
  const PageIndicator({super.key, required this.pagesLength});

  @override
  Widget build(BuildContext context) {
    int currentPage = context.select(
      (IntroScreenCubit cubit) => cubit.state.currentPageIndex,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        pagesLength,
        (index) => _PageIndicatorDot(index == currentPage),
      ),
    );
  }
}

class _PageIndicatorDot extends StatelessWidget {
  final bool isActive;
  const _PageIndicatorDot(this.isActive);

  @override
  Widget build(BuildContext context) {
    Color color = context.theme.colorScheme.primary;
    return Padding(
      padding: const EdgeInsets.only(right: 6.0),
      child: AnimatedContainer(
        curve: Curves.decelerate,
        duration: aMillisecond * 300,
        // curve: Curves.easeInOutCubic,
        width: isActive ? 36.0 : 8.0,
        height: 8.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: isActive ? color : color.withOpacity(0.33),
        ),
      ),
    );
  }
}
