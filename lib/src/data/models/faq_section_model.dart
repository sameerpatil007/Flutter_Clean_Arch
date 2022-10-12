import '../../domain/entities/faq_section.dart';
import 'faq_model.dart';

class FaqSectionModel extends FaqSection {
  const FaqSectionModel({
    required String title,
    required String id,
    required int sortOrder,
    required bool isActive,
    required List<FaqModel> faqList,
  }) : super(
          title: title,
          id: id,
          sortOrder: sortOrder,
          isActive: isActive,
          faqList: faqList,
        );

  factory FaqSectionModel.fromJson(Map<String, dynamic> json) {
    return FaqSectionModel(
      title: json['title'],
      id: json['id'],
      sortOrder: json['sortOrder'],
      isActive: json['isActive'],
      faqList: json['faqList'].map<FaqModel>((x) => FaqModel.fromJson(x)).toList(),
    );
  }
}
