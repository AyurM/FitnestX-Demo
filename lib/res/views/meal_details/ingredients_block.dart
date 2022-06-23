import 'package:fitnest_x/res/theme/constants.dart';
import 'package:fitnest_x/res/views/meal_details/ingredient_card.dart';
import 'package:fitnest_x/res/views/section_title.dart';
import 'package:fitnest_x/utils/data_mock_utils.dart';
import 'package:flutter/material.dart';

const _titleText = 'Ingredients That You\nWill Need';
const _itemsText = ' items';
const _kIngredientTextSpacing = 50.0;

class IngredientsBlock extends StatelessWidget {
  const IngredientsBlock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ingredients = DataMockUtils.getMockIngredients();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: kHorizontalPadding20,
          child: SectionTitle.simpleText(
              text: _titleText,
              subtitle: '${ingredients.length} $_itemsText',
              context: context),
        ),
        AppWhiteSpace.value15.vertical,
        SizedBox(
          height: IngredientCard.size + _kIngredientTextSpacing,
          child: ListView.separated(
              padding: kHorizontalPadding20,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) =>
                  IngredientCard(data: ingredients[index]),
              separatorBuilder: (_, __) => AppWhiteSpace.value15.horizontal,
              itemCount: ingredients.length),
        )
      ],
    );
  }
}
