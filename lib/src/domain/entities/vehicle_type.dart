import 'package:equatable/equatable.dart';

class VehicleType extends Equatable {
  final String id;
  final String name;
  final String type;
  final int door;
  final int exteriorImage;
  final int interiorImage;
  final bool isActive;

  const VehicleType({
    required this.id,
    required this.name,
    required this.type,
    required this.door,
    required this.exteriorImage,
    required this.interiorImage,
    required this.isActive,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        type,
        door,
        exteriorImage,
        interiorImage,
        isActive,
      ];

  @override
  bool? get stringify => true;
}
