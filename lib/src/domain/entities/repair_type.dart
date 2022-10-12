import 'package:equatable/equatable.dart';

class RepairType extends Equatable {
  final String name;
  final int imageNumber;

  const RepairType({
    required this.name,
    required this.imageNumber,
  });

  @override
  List<Object?> get props => [
        name,
        imageNumber,
      ];

  @override
  bool? get stringify => true;
}
