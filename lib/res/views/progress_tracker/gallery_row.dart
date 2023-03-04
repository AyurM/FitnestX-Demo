import 'package:fitnest_x/res/theme/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const _kImageSize = 100.0;
const _kImageBorderRadius = 14.0;

class GalleryRow extends StatelessWidget {
  static final _dateFormat = DateFormat('d MMMM');
  final DateTime date;
  final List<String> images;

  const GalleryRow({Key? key, required this.date, required this.images})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (images.isEmpty) {
      return const SizedBox();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(_dateFormat.format(date),
              style: Theme.of(context).textTheme.titleMedium),
        ),
        AppWhiteSpace.value10.vertical,
        SizedBox(
          height: _kImageSize,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: kHorizontalPadding20,
              itemBuilder: (_, index) => ClipRRect(
                    borderRadius: BorderRadius.circular(_kImageBorderRadius),
                    child: Image.asset(images[index],
                        width: _kImageSize,
                        height: _kImageSize,
                        fit: BoxFit.cover),
                  ),
              separatorBuilder: (_, __) => AppWhiteSpace.value10.horizontal,
              itemCount: images.length),
        )
      ],
    );
  }
}
