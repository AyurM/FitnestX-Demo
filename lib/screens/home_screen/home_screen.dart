import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:fitnest_x/res/views/app_navigation_bar.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
      backgroundColor: AppColors.white,
      body: TabBarView(
        controller: tabController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          Center(
            child: Text('Tab 1'),
          ),
          Center(
            child: Text('Tab 2'),
          ),
          Center(
            child: Text('Tab 3'),
          ),
          Center(
            child: Text('Tab 4'),
          )
        ],
      ),
      bottomNavigationBar: AppNavigationBar(
        currentIndex: tabController.index,
        onSelect: _onTabSelect,
        onFabPressed: () {},
      ),
    );
  }

  void _onTabSelect(int index) => tabController.animateTo(index);
}
