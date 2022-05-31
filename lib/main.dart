import 'package:fitnest_x/di/di.dart';
import 'package:fitnest_x/res/colors/app_colors.dart';
import 'package:fitnest_x/res/theme/constants.dart';
import 'package:fitnest_x/res/theme/text_theme.dart';
import 'package:fitnest_x/screens/welcome_screen/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() {
  init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: kAppName,
      theme: ThemeData.light().copyWith(
        textTheme: appTextTheme,
        scaffoldBackgroundColor: AppColors.white,
      ),
      home: const WelcomeScreen(),
    );
  }
}
