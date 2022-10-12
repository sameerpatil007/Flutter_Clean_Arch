import 'package:equatable/equatable.dart';

class InspectionPhoto extends Equatable {
  final int slot;
  final String id;
  final int width;
  final int height;
  final String url;
  final String damageOverlayUrl;
  final bool hasDamage;
  final String createdOn;
  final String updatedOn;
  final bool isActive;

  const InspectionPhoto({
    required this.slot,
    required this.id,
    required this.width,
    required this.height,
    required this.url,
    required this.damageOverlayUrl,
    required this.hasDamage,
    required this.createdOn,
    required this.updatedOn,
    required this.isActive,
  });

  @override
  List<Object?> get props => [
        slot,
        id,
        width,
        height,
        url,
        damageOverlayUrl,
        hasDamage,
        createdOn,
        updatedOn,
        isActive,
      ];

  @override
  bool? get stringify => true;
}
