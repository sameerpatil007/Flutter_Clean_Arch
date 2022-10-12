import '../../domain/entities/work_order_picture.dart';

class WorkOrderPictureModel extends WorkOrderPicture {
  const WorkOrderPictureModel({
    required String url,
    required int slot,
    required String label,
    required String id,
    required String createdOn,
    required String updatedOn,
    required bool isActive,
  }) : super(
          url: url,
          slot: slot,
          label: label,
          id: id,
          createdOn: createdOn,
          updatedOn: updatedOn,
          isActive: isActive,
        );

  factory WorkOrderPictureModel.fromJson(Map<String, dynamic> json) {
    return WorkOrderPictureModel(
      url: json['url'],
      slot: json['slot'],
      label: json['label'],
      id: json['id'],
      createdOn: json['createdOn'],
      updatedOn: json['updatedOn'],
      isActive: json['isActive'],
    );
  }
}
