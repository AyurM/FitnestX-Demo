import 'package:fitnest_x/res/theme/constants.dart';
import 'package:fitnest_x/res/views/progress_tracker/gallery_row.dart';
import 'package:fitnest_x/res/views/section_title.dart';
import 'package:fitnest_x/utils/data_mock_utils.dart';
import 'package:flutter/material.dart';

const _titleText = 'Gallery';
const _seeMoreText = 'See more';

class ProgressGallery extends StatelessWidget {
  const ProgressGallery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final content = DataMockUtils.getMockGalleryContent();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: kHorizontalPadding20,
          child: SectionTitle.textButton(
              text: _titleText,
              actionText: _seeMoreText,
              onPressed: () {},
              context: context),
        ),
        AppWhiteSpace.value15.vertical,
        ..._buildGalleryRows(content)
      ],
    );
  }

  List<Widget> _buildGalleryRows(Map<DateTime, List<String>> content) {
    final result = <Widget>[];
    final entries = content.entries.toList();
    for (int i = 0; i < entries.length; i++) {
      result.add(GalleryRow(date: entries[i].key, images: entries[i].value));
      if (i != entries.length - 1) {
        result.add(AppWhiteSpace.value15.vertical);
      }
    }

    return result;
  }
}
