import 'package:fitnest_x/data/model/meal_find_content.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:fitnest_x/res/views/meal_planner/find_meal_card.dart';
import 'package:fitnest_x/res/views/section_title.dart';
import 'package:fitnest_x/screens/breakfast_screen/breakfast_screen.dart';
import 'package:fitnest_x/utils/data_mock_utils.dart';
import 'package:flutter/material.dart';

const _titleText = 'Find Something to Eat';

class FindMealBlock extends StatelessWidget {
  const FindMealBlock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final content = DataMockUtils.getMockMealFindContent();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: kHorizontalPadding20.left),
          child: const SectionTitle.noAction(text: _titleText),
        ),
        AppWhiteSpace.value15.vertical,
        SizedBox(
          height: FindMealCard.size,
          child: ListView.separated(
              padding: kHorizontalPadding20,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                if (index % 2 == 0) {
                  return FindMealCard.blue(
                      data: content[index],
                      onPressed: () =>
                          _onFindMealCardSelect(content[index], context));
                }
                return FindMealCard.purple(
                    data: content[index],
                    onPressed: () =>
                        _onFindMealCardSelect(content[index], context));
              },
              separatorBuilder: (_, __) => AppWhiteSpace.value15.horizontal,
              itemCount: content.length),
        )
      ],
    );
  }

  void _onFindMealCardSelect(MealFindContent data, BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => BreakfastScreen(title: data.mealTime.title)));
  }
}
