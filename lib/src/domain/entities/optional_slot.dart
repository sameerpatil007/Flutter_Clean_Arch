import 'package:equatable/equatable.dart';

class OptionalSlot extends Equatable {
  final String name;
  final bool isSelected;
  final bool isReadOnly;
  final String id;

  const OptionalSlot({
    required this.name,
    required this.isSelected,
    required this.isReadOnly,
    required this.id,
  });

  @override
  List<Object?> get props => [
        name,
        isSelected,
        isReadOnly,
        id,
      ];

  @override
  bool? get stringify => true;
}
