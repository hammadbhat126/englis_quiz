import 'package:englis_quiz/models/QuizModel.dart';
import 'package:englis_quiz/utils/constants.dart';
import 'package:intl/intl.dart';

import '../main.dart';
import 'BaseService.dart';

class DailyQuizService extends BaseService {
  DailyQuizService() {
    ref = db.collection('dailyQuiz');
  }

  Future<QuizModel> dailyQuiz() async {
    return await ref.doc(DateFormat(CurrentDateFormat).format(DateTime.now()) /*'06-05-2021'*/).get().then((value) => QuizModel.fromJson(value.data() as Map<String, dynamic>));
  }
}
