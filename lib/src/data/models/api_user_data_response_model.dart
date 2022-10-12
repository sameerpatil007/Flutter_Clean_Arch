import 'api_status_model.dart';
import 'user_specific_data_model.dart';

class ApiUserDataResponseModel {
  final UserSpecificDataModel? data;
  final ApiStatusModel status;

  ApiUserDataResponseModel({
    required this.status,
    required this.data,
  });

  factory ApiUserDataResponseModel.fromJson(Map<String, dynamic> json) {
    return ApiUserDataResponseModel(
      status: ApiStatusModel.fromJson(json['status']),
      data: json['data'] != null ? UserSpecificDataModel.fromJson(json['data']) : null,
    );
  }
}
