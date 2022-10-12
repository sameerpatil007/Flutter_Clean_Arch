import 'package:equatable/equatable.dart';

import 'faq_answer.dart';

class Faq extends Equatable {
  final String title;
  final String id;
  final List<FaqAnswer> answerList;
  final int sortOrder;
  final bool isActive;

  const Faq({
    required this.title,
    required this.id,
    required this.answerList,
    required this.sortOrder,
    required this.isActive,
  });

  @override
  List<Object?> get props => [
        title,
        id,
        answerList,
        sortOrder,
        isActive,
      ];

  @override
  bool? get stringify => true;
}
