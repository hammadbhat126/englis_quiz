import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:englis_quiz/components/QuizComponent.dart';
import 'package:englis_quiz/models/QuizModel.dart';
import 'package:englis_quiz/screens/QuizDescriptionScreen.dart';
import 'package:englis_quiz/services/QuizService.dart';
import 'package:englis_quiz/utils/colors.dart';
import 'package:englis_quiz/utils/constants.dart';
import 'package:englis_quiz/utils/widgets.dart';

class QuizScreen extends StatefulWidget {
  static String tag = '/QuizScreen';

  final String? catName, catId;

  QuizScreen({this.catName, this.catId});

  @override
  QuizScreenState createState() => QuizScreenState();
}

class QuizScreenState extends State<QuizScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.catName}'),
        backgroundColor: colorPrimary,
      ),
      body: FutureBuilder<List<QuizModel>>(
        future: QuizService().getQuizByCatId(widget.catId),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return snapshot.data!.isNotEmpty
                ? SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.all(16),
                      child: Wrap(
                        runSpacing: 16,
                        spacing: 16,
                        children: snapshot.data!.map((mData) {
                          return QuizComponent(quiz: mData).onTap(() {
                            if (mData.questionRef.validate().isEmpty) return toast('No question found');

                            if (mData.minRequiredPoint! <= getIntAsync(USER_POINTS)) {
                              QuizDescriptionScreen(quizModel: mData).launch(context);
                            } else {
                              toast('Your Points:${getIntAsync(USER_POINTS)} \n minimum Required Points is ${mData.minRequiredPoint}');
                            }
                          });
                        }).toList(),
                      ),
                    ),
                  )
                : emptyWidget();
          }
          return snapWidgetHelper(snapshot, defaultErrorMessage: errorSomethingWentWrong);
        },
      ),
    );
  }
}
