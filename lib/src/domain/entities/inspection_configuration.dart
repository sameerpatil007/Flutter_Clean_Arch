import 'package:equatable/equatable.dart';

import 'optional_slot.dart';

class InspectionConfiguration extends Equatable {
  final List<OptionalSlot> optionalSlotList;
  final bool isTireSelected;
  final bool isTireReadOnly;
  final bool isInteriorSelected;
  final bool isInteriorReadOnly;
  final bool isExteriorSelected;
  final bool isExteriorReadOnly;

  const InspectionConfiguration({
    required this.optionalSlotList,
    required this.isTireSelected,
    required this.isTireReadOnly,
    required this.isInteriorSelected,
    required this.isInteriorReadOnly,
    required this.isExteriorSelected,
    required this.isExteriorReadOnly,
  });

  @override
  List<Object?> get props => [
        optionalSlotList,
        isTireSelected,
        isTireReadOnly,
        isInteriorSelected,
        isInteriorReadOnly,
        isExteriorSelected,
        isExteriorReadOnly,
      ];

  @override
  bool? get stringify => true;
}
