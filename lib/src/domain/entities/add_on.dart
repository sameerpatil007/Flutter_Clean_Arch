import 'package:equatable/equatable.dart';

class AddOn extends Equatable {
  final int value;
  final String name;

  const AddOn({
    required this.value,
    required this.name,
  });

  @override
  List<Object?> get props => [
        value,
        name,
      ];

  @override
  bool? get stringify => true;
}
