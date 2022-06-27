import 'package:fitnest_x/data/model/sleep_schedule_item_content.dart';
import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:fitnest_x/res/views/app_card.dart';
import 'package:fitnest_x/res/views/app_switch_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const _kImageSize = 30.0;
const _kIconSize = 16.0;
const _kCardPadding = EdgeInsets.symmetric(horizontal: 15, vertical: 20);
const _kSwitchSize = Size(44, 24);

class SleepScheduleCard extends StatelessWidget {
  static final DateFormat _timeFormat = DateFormat('hh:mma');

  final SleepScheduleItemContent data;

  const SleepScheduleCard({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final Duration timeDifference = data.dateTime.difference(DateTime.now());

    return AppCard(
      borderRadius: AppBorderRadius.large.value,
      padding: _kCardPadding,
      child: Row(children: [
        Image.asset(
          data.assetPath,
          width: _kImageSize,
        ),
        AppWhiteSpace.value15.horizontal,
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                  text: '${data.title}, ',
                  style: textTheme.bodyText2?.copyWith(
                      fontWeight: FontWeight.bold, color: AppColors.black),
                  children: [
                    TextSpan(
                        text: _timeFormat.format(data.dateTime).toLowerCase(),
                        style: textTheme.subtitle1)
                  ]),
            ),
            AppWhiteSpace.value5.vertical,
            _TimeDifferenceLabel(timeDifference: timeDifference)
          ],
        )),
        AppWhiteSpace.value15.horizontal,
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Icon(Icons.more_vert_outlined,
                size: _kIconSize, color: AppColors.gray2),
            AppWhiteSpace.value15.vertical,
            AppSwitchButton(
              initialValue: data.showNotification,
              width: _kSwitchSize.width,
              height: _kSwitchSize.height,
            )
          ],
        )
      ]),
    );
  }
}

class _TimeDifferenceLabel extends StatelessWidget {
  final Duration timeDifference;

  const _TimeDifferenceLabel({Key? key, required this.timeDifference})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    if (timeDifference.isNegative) {
      return Text('now', style: textTheme.bodyText2);
    }

    final digitTextStyle = textTheme.bodyText1
        ?.copyWith(color: AppColors.gray1, fontWeight: FontWeight.w600);

    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(text: 'in ', style: textTheme.bodyText2, children: [
        TextSpan(
            text: timeDifference.inHours.toString(), style: digitTextStyle),
        TextSpan(text: ' hours ', style: textTheme.bodyText2),
        TextSpan(
            text: (timeDifference.inMinutes - timeDifference.inHours * 60)
                .toString(),
            style: digitTextStyle),
        TextSpan(text: ' minutes ', style: textTheme.bodyText2),
      ]),
    );
  }
}
