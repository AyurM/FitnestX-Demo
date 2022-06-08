import 'package:fitnest_x/res/views/fitnest_app_bar.dart';
import 'package:flutter/material.dart';

class SimpleAppScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  final void Function()? onBackPressed;
  final void Function()? onMorePressed;

  const SimpleAppScaffold(
      {Key? key,
      required this.title,
      required this.body,
      this.onBackPressed,
      this.onMorePressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FitnestAppBar(
          text: title,
          context: context,
          onBackPressed: onBackPressed,
          onMorePressed: onMorePressed),
      body: body,
    );
  }
}
