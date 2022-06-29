import 'package:fitnest_x/res/theme/constants.dart';
import 'package:fitnest_x/res/views/progress_result/average_progress.dart';
import 'package:fitnest_x/res/views/progress_result/photo_comparison.dart';
import 'package:flutter/material.dart';

class ProgressResultPhotoBlock extends StatelessWidget {
  const ProgressResultPhotoBlock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AverageProgress(percent: 0.62),
        AppWhiteSpace.value30.vertical,
        const PhotoComparison()
      ],
    );
  }
}
