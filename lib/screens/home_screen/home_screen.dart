import 'package:fitnest_x/data/model/search_popup_menu_item.dart';
import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:fitnest_x/res/theme/app_icons.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:fitnest_x/res/views/app_fab.dart';
import 'package:fitnest_x/res/views/app_navigation_bar.dart';
import 'package:fitnest_x/res/views/search_popup_menu.dart';
import 'package:fitnest_x/screens/home_tab/home_tab.dart';
import 'package:fitnest_x/screens/meal_planner_screen/meal_planner_screen.dart';
import 'package:fitnest_x/screens/profile_tab/profile_tab.dart';
import 'package:fitnest_x/screens/workout_tracker/workout_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const _kPopupAnimDuration = Duration(milliseconds: 200);
const _workoutTrackerText = 'Workout Tracker';
const _mealPlannerText = 'Meal Planner';
const _sleepTrackerText = 'Sleep Tracker';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late final TabController tabController;
  late final AnimationController animationController;
  late final List<SearchPopupMenuItem> popupMenuItems;
  bool showSearchPopup = false;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this)
      ..addListener(() => setState(() => currentIndex = tabController.index));
    animationController =
        AnimationController(vsync: this, duration: _kPopupAnimDuration)
          ..addStatusListener((status) {
            if (status == AnimationStatus.dismissed) {
              setState(() => showSearchPopup = false);
            }
          });
    popupMenuItems = [
      SearchPopupMenuItem(
          iconData: AppIcons.chart_filled,
          title: _workoutTrackerText,
          onPressed: () {
            animationController.reverse();
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const WorkoutScreen()));
          }),
      SearchPopupMenuItem(
          iconData: AppIcons.game_filled,
          title: _mealPlannerText,
          onPressed: () {
            animationController.reverse();
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const MealPlannerScreen()));
          }),
      SearchPopupMenuItem(
          iconData: AppIcons.discount_filled,
          title: _sleepTrackerText,
          onPressed: animationController.reverse),
    ];
  }

  @override
  void dispose() {
    tabController.dispose();
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.white,
      statusBarIconBrightness: Brightness.dark,
    ));

    return Scaffold(
      body: Stack(
        children: [
          GestureDetector(
            onTap: () {
              if (showSearchPopup) {
                animationController.reverse();
              }
            },
            child: TabBarView(
              controller: tabController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                const HomeTab(),
                const Center(
                  child: Text('Activity Tab'),
                ),
                const Center(
                  child: Text('Camera Tab'),
                ),
                ProfileTab(onBackPressed: () => _onTabSelect(0))
              ],
            ),
          ),
          if (showSearchPopup)
            Positioned(
                bottom: kFabTopOffset + 10,
                left: (MediaQuery.of(context).size.width -
                        SearchPopupMenu.width) /
                    2,
                child: AnimatedBuilder(
                  animation: animationController,
                  builder: (context, child) => Transform.scale(
                      scale: Curves.easeInOutCubic
                          .transform(animationController.value),
                      child: child!),
                  child: SearchPopupMenu(items: popupMenuItems),
                ))
        ],
      ),
      bottomNavigationBar: AppNavigationBar(
        currentIndex: tabController.index,
        onSelect: _onTabSelect,
      ),
      floatingActionButton: AppFab.search(onPressed: _onFabPressed),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  void _onFabPressed() {
    if (!showSearchPopup) {
      setState(() => showSearchPopup = true);
      animationController.forward();
      return;
    }

    animationController.reverse();
  }

  void _onTabSelect(int index) => tabController.animateTo(index);
}
