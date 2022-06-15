import 'package:fitnest_x/data/model/onboarding_page_content.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  final OnboardingPageContent content;

  const OnboardingPage({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          content.assetPath,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        const SizedBox(height: 64),
        Padding(
          padding: kHorizontalPadding20,
          child: Text(content.title, style: textTheme.headline2),
        ),
        AppWhiteSpace.value15.vertical,
        Padding(
          padding: kHorizontalPadding20,
          child: Text(content.subtitle, style: textTheme.bodyText2),
        ),
      ],
    );
  }
}
