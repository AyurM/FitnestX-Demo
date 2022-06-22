import 'package:fitnest_x/res/theme/constants.dart';
import 'package:fitnest_x/res/views/breakfast_screen/app_search_bar.dart';
import 'package:fitnest_x/res/views/breakfast_screen/diet_recommendation_block.dart';
import 'package:fitnest_x/res/views/breakfast_screen/meal_category_block.dart';
import 'package:fitnest_x/res/views/breakfast_screen/popular_meals_block.dart';
import 'package:fitnest_x/res/views/simple_app_scaffold.dart';
import 'package:flutter/material.dart';

class BreakfastScreen extends StatelessWidget {
  final String title;
  final FocusNode _searchFocusNode;

  BreakfastScreen({Key? key, required this.title})
      : _searchFocusNode = FocusNode(),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _unfocusSearch,
      child: SimpleAppScaffold(
          title: title,
          body: SingleChildScrollView(
            child: Column(children: [
              AppWhiteSpace.value30.vertical,
              Padding(
                padding: kHorizontalPadding20,
                child: AppSearchBar(
                    onChanged: _onSearchChanged, focusNode: _searchFocusNode),
              ),
              AppWhiteSpace.value30.vertical,
              const MealCategoryBlock(),
              AppWhiteSpace.value30.vertical,
              const DietRecommendationBlock(),
              AppWhiteSpace.value30.vertical,
              const Padding(
                padding: kHorizontalPadding20,
                child: PopularMealsBlock(),
              ),
              AppWhiteSpace.value30.vertical,
            ]),
          )),
    );
  }

  void _onSearchChanged(String searchQuery) =>
      debugPrint('Search: $searchQuery');

  void _unfocusSearch() {
    if (_searchFocusNode.hasFocus) {
      _searchFocusNode.unfocus();
    }
  }
}
