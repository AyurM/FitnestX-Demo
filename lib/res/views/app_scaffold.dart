import 'package:fitnest_x/res/views/fitnest_app_bar.dart';
import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  final void Function()? onMorePressed;

  const AppScaffold(
      {Key? key, required this.title, required this.body, this.onMorePressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FitnestAppBar(text: title, context: context),
      body: body,
    );
  }
}
