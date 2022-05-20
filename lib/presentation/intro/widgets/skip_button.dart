import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiver/time.dart';

import '../../../application/intro_screen/cubit.dart';

class SkipButton extends StatelessWidget {
  final int pagesLength;
  final PageController? pageController;

  const SkipButton({
    this.pageController,
    required this.pagesLength,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool isLastPage = context.select((IntroScreenCubit cubit) {
      return cubit.state.currentPageIndex == pagesLength - 1;
    });

    final systemPadding = MediaQuery.of(context).padding;

    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: EdgeInsets.only(
          right: 12.0,
          top: 12.0 + systemPadding.top,
        ),
        child: AnimatedOpacity(
          duration: aMillisecond * 300,
          opacity: isLastPage ? 0.0 : 1.0,
          child: Ink(
            child: InkWell(
              borderRadius: BorderRadius.circular(16.0),
              onTap: isLastPage
                  ? null
                  : () {
                      pageController?.animateToPage(
                        pagesLength - 1,
                        duration: aMillisecond * 500,
                        curve: Curves.easeInOutCubic,
                      );
                    },
              child: const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 18.0,
                  vertical: 12.0,
                ),
                child: Text(
                  'Skip',
                  style: TextStyle(color: Colors.black38),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
