import 'package:equatable/equatable.dart';

class VehicleService extends Equatable {
  final int order;
  final String name;
  final bool isActive;

  const VehicleService({
    required this.order,
    required this.name,
    required this.isActive,
  });

  @override
  List<Object?> get props => [
        order,
        name,
        isActive,
      ];

  @override
  bool? get stringify => true;
}
