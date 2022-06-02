import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:fitnest_x/res/views/primary_button.dart';
import 'package:fitnest_x/screens/onboarding_screen/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const _subtitleText = 'Everybody Can Train';
const _getStartedText = 'Get Started';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));

    return Scaffold(
      body: SizedBox.expand(
        child: Stack(alignment: Alignment.center, children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RichText(
                text: TextSpan(
                    text: 'Fitnest',
                    style: textTheme.headline1?.copyWith(fontSize: 36),
                    children: [
                      TextSpan(
                          text: 'X',
                          style: textTheme.headline1
                              ?.copyWith(fontSize: 48, color: AppColors.purple))
                    ]),
              ),
              Text(_subtitleText,
                  style: textTheme.bodyText1
                      ?.copyWith(fontSize: 18, color: AppColors.gray1))
            ],
          ),
          Positioned(
              left: 0,
              right: 0,
              bottom: 70,
              child: PrimaryButton.blue(
                text: _getStartedText,
                onPressed: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const OnboardingScreen())),
                margin: kHorizontalPadding,
              ))
        ]),
      ),
    );
  }
}
