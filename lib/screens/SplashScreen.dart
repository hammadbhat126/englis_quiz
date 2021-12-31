import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:englis_quiz/main.dart';
import 'package:englis_quiz/screens/DashboardScreen.dart';
import 'package:englis_quiz/screens/LoginScreen.dart';
import 'package:englis_quiz/screens/WalkThroughScreen.dart';
import 'package:englis_quiz/utils/colors.dart';
import 'package:englis_quiz/utils/constants.dart';
import 'package:englis_quiz/utils/images.dart';
import 'package:englis_quiz/utils/strings.dart';

class SplashScreen extends StatefulWidget {
  static String tag = '/SplashScreen';

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    setStatusBarColor(scaffoldColor);

    Future.delayed(Duration(seconds: 2), () {
      if (appStore.isLoggedIn) {
        DashboardScreen().launch(context, isNewTask: true);
      } else {
        if (getBoolAsync(IS_FIRST_TIME, defaultValue: true)) {
          WalkThroughScreen().launch(context, isNewTask: true);
        } else {
          LoginScreen().launch(context, isNewTask: true);
        }
      }
    });
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(appLogoImage, height: 150, width: 150),
            16.height,
            Text(lbl_online_quiz, style: boldTextStyle(size: 24)),
          ],
        ),
      ),
    );
  }
}
