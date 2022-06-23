import 'package:fitnest_x/res/theme/constants.dart';
import 'package:fitnest_x/res/views/expandable_text_block.dart';
import 'package:fitnest_x/res/views/section_title.dart';
import 'package:flutter/material.dart';

const _titleText = 'Description';
const _collapsedTextLength = 185;
const _kMockDescription =
    'A jumping jack, also known as a star jump and called a side-straddle hop in the US military, is a physical jumping exercise performed by jumping to a position with the legs spread wide. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla et sapien vehicula, luctus elit dapibus, semper augue. Nulla rutrum mattis ligula, et commodo orci tincidunt.';

class ExerciseDescription extends StatelessWidget {
  const ExerciseDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle.noAction(text: _titleText),
        AppWhiteSpace.value15.vertical,
        const ExpandableTextBlock(
            text: _kMockDescription, collapsedTextLength: _collapsedTextLength)
      ],
    );
  }
}
