import 'package:equatable/equatable.dart';

class ServiceTechnician extends Equatable {
  final int splitValue;
  final String id;

  const ServiceTechnician({
    required this.splitValue,
    required this.id,
  });

  @override
  List<Object?> get props => [
        splitValue,
        id,
      ];

  @override
  bool? get stringify => true;
}
