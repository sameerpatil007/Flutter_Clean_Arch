import '../../domain/entities/make.dart';
import 'model_model.dart';

class MakeModel extends Make {
  const MakeModel({
    required String make,
    required String id,
    required List<ModelModel> modelList,
    required bool isActive,
  }) : super(
          make: make,
          id: id,
          modelList: modelList,
          isActive: isActive,
        );

  factory MakeModel.fromJson(Map<String, dynamic> json) {
    return MakeModel(
      make: json['make'],
      id: json['id'],
      modelList: json['modelList'].map<ModelModel>((x) => ModelModel.fromJson(x)).toList(),
      isActive: json['isActive'],
    );
  }
}
