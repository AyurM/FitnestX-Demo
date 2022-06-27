import 'package:fitnest_x/data/model/meal/meal_data.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:fitnest_x/res/views/breakfast_screen/diet_recommendation_card.dart';
import 'package:fitnest_x/res/views/section_title.dart';
import 'package:fitnest_x/screens/meal_details_screen/meal_details_screen.dart';
import 'package:fitnest_x/utils/data_mock_utils.dart';
import 'package:flutter/material.dart';

const _titleText = 'Recommendation\nfor Diet';

class DietRecommendationBlock extends StatelessWidget {
  const DietRecommendationBlock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final recommendations = DataMockUtils.getMockDietRecommendations();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: kHorizontalPadding20.left),
          child: const SectionTitle.noAction(text: _titleText),
        ),
        AppWhiteSpace.value15.vertical,
        SizedBox(
          height: DietRecommendationCard.size.height,
          child: ListView.separated(
              padding: kHorizontalPadding20,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                if (index % 2 == 0) {
                  return DietRecommendationCard.blue(
                      data: recommendations[index],
                      onPressed: () =>
                          _openDetailsScreen(recommendations[index], context));
                }
                return DietRecommendationCard.purple(
                    data: recommendations[index],
                    onPressed: () =>
                        _openDetailsScreen(recommendations[index], context));
              },
              separatorBuilder: (_, __) => AppWhiteSpace.value15.horizontal,
              itemCount: recommendations.length),
        )
      ],
    );
  }

  void _openDetailsScreen(MealData data, BuildContext context) =>
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MealDetailsScreen(data: data)));
}
