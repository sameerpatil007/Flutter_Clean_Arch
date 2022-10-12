import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../core/utils/constants.dart';
import '../../../domain/entities/user_specific_data.dart';
import '../../models/api_app_static_response_model.dart';
import '../../models/api_user_data_response_model.dart';
import '../../models/login_response_model.dart';
import '../../models/api_status_model.dart';

part 'app_api_service.g.dart';

@RestApi(baseUrl: kBaseUrl)
abstract class AppApiService {
  factory AppApiService(Dio dio, {String baseUrl}) = _AppApiService;

  @GET('otp')
  Future<HttpResponse<ApiStatusModel>> validateUser({
    @Query('username') required String username
  });

  @GET('user_login')
  Future<HttpResponse<LoginResponseModel>> authenticateUser({
    @Query('username') required String username,
  });

  @GET('user_data')
  Future<HttpResponse<ApiUserDataResponseModel>> getUserData({
    @Query('session') required String session,
    @Query('lastSync') required String lastSync,
  });

  @POST('user_data')
  Future<HttpResponse<ApiUserDataResponseModel>> postUserData({
    @Body() required UserSpecificData userSpecificData,
    @Query('session') required String session,
    @Query('lastSync') required String lastSync,
  });

  @GET('static_data')
  Future<HttpResponse<ApiAppStaticDataResponseModel>> getStaticData({
    @Query('lastSync') required String lastSync,
  });
}
