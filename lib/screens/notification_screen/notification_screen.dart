import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:fitnest_x/res/views/simple_app_scaffold.dart';
import 'package:fitnest_x/res/views/notification/notification_list_item.dart';
import 'package:fitnest_x/utils/data_mock_utils.dart';
import 'package:flutter/material.dart';

const _titleText = 'Notifications';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final notifications = DataMockUtils.getMockNotifications();

    return SimpleAppScaffold(
        title: _titleText,
        body: ListView.separated(
            padding: kHorizontalPadding,
            itemBuilder: (_, index) =>
                NotificationListItem(data: notifications[index]),
            separatorBuilder: (_, __) => const Divider(
                  height: 1,
                  thickness: 1,
                  color: AppColors.gray3,
                ),
            itemCount: notifications.length));
  }
}
