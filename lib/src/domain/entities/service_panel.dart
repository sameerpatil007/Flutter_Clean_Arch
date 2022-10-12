import 'package:equatable/equatable.dart';

import 'service_panel_item.dart';

class ServicePanel extends Equatable {
  final String id;
  final int price;
  final String panelType;
  final String name;
  final bool isCustom;
  final int totalFeet;
  final String pricingMethod;
  final int pricePerFeet;
  final bool isPerFeet;
  final String description;
  final bool isPackage;
  final int oversizeQuantity;
  final int oversizeCost;
  final int hailCost;
  final String dentSize;
  final String dentCount;
  final String addOnName;
  final int addOnValue;
  final bool isCustomAddOn;
  final List<ServicePanelItem> subPanel;

  const ServicePanel({
    required this.id,
    required this.price,
    required this.panelType,
    required this.name,
    required this.isCustom,
    required this.totalFeet,
    required this.pricingMethod,
    required this.pricePerFeet,
    required this.isPerFeet,
    required this.description,
    required this.isPackage,
    required this.oversizeQuantity,
    required this.oversizeCost,
    required this.hailCost,
    required this.dentSize,
    required this.dentCount,
    required this.addOnName,
    required this.addOnValue,
    required this.isCustomAddOn,
    required this.subPanel,
  });

  @override
  List<Object?> get props => [
        id,
        price,
        panelType,
        name,
        isCustom,
        totalFeet,
        pricingMethod,
        pricePerFeet,
        isPerFeet,
        description,
        isPackage,
        oversizeQuantity,
        oversizeCost,
        hailCost,
        dentSize,
        dentCount,
        addOnName,
        addOnValue,
        isCustomAddOn,
        subPanel,
      ];

  @override
  bool? get stringify => true;
}
