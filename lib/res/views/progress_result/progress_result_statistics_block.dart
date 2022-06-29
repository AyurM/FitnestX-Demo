import 'package:fitnest_x/data/model/stat_comparison_data.dart';
import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:fitnest_x/res/views/progress_result/progress_comparison_bar.dart';
import 'package:fitnest_x/utils/data_mock_utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProgressResultStatisticsBlock extends StatelessWidget {
  const ProgressResultStatisticsBlock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final dateFormat = DateFormat('MMMM');
    final textStyle = Theme.of(context)
        .textTheme
        .bodyText1
        ?.copyWith(fontWeight: FontWeight.bold, color: AppColors.gray1);

    final data = DataMockUtils.getMockStatComparisonData();

    return Column(
      children: [
        Image.asset('assets/images/stat_comparison_graph.png'),
        AppWhiteSpace.value30.vertical,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(dateFormat.format(DateTime(now.year, now.month - 1)),
                style: textStyle),
            Text(dateFormat.format(DateTime(now.year, now.month)),
                style: textStyle)
          ],
        ),
        AppWhiteSpace.value15.vertical,
        ..._buildContent(data)
      ],
    );
  }

  List<Widget> _buildContent(List<StatComparisonData> data) {
    final result = <Widget>[];

    for (int i = 0; i < data.length; i++) {
      result.add(ProgressComparisonBar(data: data[i]));
      if (i != data.length - 1) {
        result.add(AppWhiteSpace.value20.vertical);
      }
    }

    return result;
  }
}
