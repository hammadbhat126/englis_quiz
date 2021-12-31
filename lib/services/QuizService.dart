
import 'package:englis_quiz/models/QuizModel.dart';
import 'package:englis_quiz/utils/ModelKeys.dart';

import '../main.dart';
import 'BaseService.dart';

class QuizService extends BaseService {
  QuizService() {
    ref = db.collection('quiz');
  }

  Future<List<QuizModel>> getQuizByCatId(String? id) async {
    return await ref.where(QuizKeys.categoryId, isEqualTo: id).get().then((event) => event.docs.map((e) => QuizModel.fromJson(e.data() as Map<String, dynamic>)).toList());
  }

}
