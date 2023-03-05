import 'dart:math';

import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:fitnest_x/res/views/sleep_wave_painter.dart';
import 'package:flutter/material.dart';

const _titleText = 'Last Night Sleep';
const _kMinSleepDuration = 6;
const _kMaxSleepDuration = 8;
const _kAspectRatio = 2.13;
const _kWaveOpacity = 0.3;
const _kWaveLineWidth = 1.0;

class LastNightSleepCard extends StatelessWidget {
  const LastNightSleepCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Random random = Random();
    final sleepDuration = Duration(
        hours: random.nextInt(_kMaxSleepDuration - _kMinSleepDuration + 1) +
            _kMinSleepDuration,
        minutes: random.nextInt(60));

    final textStyle = Theme.of(context)
        .textTheme
        .bodyMedium
        ?.copyWith(color: AppColors.white);
    final digitTextStyle =
        textStyle?.copyWith(fontSize: 16, fontWeight: FontWeight.bold);

    return AspectRatio(
      aspectRatio: _kAspectRatio,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppBorderRadius.value22.value),
            gradient: AppColors.blueGradient,
            boxShadow: [
              BoxShadow(
                  color: AppColors.blueShadow.withOpacity(0.3),
                  offset: const Offset(0, 10),
                  blurRadius: 22)
            ]),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: Text(_titleText, style: textStyle),
          ),
          AppWhiteSpace.value5.vertical,
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: RichText(
              text: TextSpan(
                  text: sleepDuration.inHours.toString(),
                  style: digitTextStyle,
                  children: [
                    TextSpan(text: 'h', style: textStyle),
                    TextSpan(
                        text:
                            ' ${sleepDuration.inMinutes - sleepDuration.inHours * 60}'
                                .toString(),
                        style: digitTextStyle),
                    TextSpan(text: 'm', style: textStyle),
                  ]),
            ),
          ),
          AppWhiteSpace.value5.vertical,
          const Expanded(child: _SleepWaves())
        ]),
      ),
    );
  }
}

class _SleepWaves extends StatelessWidget {
  const _SleepWaves({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomPaint(
      painter: SleepWavePainter.color(
          backgroundWaveColor: AppColors.white,
          backgroundWaveOpacity: _kWaveOpacity,
          foregroundWaveColor: AppColors.white,
          foregroundWaveOpacity: 1.0,
          lineWidth: _kWaveLineWidth),
      size: Size.infinite,
    );
  }
}
