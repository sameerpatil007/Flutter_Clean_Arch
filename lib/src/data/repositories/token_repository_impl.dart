import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:vehiclehub/src/core/utils/constants.dart';

import '../../core/resources/data_state.dart';
import '../../domain/entities/token_response.dart';
import '../../domain/repositories/token_repository.dart';
import '../data_sources/remote/token_api_service.dart';

class TokenRepositoryImpl implements TokenRepository {
  final TokenApiService _tokenApiService;

  TokenRepositoryImpl(this._tokenApiService);

  String? accessToken;

  @override
  String? get token => accessToken;

  @override
  Future<DataState<TokenResponse>> getAuthToken() async {
    try {
      final HttpResponse httpResponse = await _tokenApiService.getApiAccessToken(
          grantType: kAuthGrantType,
          clientId: kAuthClientId,
          clientSecret: kAuthClientSecret,
          username: kAuthUsername,
          password: kAuthPassword);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        accessToken = (httpResponse.data as TokenResponse).accessToken;
        return DataSuccess(httpResponse.data);
      }

      return DataFailed(
        DioError(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          requestOptions: httpResponse.response.requestOptions,
          type: DioErrorType.response,
        ),
      );
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }
}
