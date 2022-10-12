import 'package:equatable/equatable.dart';

class PhotoSlot extends Equatable {
  final String photoCaptureInstruction;
  final bool isSubmitToAI;
  final bool isMandatory;
  final bool isLandscape;
  final String instructionImageUrl;
  final String? vanLink;
  final String? truckLink;
  final String? suvLink;
  final String? minivanLink;
  final String? hatchbackLink;
  final String? carLink;
  final String? busLink;
  final int order;
  final int minDoor;
  final int maxDoor;
  final int minSeatCapacity;
  final bool isHideInSummary;
  final String name;
  final String shortName;
  final bool isActive;

  const PhotoSlot({
    required this.photoCaptureInstruction,
    required this.isSubmitToAI,
    required this.isMandatory,
    required this.isLandscape,
    required this.instructionImageUrl,
    required this.order,
    required this.name,
    required this.shortName,
    required this.isActive,
    this.vanLink,
    this.busLink,
    this.truckLink,
    this.suvLink,
    this.minivanLink,
    this.hatchbackLink,
    this.carLink,
    required this.minDoor,
    required this.maxDoor,
    required this.minSeatCapacity,
    required this.isHideInSummary,
  });

  @override
  List<Object?> get props => [
        photoCaptureInstruction,
        isSubmitToAI,
        isMandatory,
        isLandscape,
        instructionImageUrl,
        vanLink,
        busLink,
        order,
        name,
        shortName,
        isActive,
        truckLink,
        suvLink,
        minivanLink,
        hatchbackLink,
        carLink,
        busLink,
        minDoor,
        maxDoor,
        minSeatCapacity,
        isHideInSummary,
      ];

  @override
  bool? get stringify => true;
}
