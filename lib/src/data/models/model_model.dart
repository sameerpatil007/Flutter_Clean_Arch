import '../../domain/entities/model.dart';

class ModelModel extends Model {
  const ModelModel({
    required String model,
    required String id,
    required bool isActive,
  }) : super(
          model: model,
          id: id,
          isActive: isActive,
        );

  factory ModelModel.fromJson(Map<String, dynamic> json) {
    return ModelModel(
      model: json['model'],
      id: json['id'],
      isActive: json['isActive'],
    );
  }
}
