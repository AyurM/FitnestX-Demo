import 'package:fitnest_x/data/model/latest_activity_content.dart';
import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:fitnest_x/res/views/app_card.dart';
import 'package:fitnest_x/res/views/app_simple_image.dart';
import 'package:flutter/material.dart';

const _kImageSize = 50.0;
const _kImageAssetScale = 0.9;
const _kImageBgOpacity = 0.3;
const _kCardPadding = kAllPadding15;

class LatestActivityCard extends StatelessWidget {
  final LatestActivityContent data;

  const LatestActivityCard({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = data.color ?? AppColors.blue2;
    final TextStyle? textStyle = Theme.of(context).textTheme.subtitle1;

    return AppCard(
      borderRadius: AppBorderRadius.value16.value,
      padding: EdgeInsets.zero,
      child: RawMaterialButton(
        onPressed: () {},
        padding: _kCardPadding,
        elevation: 0,
        highlightElevation: 0,
        fillColor: AppColors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppBorderRadius.value16.value)),
        child: Row(children: [
          AppSimpleImage(
              assetPath: data.assetPath,
              size: _kImageSize,
              assetScale: _kImageAssetScale,
              assetAlignment: Alignment.bottomCenter,
              color: color,
              bgOpacity: _kImageBgOpacity),
          AppWhiteSpace.value8.horizontal,
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(data.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: textStyle?.copyWith(
                      fontWeight: FontWeight.bold, color: AppColors.black)),
              AppWhiteSpace.value5.vertical,
              Text(
                data.subtitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style:
                    textStyle?.copyWith(fontSize: 10, color: AppColors.gray2),
              )
            ],
          )),
          AppWhiteSpace.value8.horizontal,
          Container(
            height: _kImageSize,
            alignment: Alignment.topCenter,
            child: const Icon(
              Icons.more_vert,
              color: AppColors.gray2,
            ),
          )
        ]),
      ),
    );
  }
}
