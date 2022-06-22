import 'package:fitnest_x/res/theme/constants.dart';
import 'package:fitnest_x/res/views/breakfast_screen/meal_category_card.dart';
import 'package:fitnest_x/res/views/section_title.dart';
import 'package:fitnest_x/utils/data_mock_utils.dart';
import 'package:flutter/material.dart';

const _titleText = 'Category';

class MealCategoryBlock extends StatelessWidget {
  const MealCategoryBlock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categories = DataMockUtils.getMockMealCategories();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: kHorizontalPadding20.left),
          child: const SectionTitle.noAction(text: _titleText),
        ),
        AppWhiteSpace.value15.vertical,
        SizedBox(
          height: MealCategoryCard.size.height,
          child: ListView.separated(
              padding: kHorizontalPadding20,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                if (index % 2 == 0) {
                  return MealCategoryCard.blue(
                      data: categories[index], onPressed: () {});
                }
                return MealCategoryCard.purple(
                    data: categories[index], onPressed: () {});
              },
              separatorBuilder: (_, __) => AppWhiteSpace.value15.horizontal,
              itemCount: categories.length),
        )
      ],
    );
  }
}
