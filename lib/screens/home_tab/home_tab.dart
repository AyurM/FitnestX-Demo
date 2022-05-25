import 'package:fitnest_x/res/views/home_tab/home_tab_header.dart';
import 'package:flutter/material.dart';

const _usernameText = 'Stefani Wong';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: const [
            SizedBox(height: 20),
            HomeTabHeader(
              username: _usernameText,
              hasNotifications: true,
            )
          ],
        ),
      ),
    );
  }
}
