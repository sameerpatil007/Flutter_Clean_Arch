import '../../domain/entities/add_on.dart';

class AddOnModel extends AddOn {
  const AddOnModel({
    required int value,
    required String name,
  }) : super(
          value: value,
          name: name,
        );

  factory AddOnModel.fromJson(Map<String, dynamic> json) {
    return AddOnModel(
      value: json['value'],
      name: json['name'],
    );
  }
}
