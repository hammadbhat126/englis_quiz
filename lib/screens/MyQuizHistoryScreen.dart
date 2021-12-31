import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:nb_utils/nb_utils.dart';
import 'package:englis_quiz/components/QuizHistoryComponent.dart';
import 'package:englis_quiz/main.dart';
import 'package:englis_quiz/models/QuizHistoryModel.dart';
import 'package:englis_quiz/screens/QuizHistoryDetailScreen.dart';
import 'package:englis_quiz/utils/colors.dart';
import 'package:englis_quiz/utils/constants.dart';
import 'package:englis_quiz/utils/widgets.dart';

class MyQuizHistoryScreen extends StatefulWidget {
  static String tag = '/MyQuizHistoryScreen';

  @override
  MyQuizHistoryScreenState createState() => MyQuizHistoryScreenState();
}

class MyQuizHistoryScreenState extends State<MyQuizHistoryScreen> {


  List<String> dropdownItems = [All, QuizTypeDaily, QuizTypeSelfChallenge, QuizTypeCategory];
  String? dropdownValue;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    dropdownValue = dropdownItems.first;


  }



  @override
  void dispose() {

    super.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
