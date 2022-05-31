import 'package:fitnest_x/data/model/notification_content.dart';
import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:flutter/material.dart';

const _kImageHeight = 40.0;
const _kImageBgOpacity = 0.2;
const _kAssetImageScale = 0.7;
const _kPadding = EdgeInsets.symmetric(vertical: 16);

class NotificationListItem extends StatelessWidget {
  final NotificationContent data;
  final void Function()? onPressed;

  const NotificationListItem({Key? key, required this.data, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = data.color ?? AppColors.blue2;
    final TextStyle? textStyle = Theme.of(context).textTheme.subtitle1;

    return RawMaterialButton(
        onPressed: onPressed ?? () {},
        padding: _kPadding,
        elevation: 0,
        fillColor: AppColors.white,
        child: Row(
          children: [
            _NotificationImage(assetPath: data.assetPath, color: color),
            const SizedBox(width: 10),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(data.message,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: textStyle?.copyWith(
                        fontWeight: FontWeight.bold, color: AppColors.black)),
                Text(
                  data.date,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: textStyle?.copyWith(fontSize: 10),
                )
              ],
            )),
            const SizedBox(width: 10),
            const Icon(Icons.more_vert_outlined, color: AppColors.gray2),
            const SizedBox(width: 8),
          ],
        ));
  }
}

class _NotificationImage extends StatelessWidget {
  final String assetPath;
  final Color color;

  const _NotificationImage(
      {Key? key, required this.assetPath, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: _kImageHeight,
            height: _kImageHeight,
            decoration: BoxDecoration(
                color: color.withOpacity(_kImageBgOpacity),
                shape: BoxShape.circle),
          ),
          Image.asset(assetPath,
              width: _kImageHeight * _kAssetImageScale,
              height: _kImageHeight * _kAssetImageScale,
              fit: BoxFit.contain)
        ],
      );
}
