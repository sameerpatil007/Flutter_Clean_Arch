import '../../domain/entities/vehicle_service.dart';

class VehicleServiceModel extends VehicleService {
  const VehicleServiceModel({
    required int order,
    required String name,
    required bool isActive,
  }) : super(
          order: order,
          name: name,
          isActive: isActive,
        );

  factory VehicleServiceModel.fromJson(Map<String, dynamic> json) {
    return VehicleServiceModel(
      order: json['order'],
      name: json['name'],
      isActive: json['isActive'],
    );
  }
}
