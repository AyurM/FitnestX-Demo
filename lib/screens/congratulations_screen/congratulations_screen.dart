import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:fitnest_x/res/views/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const _kRelativeImageHeight = 0.4;
const _titleText = 'Congratulations, You Have Finished Your Workout';
const _quoteText =
    'Exercise is king and nutrition is queen. Combine the two and you will have a kingdom';
const _authorText = '- Jack Lalanne';
const _backText = 'Back To Home';

class CongratulationsScreen extends StatelessWidget {
  const CongratulationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.white,
      statusBarIconBrightness: Brightness.dark,
    ));
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Padding(
        padding: kHorizontalPadding20,
        child: Column(children: [
          const SizedBox(height: 65),
          Image.asset(
            'assets/images/congratulations.png',
            height: MediaQuery.of(context).size.height * _kRelativeImageHeight,
          ),
          AppWhiteSpace.value35.vertical,
          Text(_titleText,
              textAlign: TextAlign.center, style: textTheme.headline4),
          AppWhiteSpace.value15.vertical,
          Text(_quoteText,
              textAlign: TextAlign.center, style: textTheme.subtitle1),
          AppWhiteSpace.value5.vertical,
          Text(_authorText,
              textAlign: TextAlign.center, style: textTheme.subtitle1),
          const Spacer(),
          PrimaryButton.blue(
              text: _backText,
              onPressed: () =>
                  Navigator.of(context).popUntil((route) => route.isFirst)),
          AppWhiteSpace.value40.vertical,
        ]),
      ),
    );
  }
}
