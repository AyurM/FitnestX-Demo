import 'package:fitnest_x/data/model/sleep_schedule_item_content.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:fitnest_x/res/views/section_title.dart';
import 'package:fitnest_x/res/views/sleep_tracker/sleep_schedule_card.dart';
import 'package:fitnest_x/utils/data_mock_utils.dart';
import 'package:flutter/material.dart';

const _titleText = 'Today Schedule';

class TodaySleepScheduleBlock extends StatelessWidget {
  const TodaySleepScheduleBlock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final schedule = DataMockUtils.getMockSleepSchedule();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle.noAction(text: _titleText),
        AppWhiteSpace.value15.vertical,
        ..._buildContent(context, schedule)
      ],
    );
  }

  List<Widget> _buildContent(
      BuildContext context, List<SleepScheduleItemContent> data) {
    final result = <Widget>[];

    for (int i = 0; i < data.length; i++) {
      result.add(SleepScheduleCard(
        data: data[i],
      ));
      if (i != data.length - 1) {
        result.add(AppWhiteSpace.value15.vertical);
      }
    }
    return result;
  }
}
