import 'package:fitnest_x/data/model/onboarding_page_type.dart';
import 'package:fitnest_x/res/views/onboarding/onboarding_button.dart';
import 'package:fitnest_x/res/views/onboarding/onboarding_page.dart';
import 'package:fitnest_x/screens/goal_screen/goal_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late final PageController _pageController;
  int _pageIndex = 0;
  int _prevPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _pageIndex);
    _pageController.addListener(_pageControllerListener);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));

    return Scaffold(
      body: SizedBox.expand(
        child: Stack(children: [
          PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: OnboardingPageType.values
                .map((type) => OnboardingPage(pageType: type))
                .toList(),
          ),
          Positioned(
              right: 30,
              bottom: 70,
              child: OnboardingButton(
                totalPages: OnboardingPageType.values.length,
                prevPage: _prevPageIndex,
                currentPage: _pageIndex,
                onPressed: _onOnboardingButtonPressed,
              ))
        ]),
      ),
    );
  }

  void _onOnboardingButtonPressed() {
    if (_pageIndex != OnboardingPageType.values.length - 1) {
      _pageController.nextPage(
          duration: const Duration(milliseconds: 200), curve: Curves.easeInOut);
      return;
    }

    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const GoalScreen()));
  }

  void _pageControllerListener() {
    final currentPageIndex =
        _pageController.hasClients && _pageController.page != null
            ? _pageController.page!.round()
            : 0;
    if (currentPageIndex != _pageIndex) {
      setState(() {
        _prevPageIndex = _pageIndex;
        _pageIndex = _pageController.hasClients && _pageController.page != null
            ? _pageController.page!.round()
            : 0;
      });
    }
  }
}
