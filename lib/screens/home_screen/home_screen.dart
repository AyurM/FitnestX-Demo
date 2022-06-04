import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:fitnest_x/res/views/app_fab.dart';
import 'package:fitnest_x/res/views/app_navigation_bar.dart';
import 'package:fitnest_x/screens/home_tab/home_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this)
      ..addListener(() => setState(() => currentIndex = tabController.index));
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.white,
      statusBarIconBrightness: Brightness.dark,
    ));

    return Scaffold(
      body: TabBarView(
        controller: tabController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          HomeTab(),
          Center(
            child: Text('Activity Tab'),
          ),
          Center(
            child: Text('Camera Tab'),
          ),
          Center(
            child: Text('Profile Tab'),
          )
        ],
      ),
      bottomNavigationBar: AppNavigationBar(
        currentIndex: tabController.index,
        onSelect: _onTabSelect,
      ),
      floatingActionButton: AppFab(onPressed: () {}),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  void _onTabSelect(int index) => tabController.animateTo(index);
}
