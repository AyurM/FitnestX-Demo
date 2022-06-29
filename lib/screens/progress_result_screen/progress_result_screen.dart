import 'package:fitnest_x/res/theme/app_icons.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:fitnest_x/res/views/fitnest_app_bar.dart';
import 'package:fitnest_x/res/views/primary_button.dart';
import 'package:fitnest_x/res/views/progress_result/app_mode_select.dart';
import 'package:fitnest_x/res/views/progress_result/progress_result_photo_block.dart';
import 'package:fitnest_x/res/views/progress_result/progress_result_statistics_block.dart';
import 'package:fitnest_x/res/views/simple_app_scaffold.dart';
import 'package:flutter/material.dart';

const _titleText = 'Result';
const _backText = 'Back to Home';
const _kShareIconSize = 16.0;

class ProgressResultScreen extends StatefulWidget {
  const ProgressResultScreen({Key? key}) : super(key: key);

  @override
  State<ProgressResultScreen> createState() => _ProgressResultScreenState();
}

class _ProgressResultScreenState extends State<ProgressResultScreen> {
  _ResultPageMode mode = _ResultPageMode.photo;

  @override
  Widget build(BuildContext context) {
    return SimpleAppScaffold(
        title: _titleText,
        customAppBarAction: AppBarButton(
          iconData: AppIcons.share,
          iconSize: _kShareIconSize,
          onPressed: () {},
          hasHorizontalPadding: false,
        ),
        body: SingleChildScrollView(
          padding: kHorizontalPadding20,
          child: Column(children: [
            AppWhiteSpace.value30.vertical,
            AppModeSelect(
              firstOptionName: _ResultPageMode.values[0].toString(),
              secondOptionName: _ResultPageMode.values[1].toString(),
              initialOption: mode.index,
              onChanged: _onModeChange,
            ),
            AppWhiteSpace.value30.vertical,
            _buildPageContent(),
            AppWhiteSpace.value30.vertical,
            PrimaryButton.blue(
                text: _backText,
                onPressed: () =>
                    Navigator.of(context).popUntil((route) => route.isFirst)),
            AppWhiteSpace.value40.vertical,
          ]),
        ));
  }

  void _onModeChange(int index) {
    if (mode.index == index) {
      return;
    }
    setState(() => mode = _ResultPageMode.values[index]);
  }

  Widget _buildPageContent() {
    if (mode == _ResultPageMode.photo) {
      return const ProgressResultPhotoBlock();
    }
    return const ProgressResultStatisticsBlock();
  }
}

enum _ResultPageMode {
  photo,
  statistic;

  @override
  String toString() => name[0].toUpperCase() + name.substring(1);
}
