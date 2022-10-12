import 'package:equatable/equatable.dart';

import 'faq.dart';

class FaqSection extends Equatable {
  final String title;
  final String id;
  final int sortOrder;
  final bool isActive;
  final List<Faq> faqList;

  const FaqSection({
    required this.title,
    required this.id,
    required this.sortOrder,
    required this.isActive,
    required this.faqList,
  });

  @override
  List<Object?> get props => [
        title,
        id,
        sortOrder,
        isActive,
        faqList,
      ];

  @override
  bool? get stringify => true;
}
