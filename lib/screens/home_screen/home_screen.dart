import 'package:fitnest_x/data/model/home_popup_menu_item.dart';
import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:fitnest_x/res/views/app_fab.dart';
import 'package:fitnest_x/res/views/app_navigation_bar.dart';
import 'package:fitnest_x/res/views/search_popup_menu.dart';
import 'package:fitnest_x/screens/activity_tracker/activity_tracker_screen.dart';
import 'package:fitnest_x/screens/home_tab/home_tab.dart';
import 'package:fitnest_x/screens/meal_planner_screen/meal_planner_screen.dart';
import 'package:fitnest_x/screens/profile_tab/profile_tab.dart';
import 'package:fitnest_x/screens/progress_tracker_tab/progress_tracker_tab.dart';
import 'package:fitnest_x/screens/sleep_tracker_screen/sleep_tracker_screen.dart';
import 'package:fitnest_x/screens/workout_tracker/workout_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const _kPopupAnimDuration = Duration(milliseconds: 200);

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late final TabController tabController;
  late final AnimationController animationController;
  bool showSearchPopup = false;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this)
      ..addListener(_tabControllerListener);
    animationController =
        AnimationController(vsync: this, duration: _kPopupAnimDuration)
          ..addStatusListener(_animStatusListener);
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

    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
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
                  ActivityTrackerScreen(onBackPressed: () => _onTabSelect(0)),
                  ProgressTrackerTab(onBackPressed: () => _onTabSelect(0)),
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
                    child: SearchPopupMenu(
                      items: HomePopupMenuItem.values,
                      onSelectItem: _onPopupItemSelected,
                    ),
                  ))
          ],
        ),
        bottomNavigationBar: AppNavigationBar(
          currentIndex: tabController.index,
          onSelect: _onTabSelect,
        ),
        floatingActionButton: AppFab.search(onPressed: _onFabPressed),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
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

  void _onPopupItemSelected(HomePopupMenuItem item) {
    animationController.reverse();
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => item.destinationScreen));
  }

  void _tabControllerListener() =>
      setState(() => currentIndex = tabController.index);

  void _animStatusListener(AnimationStatus status) {
    if (status == AnimationStatus.dismissed) {
      setState(() => showSearchPopup = false);
    }
  }

  Future<bool> _onBackPressed() async {
    if (currentIndex != 0) {
      tabController.animateTo(0);
      return false;
    }
    return true;
  }
}

extension _HomePopupMenuItemExtension on HomePopupMenuItem {
  Widget get destinationScreen {
    switch (this) {
      case HomePopupMenuItem.workout:
        return const WorkoutScreen();
      case HomePopupMenuItem.mealPlanner:
        return const MealPlannerScreen();
      case HomePopupMenuItem.sleepTracker:
        return const SleepTrackerScreen();
    }
  }
}
