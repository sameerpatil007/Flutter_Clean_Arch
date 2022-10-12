import '../../domain/entities/vehicle_service_item.dart';

class VehicleServiceItemModel extends VehicleServiceItem {
  const VehicleServiceItemModel({
    required String id,
    required double price,
    required String name,
    required bool isActive,
    required List<String> serviceList,
  }) : super(
          id: id,
          price: price,
          name: name,
          isActive: isActive,
          serviceList: serviceList,
        );

  factory VehicleServiceItemModel.fromJson(Map<String, dynamic> json) {
    return VehicleServiceItemModel(
      id: json['id'],
      price: json['price'],
      name: json['name'],
      isActive: json['isActive'],
      serviceList: json['serviceList'].toList().cast<String>(),
    );
  }
}
