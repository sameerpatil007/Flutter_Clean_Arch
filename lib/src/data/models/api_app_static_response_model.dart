import 'api_status_model.dart';
import 'app_static_data_model.dart';

class ApiAppStaticDataResponseModel {
  final AppStaticDataModel? data;
  final ApiStatusModel status;

  ApiAppStaticDataResponseModel({
    required this.status,
    required this.data,
  });

  factory ApiAppStaticDataResponseModel.fromJson(Map<String, dynamic> json) {
    return ApiAppStaticDataResponseModel(
      status: ApiStatusModel.fromJson(json['status']),
      data: json['data'] != null ? AppStaticDataModel.fromJson(json['data']) : null,
    );
  }
}
