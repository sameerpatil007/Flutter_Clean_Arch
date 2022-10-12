import 'package:equatable/equatable.dart';

import 'service_commission.dart';
import 'service_panel.dart';

class Service extends Equatable {
  final int pricingMode;
  final int totalPrice;
  final int totalHours;
  final int laborRate;
  final ServiceCommission technicianData;
  final List<ServicePanel> panelList;
  final String createdOn;
  final String updatedOn;
  final bool isActive;

  const Service({
    required this.pricingMode,
    required this.totalPrice,
    required this.totalHours,
    required this.laborRate,
    required this.technicianData,
    required this.panelList,
    required this.createdOn,
    required this.updatedOn,
    required this.isActive,
  });

  @override
  List<Object?> get props => [
        pricingMode,
        totalPrice,
        totalHours,
        laborRate,
        technicianData,
        panelList,
        createdOn,
        updatedOn,
        isActive,
      ];

  @override
  bool? get stringify => true;
}
