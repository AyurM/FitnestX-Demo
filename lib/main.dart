import 'package:fitnest_x/di/di.dart';
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
      title: 'Fitnest X',
      theme: ThemeData.light().copyWith(textTheme: appTextTheme),
      home: const WelcomeScreen(),
    );
  }
}
