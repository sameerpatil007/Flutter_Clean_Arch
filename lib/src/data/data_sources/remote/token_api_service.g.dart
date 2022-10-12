// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _TokenApiService implements TokenApiService {
  _TokenApiService(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://test.salesforce.com/services/oauth2/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<HttpResponse<TokenResponseModel>> getApiAccessToken(
      {required grantType,
      required clientId,
      required clientSecret,
      required username,
      required password}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'grant_type': grantType,
      r'client_id': clientId,
      r'client_secret': clientSecret,
      r'username': username,
      r'password': password
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<TokenResponseModel>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'token',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TokenResponseModel.fromJson(_result.data!);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
