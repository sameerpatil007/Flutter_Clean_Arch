import 'package:equatable/equatable.dart';

class Model extends Equatable {
  final String model;
  final String id;
  final bool isActive;

  const Model({
    required this.model,
    required this.id,
    required this.isActive,
  });

  @override
  List<Object?> get props => [
        model,
        id,
        isActive,
      ];

  @override
  bool? get stringify => true;
}
