import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiver/time.dart';

import '../../../application/intro_screen/cubit.dart';
import '../../../routing/router.dart';
import '../../../utils/helpers/extensions.dart';

class NextButton extends StatelessWidget {
  final int pagesLength;
  final PageController? pageController;

  const NextButton({
    this.pageController,
    required this.pagesLength,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool isLastPage = context.select((IntroScreenCubit cubit) {
      return cubit.state.currentPageIndex == pagesLength - 1;
    });

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Ink(
        decoration: BoxDecoration(
          color: context.theme.primaryColor,
          borderRadius: BorderRadius.circular(24.0),
        ),
        width: double.infinity,
        height: 84.0,
        child: InkWell(
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.0),
          ),
          onTap: () {
            if (isLastPage) {
              context.read<IntroScreenCubit>().markAsSeen();
              context.navigator.pushReplacementNamed(QRouter.overviewRoute);
            }

            pageController?.nextPage(
              duration: aMillisecond * 500,
              curve: Curves.easeInOutCubic,
            );
          },
          child: Center(
            child: Text(
              isLastPage ? "LET'S GOO" : 'next',
              style: GoogleFonts.montserrat(
                color: context.theme.colorScheme.onPrimary,
                fontSize: 20.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
