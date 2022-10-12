import '../../domain/entities/glass_static.dart';
import 'repair_type_model.dart';
import 'windshield_quadrant_model.dart';

class GlassStaticModel extends GlassStatic {
  const GlassStaticModel({
    required List<String> resinTintList,
    required List<String> resinList,
    required List<RepairTypeModel> repairTypeList,
    required List<WindshieldQuadrantModel> windshieldQuadrantList,
  }) : super(
          resinTintList: resinTintList,
          resinList: resinList,
          repairTypeList: repairTypeList,
          windshieldQuadrantList: windshieldQuadrantList,
        );

  factory GlassStaticModel.fromJson(Map<String, dynamic> json) {
    return GlassStaticModel(
      resinTintList: json['resinTintList'].cast<String>(),
      resinList: json['resinList'].cast<String>(),
      repairTypeList: json['repairTypeList'].map<RepairTypeModel>((x) => RepairTypeModel.fromJson(x)).toList(),
      windshieldQuadrantList: json['windshieldQuadrantList']
          .map<WindshieldQuadrantModel>((x) => WindshieldQuadrantModel.fromJson(x))
          .toList(),
    );
  }
}
