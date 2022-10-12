import '../../domain/entities/hail_matrix.dart';
import 'pricing_matrix_model.dart';

class HailMatrixModel extends HailMatrix {
  const HailMatrixModel({
    required String pdfUrl,
    required String name,
    required String id,
    required bool isActive,
    required List<PricingMatrixModel> pricingMatrixList,
  }) : super(
          pdfUrl: pdfUrl,
          name: name,
          id: id,
          pricingMatrixList: pricingMatrixList,
          isActive: isActive,
        );

  factory HailMatrixModel.fromJson(Map<String, dynamic> json) {
    return HailMatrixModel(
      pdfUrl: json['pdfUrl'],
      name: json['name'],
      id: json['id'],
      pricingMatrixList:
          json['pricingMatrixList'].map<PricingMatrixModel>((x) => PricingMatrixModel.fromJson(x)).toList(),
      isActive: json['isActive'],
    );
  }
}
