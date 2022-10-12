import '../../domain/entities/faq.dart';
import 'faq_answer_model.dart';

class FaqModel extends Faq {
  const FaqModel({
    required String title,
    required String id,
    required List<FaqAnswerModel> answerList,
    required int sortOrder,
    required bool isActive,
  }) : super(
          title: title,
          id: id,
          answerList: answerList,
          sortOrder: sortOrder,
          isActive: isActive,
        );

  factory FaqModel.fromJson(Map<String, dynamic> json) {
    return FaqModel(
      title: json['title'],
      id: json['id'],
      answerList: json['answerList'].map<FaqAnswerModel>((x) => FaqAnswerModel.fromJson(x)).toList(),
      sortOrder: json['sortOrder'],
      isActive: json['isActive'],
    );
  }
}
