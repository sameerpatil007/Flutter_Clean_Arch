import '../../domain/entities/optional_slot.dart';

class OptionalSlotModel extends OptionalSlot {
  const OptionalSlotModel({
    required String name,
    required bool isSelected,
    required bool isReadOnly,
    required String id,
  }) : super(
          name: name,
          isSelected: isSelected,
          isReadOnly: isReadOnly,
          id: id,
        );

  factory OptionalSlotModel.fromJson(Map<String, dynamic> json) {
    return OptionalSlotModel(
      name: json['name'],
      isSelected: json['isSelected'],
      isReadOnly: json['isReadOnly'],
      id: json['id'],
    );
  }
}
