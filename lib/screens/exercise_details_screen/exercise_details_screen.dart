import 'package:fitnest_x/data/model/workout/exercise_data.dart';
import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:fitnest_x/res/theme/app_icons.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:fitnest_x/res/views/exercise_details_screen/exercise_details_header.dart';
import 'package:fitnest_x/res/views/exercise_details_screen/exercise_steps_block.dart';
import 'package:fitnest_x/res/views/simple_app_scaffold.dart';
import 'package:fitnest_x/res/views/exercise_details_screen/exercise_description.dart';
import 'package:fitnest_x/res/views/workout_type_screen/exercise_repetition_block.dart';
import 'package:flutter/material.dart';

const _kVideoAspectRatio = 16 / 9;
const _kIconSize = 36.0;

class ExerciseDetailsScreen extends StatelessWidget {
  final ExerciseData exercise;

  const ExerciseDetailsScreen({Key? key, required this.exercise})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleAppScaffold(
        title: '',
        leadingIcon: Icons.close,
        body: SingleChildScrollView(
          padding: kHorizontalPadding20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppWhiteSpace.value30.vertical,
              const _ExerciseVideoMock(),
              AppWhiteSpace.value20.vertical,
              ExerciseDetailsHeader(exercise: exercise),
              AppWhiteSpace.value30.vertical,
              const ExerciseDescription(),
              AppWhiteSpace.value30.vertical,
              const ExerciseStepsBlock(),
              const ExerciseRepetitionsBlock(),
              AppWhiteSpace.value40.vertical,
            ],
          ),
        ));
  }
}

class _ExerciseVideoMock extends StatelessWidget {
  const _ExerciseVideoMock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: ((context, constraints) {
      final height = constraints.maxWidth / _kVideoAspectRatio;

      return SizedBox(
        width: constraints.maxWidth,
        height: height,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(AppBorderRadius.value22.value),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration:
                    const BoxDecoration(gradient: AppColors.blueGradient),
              ),
              Positioned(
                  bottom: -height * 0.3,
                  child: Image.asset(
                    'assets/images/fullbody_workout.png',
                    errorBuilder: (context, error, stackTrace) =>
                        Container(color: Colors.red),
                    height: height * 1.25,
                  )),
              Container(
                width: double.infinity,
                height: double.infinity,
                color: AppColors.black.withOpacity(0.3),
              ),
              RawMaterialButton(
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  elevation: 0,
                  highlightElevation: 0,
                  shape: const CircleBorder(),
                  constraints: const BoxConstraints(
                      minHeight: _kIconSize, minWidth: _kIconSize),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  child: const Icon(AppIcons.play_filled,
                      color: AppColors.white, size: _kIconSize))
            ],
          ),
        ),
      );
    }));
  }
}
