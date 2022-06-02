import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:fitnest_x/res/views/fitnest_sliver_app_bar.dart';
import 'package:fitnest_x/res/views/secondary_button.dart';
import 'package:flutter/material.dart';

const _titleText = 'Workout Tracker';
const _kRelativeSliverAppBarHeight = 0.4;
const _kBgImageAssetPath = 'assets/images/workout_graph.png';

//TODO: Rework schedule card
const _kButtonHeight = 30.0;
const _kBgOpacity = 0.2;
const _scheduleText = 'Daily Workout Schedule';
const _buttonText = 'Check';
const _kCardPadding = EdgeInsets.symmetric(horizontal: 20, vertical: 15);

class WorkoutScreen extends StatefulWidget {
  const WorkoutScreen({Key? key}) : super(key: key);

  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  late final ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

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
            child: Container(
          margin: kHorizontalPadding,
          padding: _kCardPadding,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kBorderRadiusMedium),
              gradient: LinearGradient(colors: [
                AppColors.blue2.withOpacity(_kBgOpacity),
                AppColors.blue.withOpacity(_kBgOpacity)
              ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(_scheduleText,
                style: textTheme.bodyText2?.copyWith(
                    fontWeight: FontWeight.w600, color: AppColors.black)),
            SecondaryButton.blue(
              text: _buttonText,
              onPressed: () {},
              height: _kButtonHeight,
              textStyle: textTheme.subtitle1?.copyWith(color: AppColors.white),
            )
          ]),
        )),
        SliverToBoxAdapter(
            child: Container(
                height: 150,
                margin: const EdgeInsets.all(20),
                color: AppColors.blue)),
        SliverToBoxAdapter(
            child: Container(
                height: 200,
                margin: const EdgeInsets.all(20),
                color: AppColors.blue2)),
        SliverToBoxAdapter(
            child: Container(
                height: 100,
                margin: const EdgeInsets.all(20),
                color: AppColors.purple2)),
        SliverToBoxAdapter(
            child: Container(
                height: 300,
                margin: const EdgeInsets.all(20),
                color: AppColors.blue)),
        SliverToBoxAdapter(
            child: Container(
                height: 150,
                margin: const EdgeInsets.all(20),
                color: AppColors.purple)),
        SliverToBoxAdapter(
            child: Container(
                height: 250,
                margin: const EdgeInsets.all(20),
                color: AppColors.blue3))
      ]),
    );
  }
}
