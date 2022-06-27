import 'package:fitnest_x/data/model/sleep_schedule_item_content.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:fitnest_x/res/views/app_date_picker.dart';
import 'package:fitnest_x/res/views/section_title.dart';
import 'package:fitnest_x/res/views/sleep_schedule/sleep_estimate_card.dart';
import 'package:fitnest_x/res/views/sleep_tracker/sleep_schedule_card.dart';
import 'package:fitnest_x/utils/data_mock_utils.dart';
import 'package:flutter/material.dart';

const _titleText = 'Your Schedule';

class SleepScheduleBlock extends StatelessWidget {
  const SleepScheduleBlock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final schedule = DataMockUtils.getMockSleepSchedule();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: kHorizontalPadding20,
          child: SectionTitle.noAction(text: _titleText),
        ),
        AppWhiteSpace.value15.vertical,
        AppDayPicker(
            screenWidth: MediaQuery.of(context).size.width,
            initialDate: DateTime.now()),
        AppWhiteSpace.value30.vertical,
        ..._buildContent(context, schedule),
        AppWhiteSpace.value20.vertical,
        const Padding(
          padding: kHorizontalPadding20,
          child: SleepEstimateCard(
            optimalSleepDuration: Duration(hours: 8, minutes: 30),
            estimatedSleepDuration: Duration(hours: 8, minutes: 10),
          ),
        )
      ],
    );
  }

  List<Widget> _buildContent(
      BuildContext context, List<SleepScheduleItemContent> data) {
    final result = <Widget>[];

    for (int i = 0; i < data.length; i++) {
      result.add(Padding(
        padding: kHorizontalPadding20,
        child: SleepScheduleCard(
          data: data[i],
        ),
      ));
      if (i != data.length - 1) {
        result.add(AppWhiteSpace.value15.vertical);
      }
    }
    return result;
  }
}
