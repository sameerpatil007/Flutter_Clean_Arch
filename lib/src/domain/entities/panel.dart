import 'package:equatable/equatable.dart';

class Panel extends Equatable {
  final String id;
  final String name;
  final bool isActive;

  const Panel({
    required this.id,
    required this.name,
    required this.isActive,
  });

  @override
  List<Object?> get props => [
        name,
        id,
        isActive,
      ];

  @override
  bool? get stringify => true;
}
