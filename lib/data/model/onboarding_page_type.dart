enum OnboardingPageType {
  trackYourGoal(
      assetPath: 'assets/images/onboarding1.png',
      title: 'Track Your Goal',
      subtitle:
          "Don't worry if you have trouble determining your goals, we can help you determine your goals and track your goals"),
  getBurn(
      assetPath: 'assets/images/onboarding2.png',
      title: 'Get Burn',
      subtitle:
          "Let’s keep burning, to achive yours goals, it hurts only temporarily, if you give up now you will be in pain forever"),
  eatWell(
      assetPath: 'assets/images/onboarding3.png',
      title: 'Eat Well',
      subtitle:
          "Let's start a healthy lifestyle with us, we can determine your diet every day. Healthy eating is fun"),
  improveSleep(
      assetPath: 'assets/images/onboarding4.png',
      title: 'Improve Sleep Quality',
      subtitle:
          "Improve the quality of your sleep with us, good quality sleep can bring a good mood in the morning");

  final String assetPath;
  final String title;
  final String subtitle;

  const OnboardingPageType(
      {required this.assetPath, required this.title, required this.subtitle});
}
