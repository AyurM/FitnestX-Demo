import 'package:fitnest_x/data/model/latest_activity_content.dart';
import 'package:fitnest_x/res/views/activity_tracker/latest_activity_card.dart';
import 'package:fitnest_x/res/views/section_title.dart';
import 'package:fitnest_x/utils/data_mock_utils.dart';
import 'package:flutter/material.dart';

const _latestActivityText = 'Latest Activity';
const _seeMoreText = 'See more';
const _kSpacing = 10.0;

class LatestActivityBlock extends StatelessWidget {
  const LatestActivityBlock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final latestActivityContent = DataMockUtils.getMockLatestActivityContent();

    return Column(
      children: [
        SectionTitle.textButton(
            text: _latestActivityText,
            actionText: _seeMoreText,
            context: context,
            onPressed: () {}),
        const SizedBox(height: _kSpacing),
        ..._buildContent(latestActivityContent)
      ],
    );
  }

  List<Widget> _buildContent(List<LatestActivityContent> content) {
    final result = <Widget>[];

    for (int i = 0; i < content.length; i++) {
      result.add(LatestActivityCard(data: content[i]));
      if (i != content.length - 1) {
        result.add(const SizedBox(height: _kSpacing));
      }
    }
    return result;
  }
}
