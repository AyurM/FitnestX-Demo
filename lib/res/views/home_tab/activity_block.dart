import 'package:fitnest_x/res/views/home_tab/heart_rate_card.dart';
import 'package:fitnest_x/res/views/section_title.dart';
import 'package:flutter/material.dart';

const _titleText = 'Activity Status';

class ActivityBlock extends StatelessWidget {
  const ActivityBlock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: const [
        SectionTitle(text: _titleText),
        SizedBox(height: 15),
        HeartRateCard()
      ],
    );
  }
}
