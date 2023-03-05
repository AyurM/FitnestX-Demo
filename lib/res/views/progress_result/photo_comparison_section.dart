import 'package:fitnest_x/data/model/photo_comparison_data.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:flutter/material.dart';

const _kSpacing = 15.0;

class PhotoComparisonSection extends StatelessWidget {
  final PhotoComparisonData data;

  const PhotoComparisonSection({Key? key, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final imageSize = (constraints.maxWidth - _kSpacing) / 2;

      return Column(
        children: [
          Text(data.title, style: Theme.of(context).textTheme.bodyMedium),
          AppWhiteSpace.value15.vertical,
          Row(
            children: [
              _buildImage(data.firstImagePath, imageSize),
              AppWhiteSpace.value15.horizontal,
              _buildImage(data.secondImagePath, imageSize),
            ],
          )
        ],
      );
    });
  }

  Widget _buildImage(String path, double size) => ClipRRect(
      borderRadius: BorderRadius.circular(AppBorderRadius.value22.value),
      child: Image.asset(path, width: size, height: size, fit: BoxFit.cover));
}
