import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:nb_utils/nb_utils.dart';
import 'package:englis_quiz/components/UpgradeLevelDialogComponent.dart';
import 'package:englis_quiz/main.dart';
import 'package:englis_quiz/models/QuizHistoryModel.dart';
import 'package:englis_quiz/screens/DashboardScreen.dart';
import 'package:englis_quiz/screens/QuizHistoryDetailScreen.dart';
import 'package:englis_quiz/utils/colors.dart';
import 'package:englis_quiz/utils/constants.dart';
import 'package:englis_quiz/utils/images.dart';
import 'package:englis_quiz/utils/widgets.dart';

class QuizResultScreen extends StatefulWidget {
  static String tag = '/QuizResultScreen';

  final QuizHistoryModel? quizHistoryData;
  final String? oldLevel, newLevel;

  QuizResultScreen({this.quizHistoryData, this.oldLevel, this.newLevel});

  @override
  QuizResultScreenState createState() => QuizResultScreenState();
}

class QuizResultScreenState extends State<QuizResultScreen> {
  late double? percentage;



  @override
  void initState() {
    super.initState();

  }







  String? resultWiseImage() {
    if (percentage! >= 0 && percentage! <= 30) {
      return ResultTryAgainImage;
    } else if (percentage! > 30 && percentage! <= 60) {
      return ResultAverageImage;
    } else if (percentage! > 60 && percentage! <= 90) {
      return ResultGoodJobImage;
    } else if (percentage! > 90) {
      return ResultExcellentImage;
    }
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            width: context.width(),
            height: context.height(),
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(ResultBgImage), fit: BoxFit.fill),
            ),
          ),
          Container(
            height: context.height() * 0.80,
            width: context.width(),
            margin: EdgeInsets.only(left: 16, right: 16),
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Image.asset(
                  ResultCardImage,
                  fit: BoxFit.fill,
                  width: context.width(),
                ).paddingOnly(top: 100),
                Positioned(top: 0, height: 200, width: 200, child: Image.asset(resultWiseImage()!)),
                Image.asset(ResultCompleteImage, height: 200, width: 200),
                Text('${widget.quizHistoryData!.rightQuestion! * 10}', style: boldTextStyle(color: colorPrimary, size: 30)).paddingTop(30),
                Positioned(
                  bottom: 40,
                  left: 16,
                  right: 16,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 70,
                            height: 70,
                            color: colorSecondary,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Total', style: boldTextStyle(color: white)),
                                4.height,
                                Text('${widget.quizHistoryData!.totalQuestion}', style: boldTextStyle(color: white)),
                              ],
                            ),
                          ).cornerRadiusWithClipRRect(defaultRadius),
                          16.width,
                          Container(
                            width: 70,
                            height: 70,
                            color: greenColor,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Right', style: boldTextStyle(color: white)),
                                4.height,
                                Text('${widget.quizHistoryData!.rightQuestion}', style: boldTextStyle(color: white)),
                              ],
                            ),
                          ).cornerRadiusWithClipRRect(defaultRadius),
                          16.width,
                          Container(
                            width: 70,
                            height: 70,
                            color: Colors.red,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Wrong', style: boldTextStyle(color: white)),
                                4.height,
                                Text('${widget.quizHistoryData!.totalQuestion! - widget.quizHistoryData!.rightQuestion!}', style: boldTextStyle(color: white)),
                              ],
                            ),
                          ).cornerRadiusWithClipRRect(defaultRadius),
                        ],
                      ),
                      16.height,
                      gradientButton(
                          text: 'See Answers',
                          onTap: () {
                            QuizHistoryDetailScreen(quizHistoryData: widget.quizHistoryData).launch(context);
                          }),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 30,
            right: 16,
            child: Container(
              padding: EdgeInsets.all(8),
              color: white,
              child: Icon(Icons.home, color: colorPrimary).onTap(() {
                DashboardScreen().launch(context, isNewTask: true);
              }),
            ).cornerRadiusWithClipRRect(defaultRadius),
          ),
        ],
      ),
    );
  }
}
