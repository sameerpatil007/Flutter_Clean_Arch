import 'package:equatable/equatable.dart';

class InspectionLocation extends Equatable {
  final String name;
  final String contact;
  final String address;

  const InspectionLocation({
    required this.name,
    required this.contact,
    required this.address,
  });

  @override
  List<Object?> get props => [
        name,
        contact,
        address,
      ];

  @override
  bool? get stringify => true;
}
