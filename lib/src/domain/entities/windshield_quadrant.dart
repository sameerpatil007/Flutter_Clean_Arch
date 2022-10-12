import 'package:equatable/equatable.dart';

class WindshieldQuadrant extends Equatable {
  final String visualName;
  final int r;
  final String id;
  final int cy;
  final int cx;

  const WindshieldQuadrant({
    required this.visualName,
    required this.r,
    required this.id,
    required this.cy,
    required this.cx,
  });

  @override
  List<Object?> get props => [
        visualName,
        r,
        id,
        cy,
        cx,
      ];

  @override
  bool? get stringify => true;
}
