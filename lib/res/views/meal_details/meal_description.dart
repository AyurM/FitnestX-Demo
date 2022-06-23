import 'package:fitnest_x/res/theme/constants.dart';
import 'package:fitnest_x/res/views/expandable_text_block.dart';
import 'package:fitnest_x/res/views/section_title.dart';
import 'package:flutter/material.dart';

const _titleText = 'Description';
const _collapsedTextLength = 181;
const _kMealDescription =
    "Pancakes are some people's favorite breakfast, who doesn't like pancakes? Especially with the real honey splash on top of the pancakes, of course everyone loves that! Besides being lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla et sapien vehicula, luctus elit dapibus, semper augue. Nulla rutrum mattis ligula, et commodo orci tincidunt.";

class MealDescription extends StatelessWidget {
  const MealDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle.noAction(text: _titleText),
        AppWhiteSpace.value15.vertical,
        const ExpandableTextBlock(
            text: _kMealDescription, collapsedTextLength: _collapsedTextLength)
      ],
    );
  }
}
