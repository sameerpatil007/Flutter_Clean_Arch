import '../../domain/entities/coupon.dart';

class CouponModel extends Coupon {
  const CouponModel({
    required DateTime validTill,
    required int percentage,
    required String id,
    required String description,
    required String code,
  }) : super(
          validTill: validTill,
          percentage: percentage,
          id: id,
          description: description,
          code: code,
        );

  factory CouponModel.fromJson(Map<String, dynamic> json) {
    return CouponModel(
      validTill: DateTime.parse(json['validTill']),
      percentage: json['percentage'],
      id: json['id'],
      description: json['description'],
      code: json['code'],
    );
  }
}
