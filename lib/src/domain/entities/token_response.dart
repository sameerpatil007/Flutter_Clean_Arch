import 'package:equatable/equatable.dart';

class TokenResponse extends Equatable {
  final String accessToken;
  final String instanceUrl;
  final String tokenType;

  const TokenResponse({
    required this.accessToken,
    required this.instanceUrl,
    required this.tokenType,
  });

  @override
  List<Object?> get props => [
        accessToken,
        instanceUrl,
        tokenType,
      ];

  @override
  bool? get stringify => true;
}
