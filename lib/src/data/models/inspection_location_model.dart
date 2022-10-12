import '../../domain/entities/inspection_location.dart';

class InspectionLocationModel extends InspectionLocation {
  const InspectionLocationModel({
    required String name,
    required String contact,
    required String address,
  }) : super(
          name: name,
          contact: contact,
          address: address,
        );

  factory InspectionLocationModel.fromJson(Map<String, dynamic> json) {
    return InspectionLocationModel(
      name: json['name'],
      contact: json['contact'],
      address: json['address'],
    );
  }
}
