import '../../domain/entities/pricing_matrix.dart';

class PricingMatrixModel extends PricingMatrix {
  const PricingMatrixModel({
    required String panelId,
    required String size,
    required double price,
    required String count,
    required bool isActive,
  }) : super(
          panelId: panelId,
          size: size,
          price: price,
          count: count,
          isActive: isActive,
        );

  factory PricingMatrixModel.fromJson(Map<String, dynamic> json) {
    return PricingMatrixModel(
      panelId: json['panelId'],
      size: json['size'],
      price: json['price'],
      count: json['count'],
      isActive: json['isActive'],
    );
  }
}
