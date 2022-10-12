import '../../domain/entities/login_response.dart';
import 'account_model.dart';
import 'api_status_model.dart';

class LoginResponseModel extends LoginResponse {
  const LoginResponseModel({
    required ApiStatusModel status,
    AccountModel? account,
    String? sessionId,
  }) : super(
          status: status,
          account: account,
          sessionId: sessionId,
        );

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      status: ApiStatusModel.fromJson(json['status']),
      account: AccountModel.fromJson(json['account']),
      sessionId: json['sessionId'],
    );
  }
}
