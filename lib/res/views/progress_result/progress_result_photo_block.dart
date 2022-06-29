import 'package:fitnest_x/res/theme/constants.dart';
import 'package:fitnest_x/res/views/progress_result/average_progress.dart';
import 'package:fitnest_x/res/views/progress_result/photo_comparison.dart';
import 'package:flutter/material.dart';

const _kMockPercentValue = 0.62;

class ProgressResultPhotoBlock extends StatelessWidget {
  const ProgressResultPhotoBlock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: [
          const AverageProgress(percent: _kMockPercentValue),
          AppWhiteSpace.value30.vertical,
          const PhotoComparison()
        ],
      );
}
