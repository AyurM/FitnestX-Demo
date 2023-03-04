import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:fitnest_x/res/views/app_card.dart';
import 'package:fitnest_x/res/views/card_title.dart';
import 'package:fitnest_x/res/views/sleep_wave_painter.dart';
import 'package:flutter/material.dart';

const _titleText = 'Sleep';
const _kPurpleOpacity = 0.3;
const _kBlueOpacity = 0.8;
const _kLineWidth = 1.5;

class SleepCard extends StatelessWidget {
  final Duration duration;

  const SleepCard({Key? key, required this.duration}) : super(key: key);

  @override
  Widget build(BuildContext context) => AppCard(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const CardTitle(text: _titleText),
          AppWhiteSpace.value5.vertical,
          _buildDurationText(context),
          AppWhiteSpace.value5.vertical,
          const Expanded(child: _SleepGraph())
        ]),
      );

  Widget _buildDurationText(BuildContext context) => Text(
      '${duration.inHours}h ${(duration - Duration(hours: duration.inHours)).inMinutes}m',
      style: Theme.of(context)
          .textTheme
          .bodyMedium
          ?.copyWith(fontWeight: FontWeight.w600, color: AppColors.blue2));
}

class _SleepGraph extends StatelessWidget {
  const _SleepGraph({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const CustomPaint(
      painter: SleepWavePainter.gradient(
          backgroundWaveOpacity: _kPurpleOpacity,
          foregroundWaveOpacity: _kBlueOpacity,
          lineWidth: _kLineWidth,
          backgroundWaveGradientColors: [AppColors.purple2, AppColors.purple],
          foregroundWaveGradientColors: [AppColors.blue2, AppColors.blue]),
      size: Size.infinite);
}
