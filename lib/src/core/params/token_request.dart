class TokenRequestParams {
  final String grantType;
  final String clientId;
  final String clientSecret;
  final String username;
  final String password;

  const TokenRequestParams({
    required this.grantType,
    required this.clientId,
    required this.clientSecret,
    required this.username,
    required this.password,
  });
}
