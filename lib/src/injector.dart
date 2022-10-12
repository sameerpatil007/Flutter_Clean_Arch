import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/data_sources/local/static_dao.dart';
import 'data/data_sources/local/static_dao_impl.dart';
import 'data/data_sources/local/user_dao.dart';
import 'data/data_sources/local/user_dao_impl.dart';
import 'data/interceptor/token_interceptor.dart';
import 'core/utils/constants.dart';
import 'data/data_sources/local/app_preferences.dart';
import 'data/data_sources/local/app_storage.dart';
import 'data/data_sources/remote/app_api_service.dart';
import 'data/data_sources/remote/token_api_service.dart';
import 'data/repositories/authentication_repository_impl.dart';
import 'data/repositories/static_data_repository_impl.dart';
import 'data/repositories/token_repository_impl.dart';
import 'data/repositories/user_data_repository_impl.dart';
import 'domain/repositories/authentication_repository.dart';
import 'domain/repositories/static_data_repository.dart';
import 'domain/repositories/token_repository.dart';
import 'domain/repositories/user_data_repository.dart';
import 'domain/usecases/account_data_stream_usecase.dart';
import 'domain/usecases/authenticate_user_usecase.dart';
import 'domain/usecases/logout_usecase.dart';
import 'domain/usecases/user_session_stream_usecase.dart';
import 'domain/usecases/validate_user_usecase.dart';
import 'presentation/blocs/app/app_bloc.dart';

final GetIt injector = GetIt.instance;

Future<void> initializeDependencies() async {
  // Shared Pref
  injector.registerSingleton<AppPreferences>(
      AppPreferences(const FlutterSecureStorage(aOptions: AndroidOptions(encryptedSharedPreferences: true)),await SharedPreferences.getInstance()));

  // Local Storage
  final Box userBox = await Hive.openBox(kBoxUser,
      path: (await getApplicationDocumentsDirectory()).path,
      encryptionCipher: HiveAesCipher(await getDbEncryptionKey()));
  injector.registerSingleton<AppStorage>(AppStorage(userBox));

  // Dao
  injector.registerSingleton<StaticDao>(StaticDaoImpl(injector()));
  injector.registerSingleton<UserDao>(UserDaoImpl(injector()));

  // Dio client
  injector.registerSingleton<Dio>(Dio());

  // Dependencies
  injector.registerSingleton<TokenApiService>(TokenApiService(Dio()));
  injector.registerSingleton<TokenRepository>(TokenRepositoryImpl(injector()));
  injector.registerSingleton<AppApiService>(AppApiService(injector<Dio>()
    ..interceptors.addAll([LogInterceptor(requestBody: true, responseBody: true), TokenInterceptor(injector())])));

  // Repositories
  // injector.registerSingleton<TokenRepository>(TokenRepositoryImpl(injector()));
  injector.registerSingleton<StaticDataRepository>(StaticDataRepositoryImpl(injector(), injector(), injector()));
  injector.registerSingleton<UserDataRepository>(UserDataRepositoryImpl(injector(), injector(), injector()));
  injector.registerSingleton<AuthenticationRepository>(AuthenticationRepositoryImpl(injector(), injector()));

  // UseCases
  // injector.registerSingleton<GetTokenUseCase>(GetTokenUseCase(injector()));
  injector.registerSingleton<ValidateUserUseCase>(ValidateUserUseCase(injector()));
  injector.registerSingleton<AuthenticateUserUseCase>(AuthenticateUserUseCase(injector()));
  injector.registerSingleton<LogoutUseCase>(LogoutUseCase(injector(), injector()));
  injector.registerSingleton<UserSessionStreamUseCase>(UserSessionStreamUseCase(injector()));
  injector.registerSingleton<AccountDataStreamUseCase>(AccountDataStreamUseCase(injector()));

  // Blocs
  injector.registerSingleton<AppBloc>(AppBloc(logoutUseCase: injector(), userSessionStreamUseCase: injector()));
}

Future<Uint8List> getDbEncryptionKey() async {
  final storageKey = await injector<AppPreferences>().readValue(key: kPrefEncryption);
  if (storageKey == null) {
    final key = Hive.generateSecureKey();
    await injector<AppPreferences>().writeValue(
      key: kPrefEncryption,
      value: base64UrlEncode(key),
    );
  }
  final key = await injector<AppPreferences>().readValue(key: kPrefEncryption);
  return base64Url.decode(key);
}
