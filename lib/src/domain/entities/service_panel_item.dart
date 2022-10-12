import 'package:equatable/equatable.dart';

class ServicePanelItem extends Equatable {
  final String id;
  final String subPanelType;
  final int price;
  final String name;
  final bool isCustom;
  final bool isRnR;
  final int hoursRequired;
  final String quadrantId;
  final String repairType;
  final String resin;
  final String resinTint;
  final String oemPart;
  final String nagsId;
  final String lotNumber;
  final String expirationDate;
  final String partNumber;
  final bool isReceived;
  final int cost;

  const ServicePanelItem({
    required this.id,
    required this.subPanelType,
    required this.price,
    required this.name,
    required this.isCustom,
    required this.isRnR,
    required this.hoursRequired,
    required this.quadrantId,
    required this.repairType,
    required this.resin,
    required this.resinTint,
    required this.oemPart,
    required this.nagsId,
    required this.lotNumber,
    required this.expirationDate,
    required this.partNumber,
    required this.isReceived,
    required this.cost,
  });

  @override
  List<Object?> get props => [
        id,
        subPanelType,
        price,
        name,
        isCustom,
        isRnR,
        hoursRequired,
        quadrantId,
        repairType,
        resin,
        resinTint,
        oemPart,
        nagsId,
        lotNumber,
        expirationDate,
        partNumber,
        isReceived,
        cost,
      ];

  @override
  bool? get stringify => true;
}
