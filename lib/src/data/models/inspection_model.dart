import '../../domain/entities/inspection.dart';
import 'inspection_photo_model.dart';

class InspectionModel extends Inspection {
  const InspectionModel({
    required String id,
    required int price,
    required String status,
    required DateTime inspectionDate,
    required List<InspectionPhotoModel> imageList,
  }) : super(
          id: id,
          price: price,
          status: status,
          inspectionDate: inspectionDate,
          imageList: imageList,
        );

  factory InspectionModel.fromJson(Map<String, dynamic> json) {
    return InspectionModel(
      id: json['id'],
      price: json['price'],
      status: json['status'],
      inspectionDate: DateTime.parse(json['inspectionDate']),
      imageList: json['imageList'].map((x) => InspectionPhotoModel.fromJson(x)),
    );
  }
}
