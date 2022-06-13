import 'package:fitnest_x/data/model/latest_activity_content.dart';
import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:fitnest_x/res/views/app_card.dart';
import 'package:fitnest_x/res/views/app_simple_image.dart';
import 'package:flutter/material.dart';

const _kImageSize = 50.0;
const _kSpacing = 8.0;
const _kImageAssetScale = 0.9;
const _kImageBgOpacity = 0.3;
const _kCardPadding = EdgeInsets.all(15);

class LatestActivityCard extends StatelessWidget {
  final LatestActivityContent data;

  const LatestActivityCard({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = data.color ?? AppColors.blue2;
    final TextStyle? textStyle = Theme.of(context).textTheme.subtitle1;

    return AppCard(
      borderRadius: kBorderRadiusMedium,
      padding: EdgeInsets.zero,
      child: RawMaterialButton(
        onPressed: () {},
        padding: _kCardPadding,
        elevation: 0,
        highlightElevation: 0,
        fillColor: AppColors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kBorderRadiusMedium)),
        child: Row(children: [
          AppSimpleImage(
              assetPath: data.assetPath,
              size: _kImageSize,
              assetScale: _kImageAssetScale,
              assetAlignment: Alignment.bottomCenter,
              color: color,
              bgOpacity: _kImageBgOpacity),
          const SizedBox(width: _kSpacing),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(data.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: textStyle?.copyWith(
                      fontWeight: FontWeight.bold, color: AppColors.black)),
              const SizedBox(height: 5),
              Text(
                data.subtitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style:
                    textStyle?.copyWith(fontSize: 10, color: AppColors.gray2),
              )
            ],
          )),
          const SizedBox(width: _kSpacing),
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
