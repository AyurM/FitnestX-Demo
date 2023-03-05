import 'package:fitnest_x/data/model/menu_item_data.dart';
import 'package:fitnest_x/data/model/profile.dart';
import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:fitnest_x/res/views/secondary_button.dart';
import 'package:fitnest_x/res/views/setting_menu_item.dart';
import 'package:fitnest_x/res/views/simple_app_scaffold.dart';
import 'package:fitnest_x/res/views/user_stat_card.dart';
import 'package:fitnest_x/utils/data_mock_utils.dart';
import 'package:flutter/material.dart';

const _titleText = 'Profile';
const _editText = 'Edit';
const _accountText = 'Account';
const _otherText = 'Other';
const _notificationsText = 'Notifications';
const _kImageSize = 55.0;
const _kImageScale = 0.9;
const _kImageBgOpacity = 0.3;
const _kButtonHeight = 30.0;
const _kButtonPadding = EdgeInsets.symmetric(horizontal: 30);

class ProfileTab extends StatelessWidget {
  final void Function()? onBackPressed;

  const ProfileTab({Key? key, this.onBackPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profile = DataMockUtils.getMockUserProfile();
    final accountMenuItems = DataMockUtils.getMockAccountMenuItems();
    final otherMenuItems = DataMockUtils.getMockOtherMenuItems();
    final notificationMenuItems = DataMockUtils.getMockNotificationMenuItems();

    return SimpleAppScaffold(
        title: _titleText,
        onBackPressed: onBackPressed,
        body: SingleChildScrollView(
            padding: kHorizontalPadding20,
            child: Column(
              children: [
                AppWhiteSpace.value35.vertical,
                _ProfileHeader(profile: profile),
                AppWhiteSpace.value15.vertical,
                _buildUserStats(profile),
                AppWhiteSpace.value30.vertical,
                _ProfileSectionCard(
                    title: _accountText, menuItems: accountMenuItems),
                AppWhiteSpace.value15.vertical,
                _ProfileSectionCard(
                    title: _notificationsText,
                    menuItems: notificationMenuItems),
                AppWhiteSpace.value15.vertical,
                _ProfileSectionCard(
                    title: _otherText, menuItems: otherMenuItems),
                AppWhiteSpace.value30.vertical,
              ],
            )));
  }

  Widget _buildUserStats(Profile profile) => Row(
        children: [
          Expanded(
            child: UserStatCard(
              name: 'Height',
              value: profile.height,
              unit: 'cm',
            ),
          ),
          AppWhiteSpace.value15.horizontal,
          Expanded(
            child: UserStatCard(
              name: 'Weight',
              value: profile.weight,
              unit: 'kg',
            ),
          ),
          AppWhiteSpace.value15.horizontal,
          Expanded(
            child: UserStatCard(
              name: 'Age',
              value: profile.age,
              unit: 'yo',
            ),
          ),
        ],
      );
}

class _ProfileHeader extends StatelessWidget {
  final Profile profile;

  const _ProfileHeader({Key? key, required this.profile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Row(
      children: [
        _UserAvatar(
          imagePath: profile.imagePath,
        ),
        AppWhiteSpace.value15.horizontal,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${profile.firstName} ${profile.lastName}',
                style: textTheme.bodyMedium?.copyWith(color: AppColors.black)),
            AppWhiteSpace.value5.horizontal,
            Text('${profile.program} Program', style: textTheme.titleMedium),
          ],
        ),
        const Spacer(),
        SecondaryButton.blue(
          text: _editText,
          height: _kButtonHeight,
          onPressed: () {},
          textStyle: textTheme.titleMedium
              ?.copyWith(fontWeight: FontWeight.w500, color: AppColors.white),
          padding: _kButtonPadding,
        )
      ],
    );
  }
}

class _UserAvatar extends StatelessWidget {
  final String imagePath;

  const _UserAvatar({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _kImageSize,
      height: _kImageSize,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: AppColors.blueGradientWithOpacity(_kImageBgOpacity)),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Image.asset(imagePath,
            width: _kImageSize * _kImageScale,
            height: _kImageSize * _kImageScale,
            fit: BoxFit.contain),
      ),
    );
  }
}

class _ProfileSectionCard extends StatelessWidget {
  final String title;
  final List<MenuItemData> menuItems;

  const _ProfileSectionCard(
      {Key? key, required this.title, required this.menuItems})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: kAllPadding20,
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppBorderRadius.value16.value),
          boxShadow: const [AppColors.cardShadow]),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(title, style: Theme.of(context).textTheme.displaySmall),
        AppWhiteSpace.value15.vertical,
        ...menuItems.map((item) => item.type == MenuItemType.simple
            ? SettingsMenuItem(data: item)
            : SettingsMenuToggleItem(data: item))
      ]),
    );
  }
}
