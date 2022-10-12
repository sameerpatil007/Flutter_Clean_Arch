import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../core/utils/constants.dart';
import '../../models/token_response_model.dart';

part 'token_api_service.g.dart';

@RestApi(baseUrl: kAuthUrl)
abstract class TokenApiService {
  factory TokenApiService(Dio dio, {String baseUrl}) = _TokenApiService;

  @POST('token')
  Future<HttpResponse<TokenResponseModel>> getApiAccessToken({
    @Query('grant_type') required String grantType,
    @Query('client_id') required String clientId,
    @Query('client_secret') required String clientSecret,
    @Query('username') required String username,
    @Query('password') required String password,
  });
}
