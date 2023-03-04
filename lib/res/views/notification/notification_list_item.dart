import 'package:fitnest_x/data/model/notification_content.dart';
import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:fitnest_x/res/views/app_simple_image.dart';
import 'package:flutter/material.dart';

const _kImageHeight = 40.0;
const _kPadding = EdgeInsets.symmetric(vertical: 16);

class NotificationListItem extends StatelessWidget {
  final NotificationContent data;
  final void Function()? onPressed;

  const NotificationListItem({Key? key, required this.data, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = data.color ?? AppColors.blue2;
    final TextStyle? textStyle = Theme.of(context).textTheme.titleMedium;

    return RawMaterialButton(
        onPressed: onPressed ?? () {},
        padding: _kPadding,
        elevation: 0,
        highlightElevation: 0,
        fillColor: AppColors.white,
        child: Row(
          children: [
            AppSimpleImage(
                assetPath: data.assetPath, color: color, size: _kImageHeight),
            AppWhiteSpace.value10.horizontal,
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(data.message,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: textStyle?.copyWith(
                        fontWeight: FontWeight.w500, color: AppColors.black)),
                Text(
                  data.date,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: textStyle?.copyWith(fontSize: 10),
                )
              ],
            )),
            AppWhiteSpace.value10.horizontal,
            const Icon(Icons.more_vert_outlined, color: AppColors.gray2),
            AppWhiteSpace.value8.horizontal,
          ],
        ));
  }
}
