import 'package:fitnest_x/res/views/section_title.dart';
import 'package:fitnest_x/res/views/workout_type_screen/workout_item_card.dart';
import 'package:fitnest_x/utils/data_mock_utils.dart';
import 'package:flutter/material.dart';

const _youllNeedText = "You'll Need";
const _kSpacing = 15.0;

class WorkoutItemBlock extends StatelessWidget {
  const WorkoutItemBlock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final content = DataMockUtils.getMockWorkoutItemInfo();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle.simpleText(
            text: _youllNeedText,
            subtitle: '${content.length} Items',
            context: context),
        const SizedBox(height: _kSpacing),
        SizedBox(
          height: MediaQuery.of(context).size.width *
                  WorkoutItemCard.relativeItemWidth +
              _kSpacing * 2,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: content.length,
              separatorBuilder: (context, _) =>
                  const SizedBox(width: _kSpacing),
              itemBuilder: (context, i) =>
                  WorkoutItemCard(itemInfo: content[i])),
        )
      ],
    );
  }
}
