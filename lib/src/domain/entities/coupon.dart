import 'package:equatable/equatable.dart';

class Coupon extends Equatable {
  final DateTime validTill;
  final int percentage;
  final String id;
  final String description;
  final String code;

  const Coupon({
    required this.validTill,
    required this.percentage,
    required this.id,
    required this.description,
    required this.code,
  });

  @override
  List<Object?> get props => [
        validTill,
        percentage,
        id,
        description,
        code,
      ];

  @override
  bool? get stringify => true;
}
