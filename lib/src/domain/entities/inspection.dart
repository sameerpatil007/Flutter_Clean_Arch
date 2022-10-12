import 'package:equatable/equatable.dart';

import 'inspection_photo.dart';

class Inspection extends Equatable {
  final String id;
  final int price;
  final String status;
  final DateTime inspectionDate;
  final List<InspectionPhoto> imageList;

  const Inspection({
    required this.id,
    required this.price,
    required this.status,
    required this.inspectionDate,
    required this.imageList,
  });

  @override
  List<Object?> get props => [
        id,
        price,
        status,
        inspectionDate,
        imageList,
      ];

  @override
  bool? get stringify => true;
}
