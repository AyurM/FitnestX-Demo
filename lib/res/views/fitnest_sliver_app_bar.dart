import 'dart:math';

import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:fitnest_x/res/theme/app_icons.dart';
import 'package:fitnest_x/res/views/fitnest_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const _kBottomBorderRadius = 40.0;
const _kDefaultBgEllipsePadding =
    EdgeInsets.symmetric(horizontal: 20, vertical: 40);
const _kPanelHandleSize = Size(50, 5);

class FitnestSliverAppBar extends StatelessWidget {
  final double expandedHeight;
  final String title;
  final ScrollController parentScrollController;
  final String bgImageAssetPath;
  final void Function()? onMorePressed;
  final Offset? imageOffset;
  final EdgeInsets? imageMargin;
  final bool showBgEllipse;

  const FitnestSliverAppBar(
      {Key? key,
      required this.expandedHeight,
      required this.title,
      required this.bgImageAssetPath,
      required this.parentScrollController,
      this.showBgEllipse = false,
      this.imageOffset,
      this.imageMargin,
      this.onMorePressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: parentScrollController,
        builder: (context, _) {
          final hasBottom =
              parentScrollController.offset < expandedHeight - kToolbarHeight;

          final titleTextColor = Color.lerp(
              Colors.black,
              Colors.white,
              ((expandedHeight -
                          kToolbarHeight -
                          parentScrollController.offset) /
                      ((expandedHeight - kToolbarHeight) * 0.25))
                  .clamp(0.0, 1.0));

          final appBarWidget = _buildAppBarWidget(context);

          return SliverAppBar(
            expandedHeight: expandedHeight,
            backgroundColor: AppColors.white,
            pinned: true,
            titleSpacing: 20,
            elevation: 0,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness:
                  hasBottom ? Brightness.light : Brightness.dark,
            ),
            automaticallyImplyLeading: false,
            title: _SliverAppBarTitle(
              text: title,
              textColor: titleTextColor!,
              onMorePressed: onMorePressed,
            ),
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              background: Container(
                clipBehavior: Clip.hardEdge,
                decoration:
                    const BoxDecoration(gradient: AppColors.blueGradient),
                child: imageOffset != null
                    ? FractionalTranslation(
                        translation: imageOffset!, child: appBarWidget)
                    : appBarWidget,
              ),
            ),
            bottom: hasBottom
                ? PreferredSize(
                    preferredSize: const Size.fromHeight(_kBottomBorderRadius),
                    child: _FakeScrollPanelTop(
                      height: _kBottomBorderRadius,
                      handleColor: AppColors.black.withOpacity(0.1),
                      backgroundColor: AppColors.white,
                    ))
                : null,
          );
        });
  }

  Widget _buildAppBarWidget(BuildContext context) {
    final bgImage = imageMargin != null
        ? Padding(padding: imageMargin!, child: Image.asset(bgImageAssetPath))
        : Image.asset(bgImageAssetPath);

    if (!showBgEllipse) {
      return bgImage;
    }

    final ellipseSize = _calcBgEllipseSize(context);
    final ellipse = Container(
      width: ellipseSize,
      height: ellipseSize,
      decoration: BoxDecoration(
          color: AppColors.white.withOpacity(0.3),
          borderRadius: BorderRadius.circular(ellipseSize / 2)),
    );
    final stack = Stack(
      alignment: Alignment.center,
      children: [ellipse, Image.asset(bgImageAssetPath)],
    );
    return imageMargin != null
        ? Padding(padding: imageMargin!, child: stack)
        : stack;
  }

  double _calcBgEllipseSize(BuildContext context) {
    final padding = imageMargin ?? _kDefaultBgEllipsePadding;
    final availableWidth =
        MediaQuery.of(context).size.width - padding.left - padding.right;
    final availableHeight = expandedHeight - padding.top - padding.bottom;
    return max(availableHeight, availableWidth);
  }
}

class _SliverAppBarTitle extends StatelessWidget {
  final String text;
  final Color textColor;
  final void Function()? onMorePressed;

  const _SliverAppBarTitle(
      {Key? key,
      required this.text,
      required this.textColor,
      this.onMorePressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      AppBarButton(
        iconData: Icons.chevron_left_outlined,
        onPressed: () => Navigator.of(context).pop(),
      ),
      Text(text,
          style: Theme.of(context)
              .textTheme
              .headline4
              ?.copyWith(fontSize: 16, color: textColor)),
      AppBarButton(
        iconData: AppIcons.more,
        onPressed: onMorePressed ?? () {},
      ),
    ]);
  }
}

class _FakeScrollPanelTop extends StatelessWidget {
  final double height;
  final Color handleColor;
  final Color backgroundColor;

  const _FakeScrollPanelTop(
      {Key? key,
      required this.height,
      required this.handleColor,
      required this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        height: height,
        width: double.infinity,
        padding: const EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
            color: backgroundColor,
            boxShadow: [_buildGapHidingShadow()],
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(height),
                topRight: Radius.circular(height))),
        child: Align(
            alignment: Alignment.topCenter,
            child: _PanelHandle(color: handleColor)),
      );

  //This shadow is used to hide 1-pixel gap between this app bar and following sliver
  //in parent scroll view (https://github.com/flutter/flutter/issues/37578#issuecomment-640302364)
  BoxShadow _buildGapHidingShadow() =>
      BoxShadow(color: backgroundColor, offset: const Offset(0, 2));
}

class _PanelHandle extends StatelessWidget {
  final Color color;

  const _PanelHandle({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        height: _kPanelHandleSize.height,
        width: _kPanelHandleSize.width,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(_kPanelHandleSize.height / 2)),
      );
}
