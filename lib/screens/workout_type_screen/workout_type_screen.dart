import 'package:fitnest_x/data/model/workout/workout_type_content.dart';
import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:fitnest_x/res/theme/app_icons.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:fitnest_x/res/views/fitnest_sliver_app_bar.dart';
import 'package:fitnest_x/res/views/primary_button.dart';
import 'package:fitnest_x/res/views/workout_details_button.dart';
import 'package:fitnest_x/res/views/workout_type_screen/exercise_block.dart';
import 'package:fitnest_x/res/views/workout_type_screen/workout_item_block.dart';
import 'package:fitnest_x/res/views/workout_type_screen/workout_type_header.dart';
import 'package:fitnest_x/screens/workout_schedule/workout_schedule_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const _scheduleWorkoutText = 'Schedule Workout';
const _startWorkoutText = 'Start Workout';
const _difficultyText = 'Difficulty';
const _kRelativeSliverAppBarHeight = 0.425;
const _kButtonBgOpacity = 0.2;

class WorkoutTypeScreen extends StatefulWidget {
  final WorkoutTypeContent content;

  const WorkoutTypeScreen({Key? key, required this.content}) : super(key: key);

  @override
  State<WorkoutTypeScreen> createState() => _WorkoutTypeScreenState();
}

class _WorkoutTypeScreenState extends State<WorkoutTypeScreen> {
  final scrollController = ScrollController();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(controller: scrollController, slivers: [
        FitnestSliverAppBar(
          parentScrollController: scrollController,
          title: '',
          bgImageAssetPath: widget.content.backgroundImageData.path,
          imageOffset: widget.content.backgroundImageData.offset,
          imageMargin: widget.content.backgroundImageData.margin,
          expandedHeight:
              MediaQuery.of(context).size.height * _kRelativeSliverAppBarHeight,
          onMorePressed: () {},
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: kHorizontalPadding20,
            child: WorkoutTypeHeader(content: widget.content),
          ),
        ),
        SliverToBoxAdapter(
          child: _buildScheduleButton(),
        ),
        SliverToBoxAdapter(
          child: _buildDifficultyButton(),
        ),
        const SliverToBoxAdapter(
            child: Padding(
          padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
          child: WorkoutItemBlock(),
        )),
        const SliverToBoxAdapter(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: ExerciseBlock(),
        )),
        SliverToBoxAdapter(
          child: PrimaryButton.blue(
            text: _startWorkoutText,
            onPressed: Navigator.of(context).pop,
            margin: const EdgeInsets.fromLTRB(20, 0, 20, 40),
          ),
        )
      ]),
    );
  }

  Widget _buildScheduleButton() {
    final DateFormat dateFormat = DateFormat('M/d, hh:mm a');

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 15),
      child: WorkoutDetailsButton(
        iconData: AppIcons.calendar_outlined,
        title: _scheduleWorkoutText,
        subtitle: dateFormat.format(DateTime.now()),
        gradient: AppColors.blueGradientWithOpacity(_kButtonBgOpacity),
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const WorkoutScheduleScreen())),
      ),
    );
  }

  Widget _buildDifficultyButton() => Padding(
        padding: kHorizontalPadding20,
        child: WorkoutDetailsButton(
          iconData: AppIcons.swap_outlined,
          title: _difficultyText,
          subtitle: 'Beginner',
          gradient: AppColors.purpleGradientWithOpacity(_kButtonBgOpacity),
          onPressed: () {},
        ),
      );
}
