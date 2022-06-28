import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:fitnest_x/res/views/app_simple_image.dart';
import 'package:flutter/material.dart';

const _titleText = 'Reminder!';
const _kBgOpacity = 0.1;
const _kImageSize = 60.0;
const _kImageBgOpacity = 0.5;
const _kImageScale = 0.6;
const _kIconSize = 18.0;
const _kCardPadding = EdgeInsets.fromLTRB(15, 0, 5, 15);
const _kInnerPadding = EdgeInsets.only(top: 15.0);

class ProgressReminder extends StatelessWidget {
  final String text;
  final void Function()? onClose;

  const ProgressReminder({Key? key, required this.text, this.onClose})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      padding: _kCardPadding,
      decoration: BoxDecoration(
        color: AppColors.red.withOpacity(_kBgOpacity),
        borderRadius: BorderRadius.circular(AppBorderRadius.large.value),
      ),
      child: Row(children: [
        const Padding(
          padding: _kInnerPadding,
          child: AppSimpleImage(
              assetPath: 'assets/images/reminder_calendar.png',
              bgOpacity: _kImageBgOpacity,
              size: _kImageSize,
              assetScale: _kImageScale,
              color: AppColors.white),
        ),
        AppWhiteSpace.value10.horizontal,
        Expanded(
          child: Padding(
            padding: _kInnerPadding,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(_titleText,
                  style: textTheme.subtitle1?.copyWith(color: AppColors.red)),
              AppWhiteSpace.value3.horizontal,
              Text(text,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.bodyText2?.copyWith(
                      color: AppColors.black, fontWeight: FontWeight.bold)),
            ]),
          ),
        ),
        AppWhiteSpace.value10.horizontal,
        Container(
          height: _kImageSize,
          alignment: Alignment.topCenter,
          child: IconButton(
            padding: EdgeInsets.zero,
            onPressed: onClose,
            splashRadius: _kIconSize,
            constraints:
                BoxConstraints.tight(const Size.square(_kIconSize * 2)),
            icon: const Icon(
              Icons.close,
              size: _kIconSize,
              color: AppColors.gray1,
            ),
          ),
        )
      ]),
    );
  }
}
