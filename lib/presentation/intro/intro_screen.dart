import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/intro_screen/cubit.dart';
import '../../injection.dart';
import 'widgets/intro_page.dart';
import 'widgets/next_button.dart';
import 'widgets/page_indicator.dart';
import 'widgets/skip_button.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const IntroScreen());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<IntroScreenCubit>(),
      child: _IntroScreenView(),
    );
  }
}

class _IntroScreenView extends StatelessWidget {
  final PageController _pageController = PageController();
  static const List<Widget> _pages = [
    IntroPage(
      header: 'Shopping might be boring',
      subheader: 'Dude just buy stuff with delivery',
    ),
    IntroPage(
      header: "I'm making this for experience",
      subheader:
          'Actually I just want a job so I could buy a lot of funny stuff\n'
          'and maybe leave this country',
    ),
    IntroPage(
      header: 'NACHINAEM?',
      subheader: 'POGGers',
      child: FlutterLogo(
        style: FlutterLogoStyle.markOnly,
        size: 256.0,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SkipButton(
            pagesLength: _pages.length,
            pageController: _pageController,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: PageView(
                controller: _pageController,
                onPageChanged: context.read<IntroScreenCubit>().pageChanged,
                children: _pages,
              ),
            ),
          ),
          PageIndicator(pagesLength: _pages.length),
          NextButton(
            pagesLength: _pages.length,
            pageController: _pageController,
          ),
        ],
      ),
    );
  }
}
