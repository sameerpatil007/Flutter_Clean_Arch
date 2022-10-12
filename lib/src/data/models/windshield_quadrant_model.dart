import '../../domain/entities/windshield_quadrant.dart';

class WindshieldQuadrantModel extends WindshieldQuadrant {
  const WindshieldQuadrantModel({
    required String visualName,
    required int r,
    required String id,
    required int cy,
    required int cx,
  }) : super(
          visualName: visualName,
          r: r,
          id: id,
          cy: cy,
          cx: cx,
        );

  factory WindshieldQuadrantModel.fromJson(Map<String, dynamic> json) {
    return WindshieldQuadrantModel(
      visualName: json['visualName'],
      r: json['r'],
      id: json['id'],
      cy: json['cy'],
      cx: json['cx'],
    );
  }
}
