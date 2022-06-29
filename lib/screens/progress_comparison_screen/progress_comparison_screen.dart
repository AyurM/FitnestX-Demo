import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:fitnest_x/res/theme/app_icons.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:fitnest_x/res/views/primary_button.dart';
import 'package:fitnest_x/res/views/simple_app_scaffold.dart';
import 'package:fitnest_x/res/views/workout_details_button.dart';
import 'package:fitnest_x/screens/progress_result_screen/progress_result_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const _titleText = 'Comparison';
const _buttonTitleText = 'Select Month';
const _compareText = 'Compare';

class ProgressComparisonScreen extends StatelessWidget {
  const ProgressComparisonScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final subtitle1 = DateFormat('MMMM').format(DateTime.now());

    return SimpleAppScaffold(
        title: _titleText,
        body: Padding(
          padding: kHorizontalPadding20,
          child: Column(
            children: [
              AppWhiteSpace.value30.vertical,
              WorkoutDetailsButton(
                  iconData: AppIcons.calendar_outlined,
                  title: '$_buttonTitleText 1',
                  subtitle: subtitle1,
                  backgroundColor: AppColors.borderColor,
                  onPressed: () {}),
              AppWhiteSpace.value10.vertical,
              WorkoutDetailsButton(
                  iconData: AppIcons.calendar_outlined,
                  title: '$_buttonTitleText 2',
                  subtitle: _buttonTitleText,
                  backgroundColor: AppColors.borderColor,
                  onPressed: () {}),
              const Spacer(),
              PrimaryButton.blue(
                  text: _compareText,
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProgressResultScreen()))),
              AppWhiteSpace.value40.vertical,
            ],
          ),
        ));
  }
}
