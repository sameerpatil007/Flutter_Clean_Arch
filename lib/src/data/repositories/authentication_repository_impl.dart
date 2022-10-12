import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../core/resources/data_state.dart';
import '../../domain/entities/login_response.dart';
import '../../domain/entities/api_status.dart';
import '../../domain/repositories/authentication_repository.dart';
import '../../domain/repositories/user_data_repository.dart';
import '../data_sources/remote/app_api_service.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AppApiService _vehicleHubApiService;
  final UserDataRepository _userDataRepository;

  AuthenticationRepositoryImpl(this._vehicleHubApiService, this._userDataRepository);

  @override
  Future<DataState<ApiStatus>> validateUser(String username) async {
    try {
      final HttpResponse httpResponse = await _vehicleHubApiService.validateUser(username: username);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
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

  @override
  Future<DataState<LoginResponse>> authenticateUser(String username) async {
    try {
      final HttpResponse httpResponse = await _vehicleHubApiService.authenticateUser(username: username);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        _userDataRepository.userLogin(httpResponse.data);
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

  @override
  void logoutUser() {}
}
