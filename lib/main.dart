import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:englis_quiz/screens/SplashScreen.dart';
import 'package:englis_quiz/services/AuthService.dart';
import 'package:englis_quiz/services/CategoryService.dart';
import 'package:englis_quiz/services/DailyQuizService.dart';
import 'package:englis_quiz/services/QuestionService.dart';
import 'package:englis_quiz/services/QuizHistoryService.dart';
import 'package:englis_quiz/services/QuizService.dart';
import 'package:englis_quiz/services/SettingService.dart';
import 'package:englis_quiz/services/userDBService.dart';
import 'package:englis_quiz/store/AppStore.dart';
import 'package:englis_quiz/utils/colors.dart';
import 'package:englis_quiz/utils/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:nb_utils/nb_utils.dart';


AppStore appStore = AppStore();

FirebaseFirestore db = FirebaseFirestore.instance;

AuthService authService = AuthService();
UserDBService userDBService = UserDBService();
CategoryService categoryService = CategoryService();
QuestionService questionService = QuestionService();
QuizService quizService = QuizService();
QuizHistoryService quizHistoryService = QuizHistoryService();
DailyQuizService dailyQuizService = DailyQuizService();
AppSettingService appSettingService = AppSettingService();

bool bannerReady = false;
bool interstitialReady = false;
bool rewarded = false;


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp().then((value) {

  });

  defaultRadius = 12.0;
  defaultAppButtonRadius = 12.0;
  await initialize(); //Shared Preferences

  setOrientationPortrait();

  appStore.setLoggedIn(getBoolAsync(IS_LOGGED_IN));
  if (appStore.isLoggedIn) {
    appStore.setUserId(getStringAsync(USER_ID));
    appStore.setName(getStringAsync(USER_DISPLAY_NAME));
    appStore.setUserEmail(getStringAsync(USER_EMAIL));
    appStore.setProfileImage(getStringAsync(USER_PHOTO_URL));
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: mAppName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.nunito().fontFamily,
        scaffoldBackgroundColor: scaffoldColor,
      ),
      home: SplashScreen(),
    );
  }
}
