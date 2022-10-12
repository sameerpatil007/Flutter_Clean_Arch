import 'package:equatable/equatable.dart';

import 'model.dart';

class Make extends Equatable {
  final String make;
  final String id;
  final List<Model> modelList;
  final bool isActive;

  const Make({
    required this.make,
    required this.id,
    required this.modelList,
    required this.isActive,
  });

  @override
  List<Object?> get props => [
        make,
        id,
        modelList,
        isActive,
      ];

  @override
  bool? get stringify => true;
}
