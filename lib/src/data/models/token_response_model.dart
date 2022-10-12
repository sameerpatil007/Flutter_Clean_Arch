import '../../domain/entities/token_response.dart';

class TokenResponseModel extends TokenResponse {
  const TokenResponseModel({
    required String accessToken,
    required String instanceUrl,
    required String tokenType,
  }) : super(
          accessToken: accessToken,
          instanceUrl: instanceUrl,
          tokenType: tokenType,
        );

  factory TokenResponseModel.fromJson(Map<String, dynamic> json) {
    return TokenResponseModel(
      accessToken: json['access_token'],
      instanceUrl: json['instance_url'],
      tokenType: json['token_type'],
    );
  }
}
