import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:fitnest_x/res/theme/app_icons.dart';
import 'package:flutter/material.dart';

const _kButtonSize = 40.0;
const _kBorderRadius = 8.0;
const _kNotificationDotSize = 6.0;
const _welcomeText = 'Welcome Back,';

class HomeTabHeader extends StatelessWidget {
  final String username;
  final bool hasNotifications;

  const HomeTabHeader(
      {Key? key, required this.username, this.hasNotifications = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _welcomeText,
              style: textTheme.subtitle1?.copyWith(color: AppColors.gray2),
            ),
            const SizedBox(height: 3),
            Text(username, style: textTheme.headline4)
          ],
        ),
        _NotificationButton(
          onPressed: () {},
          hasNotifications: hasNotifications,
        )
      ],
    );
  }
}

class _NotificationButton extends StatelessWidget {
  final void Function() onPressed;
  final bool hasNotifications;

  const _NotificationButton(
      {Key? key, required this.onPressed, this.hasNotifications = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Ink(
        width: _kButtonSize,
        height: _kButtonSize,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(_kBorderRadius),
            color: AppColors.borderColor),
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(_kBorderRadius),
          child: Center(
              child: Stack(
            children: [
              const Icon(AppIcons.notification_outlined),
              if (hasNotifications)
                Positioned(
                  right: 4,
                  child: Container(
                    width: _kNotificationDotSize,
                    height: _kNotificationDotSize,
                    decoration: BoxDecoration(
                        color: AppColors.red,
                        borderRadius:
                            BorderRadius.circular(_kNotificationDotSize / 2),
                        border: Border.all(color: AppColors.borderColor)),
                  ),
                )
            ],
          )),
        ),
      );
}
