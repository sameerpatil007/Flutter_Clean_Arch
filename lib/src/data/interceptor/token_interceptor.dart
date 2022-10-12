import 'package:dio/dio.dart';

import '../../domain/entities/token_response.dart';
import '../../domain/repositories/token_repository.dart';
import '../../core/resources/data_state.dart';
import '../../core/utils/constants.dart';

class TokenInterceptor extends Interceptor {
  final TokenRepository _tokenRepository;

  TokenInterceptor(this._tokenRepository);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    String? token = _tokenRepository.token;
    if (token != null) {
      options.headers[kAuthorizationHeader] = 'Bearer $token';
      handler.next(options);
    } else {
      try {
        String? token = await _fetchTokenResponse();
        options.headers[kAuthorizationHeader] = 'Bearer $token';
        handler.next(options);
      } on DioError catch (error, stackTrace) {
        handler.reject(error, true);
      }
    }
    // super.onRequest(options, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      var options = err.response!.requestOptions;

      try {
        String? token = await _fetchTokenResponse();
        options.headers[kAuthorizationHeader] = 'Bearer $token';
        handler.resolve(err.response!);
      } on DioError catch (error, stackTrace) {
        handler.reject(err);
      }

      return;
    }
    handler.next(err);

    // super.onError(err, handler);
  }

  Future<String?> _fetchTokenResponse() async {
    TokenResponse? tokenResponse;
    final DataState<TokenResponse> dataState = await _tokenRepository.getAuthToken();
    if (dataState is DataSuccess) {
      tokenResponse = dataState.data;
    } else if (dataState is DataFailed) {
      throw DioError(requestOptions: RequestOptions(path: ''), error: dataState.error);
    }
    return tokenResponse?.accessToken;
  }
}
