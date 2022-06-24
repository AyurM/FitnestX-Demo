import 'package:fitnest_x/data/model/meal_data.dart';
import 'package:fitnest_x/res/views/fitnest_sliver_app_bar.dart';
import 'package:fitnest_x/res/views/meal_details/ingredients_block.dart';
import 'package:fitnest_x/res/views/meal_details/meal_description.dart';
import 'package:fitnest_x/res/views/meal_details/meal_details_header.dart';
import 'package:fitnest_x/res/views/meal_details/meal_nutrition_block.dart';
import 'package:fitnest_x/res/views/meal_details/recipe_steps_block.dart';
import 'package:fitnest_x/res/views/primary_button.dart';
import 'package:flutter/material.dart';

const _kRelativeSliverAppBarHeight = 0.47;
const _kBgImageMargin = EdgeInsets.fromLTRB(44, 120, 44, 0);
const _kButtonText = 'Add to Breakfast Meal';

class MeelDetailsScreen extends StatefulWidget {
  final MealData data;

  const MeelDetailsScreen({Key? key, required this.data}) : super(key: key);

  @override
  State<MeelDetailsScreen> createState() => _MeelDetailsScreenState();
}

class _MeelDetailsScreenState extends State<MeelDetailsScreen> {
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
    return Scaffold(
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          FitnestSliverAppBar(
            parentScrollController: scrollController,
            title: '',
            bgImageAssetPath: widget.data.assetPath,
            imageMargin: _kBgImageMargin,
            expandedHeight: MediaQuery.of(context).size.height *
                _kRelativeSliverAppBarHeight,
            showBgEllipse: true,
            onMorePressed: () {},
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 30),
              child: MealDetailsHeader(data: widget.data),
            ),
          ),
          const SliverToBoxAdapter(
            child: MealNutritionBlock(),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: MealDescription(),
            ),
          ),
          const SliverToBoxAdapter(
            child: IngredientsBlock(),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
              child: RecipeStepsBlock(),
            ),
          ),
          SliverToBoxAdapter(
            child: PrimaryButton.blue(
                text: _kButtonText,
                onPressed: () {},
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 40)),
          )
        ],
      ),
    );
  }
}
