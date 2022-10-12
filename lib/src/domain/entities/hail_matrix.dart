import 'package:equatable/equatable.dart';

import 'pricing_matrix.dart';

class HailMatrix extends Equatable {
  final String pdfUrl;
  final String name;
  final String id;
  final List<PricingMatrix> pricingMatrixList;
  final bool isActive;

  const HailMatrix({
    required this.pdfUrl,
    required this.name,
    required this.id,
    required this.pricingMatrixList,
    required this.isActive,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pdfUrl'] = pdfUrl;
    data['name'] = name;
    data['id'] = id;
    data['isActive'] = isActive;
    data['pricingMatrixList'] = pricingMatrixList.map((x) => x.toJson()).toList();
    return data;
  }

  @override
  List<Object?> get props => [
        pdfUrl,
        name,
        id,
        isActive,
      ];

  @override
  bool? get stringify => true;
}
