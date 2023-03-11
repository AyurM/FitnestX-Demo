import 'package:fitnest_x/data/model/onboarding_page_type.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  final OnboardingPageType pageType;

  const OnboardingPage({Key? key, required this.pageType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          pageType.assetPath,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        const SizedBox(height: 64),
        Padding(
          padding: kHorizontalPadding20,
          child: Text(pageType.title, style: textTheme.displayMedium),
        ),
        AppWhiteSpace.value15.vertical,
        Padding(
          padding: kHorizontalPadding20,
          child: Text(pageType.subtitle, style: textTheme.bodySmall),
        ),
      ],
    );
  }
}
