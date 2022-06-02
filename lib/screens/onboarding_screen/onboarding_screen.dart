import 'package:fitnest_x/data/model/onboarding_page_content.dart';
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
  final List<OnboardingPageContent> content = [
    const OnboardingPageContent(
        assetPath: 'assets/images/onboarding1.png',
        title: 'Track Your Goal',
        subtitle:
            "Don't worry if you have trouble determining your goals, we can help you determine your goals and track your goals"),
    const OnboardingPageContent(
        assetPath: 'assets/images/onboarding2.png',
        title: 'Get Burn',
        subtitle:
            "Let’s keep burning, to achive yours goals, it hurts only temporarily, if you give up now you will be in pain forever"),
    const OnboardingPageContent(
        assetPath: 'assets/images/onboarding3.png',
        title: 'Eat Well',
        subtitle:
            "Let's start a healthy lifestyle with us, we can determine your diet every day. Healthy eating is fun"),
    const OnboardingPageContent(
        assetPath: 'assets/images/onboarding4.png',
        title: 'Improve Sleep Quality',
        subtitle:
            "Improve the quality of your sleep with us, good quality sleep can bring a good mood in the morning")
  ];

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
            children: content.map((c) => OnboardingPage(content: c)).toList(),
          ),
          Positioned(
              right: 30,
              bottom: 70,
              child: OnboardingButton(
                totalPages: content.length,
                prevPage: _prevPageIndex,
                currentPage: _pageIndex,
                onPressed: _onOnboardingButtonPressed,
              ))
        ]),
      ),
    );
  }

  void _onOnboardingButtonPressed() {
    if (_pageIndex != content.length - 1) {
      _pageController.nextPage(
          duration: const Duration(milliseconds: 200), curve: Curves.easeInOut);
      return;
    }

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const GoalScreen()));
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
