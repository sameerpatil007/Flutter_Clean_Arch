import '../../domain/entities/vehicle_type.dart';

class VehicleTypeModel extends VehicleType {
  const VehicleTypeModel({
    required String id,
    required String name,
    required String type,
    required int door,
    required int exteriorImage,
    required int interiorImage,
    required bool isActive,
  }) : super(
            id: id,
            name: name,
            type: type,
            door: door,
            exteriorImage: exteriorImage,
            interiorImage: interiorImage,
            isActive: isActive);

  factory VehicleTypeModel.fromJson(Map<String, dynamic> json) {
    return VehicleTypeModel(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      door: json['door'],
      exteriorImage: json['exteriorImage'],
      interiorImage: json['interiorImage'],
      isActive: json['isActive'],
    );
  }
}
