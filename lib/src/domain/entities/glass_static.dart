import 'package:equatable/equatable.dart';

import 'repair_type.dart';
import 'windshield_quadrant.dart';

class GlassStatic extends Equatable {
  final List<String> resinTintList;
  final List<String> resinList;
  final List<RepairType> repairTypeList;
  final List<WindshieldQuadrant> windshieldQuadrantList;

  const GlassStatic({
    required this.resinTintList,
    required this.resinList,
    required this.repairTypeList,
    required this.windshieldQuadrantList,
  });

  @override
  List<Object?> get props => [
        resinTintList,
        resinList,
        repairTypeList,
        windshieldQuadrantList,
      ];

  @override
  bool? get stringify => true;
}
