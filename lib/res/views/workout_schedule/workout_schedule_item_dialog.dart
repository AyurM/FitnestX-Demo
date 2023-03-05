import 'package:fitnest_x/data/model/schedule_item_content.dart';
import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:fitnest_x/res/theme/app_icons.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:fitnest_x/res/views/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const _kDialogRelativeWidth = 0.84;
const _kIconSize = 20.0;
const _kButtonHeight = 48.0;
const _kHeaderIconButtonSize = Size(32.0, 32.0);
const _kDialogPadding = 30.0;
const _titleText = 'Workout Schedule';
const _markAsDoneText = 'Mark as Done';

class WorkoutScheduleItemDialog extends StatelessWidget {
  final ScheduleItemContent data;
  final void Function(ScheduleItemContent)? onDone;
  final void Function()? onCancel;
  final void Function()? onMore;

  const WorkoutScheduleItemDialog(
      {Key? key, required this.data, this.onDone, this.onCancel, this.onMore})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final DateFormat timeFormat = DateFormat('hh:mma');

    return WillPopScope(
      onWillPop: () async {
        onCancel?.call();
        return Future.value(true);
      },
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppBorderRadius.value16.value),
        ),
        backgroundColor: AppColors.white,
        child: Container(
          width: MediaQuery.of(context).size.width * _kDialogRelativeWidth,
          padding: const EdgeInsets.symmetric(vertical: _kDialogPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildDialogHeader(context),
              AppWhiteSpace.value30.vertical,
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: _kDialogPadding),
                child: Text(data.title,
                    style:
                        textTheme.bodyMedium?.copyWith(color: AppColors.black)),
              ),
              AppWhiteSpace.value10.vertical,
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: _kDialogPadding),
                child: Row(
                  children: [
                    const Icon(AppIcons.time_circle_outlined,
                        color: AppColors.gray1),
                    AppWhiteSpace.value10.horizontal,
                    Text('Today | ${timeFormat.format(data.date)}',
                        style: textTheme.titleMedium)
                  ],
                ),
              ),
              AppWhiteSpace.value30.vertical,
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: _kDialogPadding),
                child: PrimaryButton.blue(
                  text: _markAsDoneText,
                  height: _kButtonHeight,
                  textStyle: textTheme.titleLarge,
                  onPressed: () {
                    Navigator.of(context).pop();
                    onDone?.call(data);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDialogHeader(BuildContext context) => Padding(
        padding: EdgeInsets.symmetric(
            horizontal: _kDialogPadding -
                (_kHeaderIconButtonSize.width - _kIconSize) / 2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _DialogHeaderIconButton(
                iconData: Icons.close, onPressed: Navigator.of(context).pop),
            Text(_titleText,
                style: Theme.of(context).textTheme.displaySmall,
                textAlign: TextAlign.center),
            _DialogHeaderIconButton(
                iconData: Icons.more_vert_sharp, onPressed: onMore)
          ],
        ),
      );
}

class _DialogHeaderIconButton extends StatelessWidget {
  final IconData iconData;
  final void Function()? onPressed;

  const _DialogHeaderIconButton(
      {Key? key, required this.iconData, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) => IconButton(
      padding: EdgeInsets.zero,
      constraints: BoxConstraints.tight(_kHeaderIconButtonSize),
      splashRadius: _kIconSize,
      onPressed: onPressed ?? () {},
      icon: Icon(
        iconData,
        size: _kIconSize,
        color: AppColors.black,
      ));
}
