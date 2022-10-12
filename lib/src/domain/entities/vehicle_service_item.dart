import 'package:equatable/equatable.dart';

class VehicleServiceItem extends Equatable {
  final String id;
  final double price;
  final String name;
  final bool isActive;
  final List<String> serviceList;

  const VehicleServiceItem({
    required this.id,
    required this.price,
    required this.name,
    required this.isActive,
    required this.serviceList,
  });

  @override
  List<Object?> get props => [
        id,
        price,
        name,
        isActive,
        serviceList,
      ];

  @override
  bool? get stringify => true;
}
