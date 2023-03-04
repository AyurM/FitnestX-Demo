import 'package:fitnest_x/data/model/today_target_item_content.dart';
import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:fitnest_x/res/views/secondary_button.dart';
import 'package:fitnest_x/utils/data_mock_utils.dart';
import 'package:flutter/material.dart';

const _titleText = 'Today Target';
const _kBgOpacity = 0.2;
const _kImageSize = 30.0;
const _kIconSize = 18.0;
const _kItemCardPadding = kAllPadding10;

class TodayTargetCard extends StatelessWidget {
  const TodayTargetCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final targetItems = DataMockUtils.getMockTodayTargetItems();

    return Container(
      padding: kAllPadding20,
      decoration: _buildCardDecoration(),
      child: Column(children: [
        _buildCardHeader(context),
        AppWhiteSpace.value15.vertical,
        Row(
          children: [
            Expanded(child: _TodayTargetItem(data: targetItems[0])),
            AppWhiteSpace.value15.horizontal,
            Expanded(child: _TodayTargetItem(data: targetItems[1]))
          ],
        )
      ]),
    );
  }

  BoxDecoration _buildCardDecoration() => BoxDecoration(
      borderRadius: BorderRadius.circular(AppBorderRadius.value22.value),
      gradient: AppColors.blueGradientWithOpacity(_kBgOpacity));

  Widget _buildCardHeader(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(_titleText,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold, color: AppColors.black)),
          SecondaryIconButton(
            icon:
                const Icon(Icons.add, color: AppColors.white, size: _kIconSize),
            onPressed: () {},
          )
        ],
      );
}

class _TodayTargetItem extends StatelessWidget {
  final TodayTargetItemContent data;

  const _TodayTargetItem({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      padding: _kItemCardPadding,
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppBorderRadius.value12.value)),
      child: Row(children: [
        Image.asset(data.imagePath,
            width: _kImageSize, height: _kImageSize, fit: BoxFit.contain),
        AppWhiteSpace.value8.horizontal,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${data.value}${data.unit ?? ''}',
                  style: textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500, color: AppColors.blue)),
              Text(data.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.titleMedium)
            ],
          ),
        )
      ]),
    );
  }
}
