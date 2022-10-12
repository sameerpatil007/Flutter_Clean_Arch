import '../../domain/entities/faq_answer.dart';

class FaqAnswerModel extends FaqAnswer {
  const FaqAnswerModel({
    required String title,
    required String id,
    // required String url,
    required String description,
    required int sortOrder,
    required bool isActive,
  }) : super(
          title: title,
          id: id,
          // url: url,
          description: description,
          sortOrder: sortOrder,
          isActive: isActive,
        );

  factory FaqAnswerModel.fromJson(Map<String, dynamic> json) {
    return FaqAnswerModel(
      title: json['title'],
      id: json['id'],
      sortOrder: json['sortOrder'],
      // url: json['url'],
      description: json['description'],
      isActive: json['isActive'],
    );
  }
}
