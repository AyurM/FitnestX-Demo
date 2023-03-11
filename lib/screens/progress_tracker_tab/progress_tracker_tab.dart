import 'package:camera/camera.dart';
import 'package:fitnest_x/res/theme/app_icons.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:fitnest_x/res/views/app_fab.dart';
import 'package:fitnest_x/res/views/daily_action_card.dart';
import 'package:fitnest_x/res/views/progress_tracker/progress_gallery.dart';
import 'package:fitnest_x/res/views/progress_tracker/progress_reminder.dart';
import 'package:fitnest_x/res/views/progress_tracker/progress_track_info_card.dart';
import 'package:fitnest_x/res/views/simple_app_scaffold.dart';
import 'package:fitnest_x/screens/progress_comparison_screen/progress_comparison_screen.dart';
import 'package:fitnest_x/screens/take_photo_screen/take_photo_screen.dart';
import 'package:flutter/material.dart';

const _titleText = 'Progress Photo';
const _reminderText = 'Next Photos Fall On July 08';
const _comparePhotoText = 'Compare my Photo';
const _compareText = 'Compare';
const _reminderCloseAnimDuration = Duration(milliseconds: 150);

class ProgressTrackerTab extends StatefulWidget {
  final void Function()? onBackPressed;

  const ProgressTrackerTab({Key? key, this.onBackPressed}) : super(key: key);

  @override
  State<ProgressTrackerTab> createState() => _ProgressTrackerTabState();
}

class _ProgressTrackerTabState extends State<ProgressTrackerTab>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  bool showReminder = true;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: _reminderCloseAnimDuration)
          ..addStatusListener(_animationListener);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SimpleAppScaffold(
        title: _titleText,
        onBackPressed: widget.onBackPressed,
        body: SingleChildScrollView(
          child: Column(
            children: [
              AppWhiteSpace.value30.vertical,
              if (showReminder) ...[
                AnimatedBuilder(
                  animation: animationController,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: 1 -
                          Curves.easeInOut
                                  .transform(animationController.value) *
                              0.75,
                      child: child,
                    );
                  },
                  child: Padding(
                    padding: kHorizontalPadding20,
                    child: ProgressReminder(
                      text: _reminderText,
                      onClose: _onReminderClose,
                    ),
                  ),
                ),
                AppWhiteSpace.value20.vertical,
              ],
              Padding(
                padding: kHorizontalPadding20,
                child: ProgressTrackInfoCard(onPressed: () {}),
              ),
              AppWhiteSpace.value30.vertical,
              DailyActionCard(
                  title: _comparePhotoText,
                  buttonText: _compareText,
                  margin: kHorizontalPadding20,
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ProgressComparisonScreen()))),
              AppWhiteSpace.value30.vertical,
              const ProgressGallery(),
              AppWhiteSpace.value30.vertical,
            ],
          ),
        ),
        floatingActionButton: AppFab.add(
            onPressed: () => _onTakePhotoPressed(context),
            icon: AppIcons.camera_outlined));
  }

  void _onReminderClose() {
    if (animationController.isAnimating) {
      return;
    }
    animationController.forward();
  }

  void _animationListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      setState(() => showReminder = false);
    }
  }

  Future<void> _onTakePhotoPressed(BuildContext context) async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;

    if (!mounted) {
      return;
    }

    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => TakePhotoScreen(camera: firstCamera)));
  }
}
