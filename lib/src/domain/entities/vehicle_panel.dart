import 'package:equatable/equatable.dart';

class VehiclePanel extends Equatable {
  final String id;
  final String panelId;
  final String name;
  final double price;
  final String visualName;
  final int r;
  final int cy;
  final int cx;
  final String mapCoordinate;
  final String mapClickableCoordinate;
  final String vehicleType;
  final List<String> serviceList;
  final double oversizeCostForOne;
  final bool isQuadrantSupported;
  final int pricingMethod;
  final double pricePerFeet;
  final bool isPerFeet;
  final bool isPackage;
  final bool isActive;

  const VehiclePanel({
    required this.id,
    required this.panelId,
    required this.name,
    required this.price,
    required this.visualName,
    required this.r,
    required this.cy,
    required this.cx,
    required this.mapCoordinate,
    required this.mapClickableCoordinate,
    required this.vehicleType,
    required this.serviceList,
    required this.oversizeCostForOne,
    required this.isQuadrantSupported,
    required this.pricingMethod,
    required this.pricePerFeet,
    required this.isPerFeet,
    required this.isPackage,
    required this.isActive,
  });

  @override
  List<Object?> get props => [
        id,
        panelId,
        name,
        price,
        visualName,
        r,
        cy,
        cx,
        mapCoordinate,
        mapClickableCoordinate,
        vehicleType,
        serviceList,
        oversizeCostForOne,
        isQuadrantSupported,
        pricingMethod,
        pricePerFeet,
        isPerFeet,
        isPackage,
        isActive,
      ];

  @override
  bool? get stringify => true;
}
