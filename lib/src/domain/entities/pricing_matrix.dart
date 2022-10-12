import 'package:equatable/equatable.dart';

class PricingMatrix extends Equatable {
  final String panelId;
  final String size;
  final double price;
  final String count;
  final bool isActive;

  const PricingMatrix({
    required this.panelId,
    required this.size,
    required this.price,
    required this.count,
    required this.isActive,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['panelId'] = panelId;
    data['size'] = size;
    data['price'] = price;
    data['count'] = count;
    data['isActive'] = isActive;
    return data;
  }

  @override
  List<Object?> get props => [
        panelId,
        size,
        count,
        price,
        isActive,
      ];

  @override
  bool? get stringify => true;
}
