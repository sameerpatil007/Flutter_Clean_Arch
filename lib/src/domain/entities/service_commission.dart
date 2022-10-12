import 'package:equatable/equatable.dart';

import 'service_technician.dart';

class ServiceCommission extends Equatable {
  final bool isPercentSplit;
  final List<ServiceTechnician> technicianList;

  const ServiceCommission({
    required this.isPercentSplit,
    required this.technicianList,
  });

  @override
  List<Object?> get props => [
        isPercentSplit,
        technicianList,
      ];

  @override
  bool? get stringify => true;
}
