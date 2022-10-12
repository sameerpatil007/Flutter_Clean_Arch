import '../../domain/entities/repair_type.dart';

class RepairTypeModel extends RepairType {
  const RepairTypeModel({
    required String name,
    required int imageNumber,
  }) : super(
          name: name,
          imageNumber: imageNumber,
        );

  factory RepairTypeModel.fromJson(Map<String, dynamic> json) {
    return RepairTypeModel(
      name: json['name'],
      imageNumber: json['imageNumber'],
    );
  }
}
