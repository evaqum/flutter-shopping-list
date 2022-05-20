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
  static final List<Widget> _pages = [
    IntroPage(
      header: 'This DUCK is DRIPPIN',
      subheader: 'Go get some DRIP like this DUCK',
      child: Image.asset('assets/intro1.jpg'),
    ),
    IntroPage(
      header: 'Delivering toilets everywhere',
      subheader: 'Our high-quality delivery service will find you!\n'
          "Even when you don't want us to!\n"
          "And that's totally related to the topic of this app!",
      child: Image.asset('assets/intro2.jpg'),
    ),
    IntroPage(
      header: "Here's our phone",
      subheader: 'Feel free to call us at any time',
      child: Image.asset('assets/intro3.jpg'),
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
