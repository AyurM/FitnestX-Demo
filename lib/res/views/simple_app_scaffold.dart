import 'package:fitnest_x/res/views/fitnest_app_bar.dart';
import 'package:flutter/material.dart';

class SimpleAppScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  final Widget? floatingActionButton;
  final Widget? customAppBarAction;
  final IconData? leadingIcon;
  final void Function()? onBackPressed;
  final void Function()? onMorePressed;

  const SimpleAppScaffold(
      {Key? key,
      required this.title,
      required this.body,
      this.leadingIcon,
      this.floatingActionButton,
      this.customAppBarAction,
      this.onBackPressed,
      this.onMorePressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FitnestAppBar(
          text: title,
          context: context,
          leadingIcon: leadingIcon,
          customAction: customAppBarAction,
          onBackPressed: onBackPressed,
          onMorePressed: onMorePressed),
      body: body,
      floatingActionButton: floatingActionButton,
    );
  }
}
