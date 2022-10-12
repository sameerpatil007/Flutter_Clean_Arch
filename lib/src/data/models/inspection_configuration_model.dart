import '../../domain/entities/inspection_configuration.dart';
import 'optional_slot_model.dart';

class InspectionConfigurationModel extends InspectionConfiguration {
  const InspectionConfigurationModel({
    required List<OptionalSlotModel> optionalSlotList,
    required bool isTireSelected,
    required bool isTireReadOnly,
    required bool isInteriorSelected,
    required bool isInteriorReadOnly,
    required bool isExteriorSelected,
    required bool isExteriorReadOnly,
  }) : super(
          optionalSlotList: optionalSlotList,
          isTireSelected: isTireSelected,
          isTireReadOnly: isTireReadOnly,
          isInteriorSelected: isInteriorSelected,
          isInteriorReadOnly: isInteriorReadOnly,
          isExteriorSelected: isExteriorSelected,
          isExteriorReadOnly: isExteriorReadOnly,
        );

  factory InspectionConfigurationModel.fromJson(Map<String, dynamic> json) {
    return InspectionConfigurationModel(
      optionalSlotList: json['optionalSlotList'].map<OptionalSlotModel>((x) => OptionalSlotModel.fromJson(x)).toList(),
      isTireSelected: json['isTireSelected'],
      isTireReadOnly: json['isTireReadOnly'],
      isInteriorSelected: json['isInteriorSelected'],
      isInteriorReadOnly: json['isInteriorReadOnly'],
      isExteriorSelected: json['isExteriorSelected'],
      isExteriorReadOnly: json['isExteriorReadOnly'],
    );
  }
}
