import 'package:equatable/equatable.dart';

class WorkOrderPicture extends Equatable {
  final String url;
  final int slot;
  final String label;
  final String id;
  final String createdOn;
  final String updatedOn;
  final bool isActive;

  const WorkOrderPicture({
    required this.url,
    required this.slot,
    required this.label,
    required this.id,
    required this.createdOn,
    required this.updatedOn,
    required this.isActive,
  });

  @override
  List<Object?> get props => [
        url,
        slot,
        label,
        id,
        createdOn,
        updatedOn,
        isActive,
      ];

  @override
  bool? get stringify => true;
}
