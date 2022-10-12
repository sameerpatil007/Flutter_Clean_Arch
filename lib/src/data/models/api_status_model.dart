import '../../domain/entities/api_status.dart';

class ApiStatusModel extends ApiStatus {
  const ApiStatusModel({
    required int statusCode,
    required String title,
    required String message,
    required String lastSyncOn,
  }) : super(
          statusCode: statusCode,
          title: title,
          message: message,
          lastSyncOn: lastSyncOn,
        );

  factory ApiStatusModel.fromJson(Map<String, dynamic> json) {
    return ApiStatusModel(
      statusCode: json['statusCode'],
      title: json['title'],
      message: json['message'],
      lastSyncOn: json['lastSyncOn'],
    );
  }
}
