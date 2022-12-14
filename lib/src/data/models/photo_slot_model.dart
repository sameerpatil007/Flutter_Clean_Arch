import '../../domain/entities/photo_slot.dart';

class PhotoSlotModel extends PhotoSlot {
  const PhotoSlotModel({
    required String photoCaptureInstruction,
    required bool isSubmitToAI,
    required bool isMandatory,
    required bool isLandscape,
    required String instructionImageUrl,
    String? vanLink,
    String? truckLink,
    String? suvLink,
    String? minivanLink,
    String? hatchbackLink,
    String? carLink,
    String? busLink,
    required int order,
    required int minDoor,
    required int maxDoor,
    required int minSeatCapacity,
    required bool isHideInSummary,
    required String name,
    required String shortName,
    required bool isActive,
  }) : super(
          photoCaptureInstruction: photoCaptureInstruction,
          isSubmitToAI: isSubmitToAI,
          isMandatory: isMandatory,
          isLandscape: isLandscape,
          instructionImageUrl: instructionImageUrl,
          vanLink: vanLink,
          truckLink: truckLink,
          suvLink: suvLink,
          minivanLink: minivanLink,
          hatchbackLink: hatchbackLink,
          carLink: carLink,
          busLink: busLink,
          minDoor: minDoor,
          maxDoor: maxDoor,
          minSeatCapacity: minSeatCapacity,
          isHideInSummary: isHideInSummary,
          order: order,
          name: name,
          shortName: shortName,
          isActive: isActive,
        );

  factory PhotoSlotModel.fromJson(Map<String, dynamic> json) {
    return PhotoSlotModel(
      photoCaptureInstruction: json['photoCaptureInstruction'],
      isSubmitToAI: json['isSubmitToAI'],
      isMandatory: json['isMandatory'],
      isLandscape: json['isLandscape'],
      instructionImageUrl: json['instructionImageUrl'],
      vanLink: json['vanLink'],
      truckLink: json['truckLink'],
      suvLink: json['suvLink'],
      minivanLink: json['minivanLink'],
      hatchbackLink: json['hatchbackLink'],
      carLink: json['carLink'],
      busLink: json['busLink'],
      order: json['order'],
      minDoor: json['minDoor'],
      maxDoor: json['maxDoor'],
      minSeatCapacity: json['minSeatCapacity'],
      isHideInSummary: json['isHideInSummary'],
      name: json['name'],
      shortName: json['shortName'],
      isActive: json['isActive'],
    );
  }
}
