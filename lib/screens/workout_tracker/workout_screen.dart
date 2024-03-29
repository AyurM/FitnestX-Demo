import 'package:fitnest_x/res/views/daily_action_card.dart';
import 'package:fitnest_x/res/views/fitnest_sliver_app_bar.dart';
import 'package:fitnest_x/res/views/workout/upcoming_workout_block.dart';
import 'package:fitnest_x/res/views/workout/workout_types_block.dart';
import 'package:fitnest_x/screens/workout_schedule/workout_schedule_screen.dart';
import 'package:flutter/material.dart';

const _titleText = 'Workout Tracker';
const _scheduleText = 'Daily Workout Schedule';
const _kRelativeSliverAppBarHeight = 0.4;
const _kBgImageAssetPath = 'assets/images/workout_graph.png';

class WorkoutScreen extends StatefulWidget {
  const WorkoutScreen({Key? key}) : super(key: key);

  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
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
          title: _titleText,
          bgImageAssetPath: _kBgImageAssetPath,
          imageMargin: const EdgeInsets.fromLTRB(20, 40, 20, 0),
          expandedHeight:
              MediaQuery.of(context).size.height * _kRelativeSliverAppBarHeight,
          onMorePressed: () {},
        ),
        SliverToBoxAdapter(
          child: DailyActionCard(
              margin: const EdgeInsets.fromLTRB(20, 2, 20, 0),
              title: _scheduleText,
              onPressed: _onDailyActionTap),
        ),
        const SliverToBoxAdapter(
            child: Padding(
          padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
          child: UpcomingWorkoutBlock(),
        )),
        const SliverToBoxAdapter(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: WorkoutTypesBlock(),
        )),
      ]),
    );
  }

  void _onDailyActionTap() => Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const WorkoutScheduleScreen()));
}
