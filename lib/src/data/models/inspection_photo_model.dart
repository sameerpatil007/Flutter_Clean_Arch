import '../../domain/entities/inspection_photo.dart';

class InspectionPhotoModel extends InspectionPhoto {
  const InspectionPhotoModel({
    required int slot,
    required String id,
    required int width,
    required int height,
    required String url,
    required String damageOverlayUrl,
    required bool hasDamage,
    required String createdOn,
    required String updatedOn,
    required bool isActive,
  }) : super(
          slot: slot,
          id: id,
          width: width,
          height: height,
          url: url,
          damageOverlayUrl: damageOverlayUrl,
          hasDamage: hasDamage,
          createdOn: createdOn,
          updatedOn: updatedOn,
          isActive: isActive,
        );

  factory InspectionPhotoModel.fromJson(Map<String, dynamic> json) {
    return InspectionPhotoModel(
      slot: json['slot'],
      id: json['id'],
      width: json['width'],
      height: json['height'],
      url: json['url'],
      damageOverlayUrl: json['damageOverlayUrl'],
      hasDamage: json['hasDamage'],
      createdOn: json['createdOn'],
      updatedOn: json['updatedOn'],
      isActive: json['isActive'],
    );
  }
}
