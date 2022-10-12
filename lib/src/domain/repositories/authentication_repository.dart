import '../../core/params/validate_user_request.dart';
import '../../core/resources/data_state.dart';
import '../entities/login_response.dart';
import '../entities/api_status.dart';

abstract class AuthenticationRepository {
  Future<DataState<ApiStatus>> validateUser(String params);
  Future<DataState<LoginResponse>> authenticateUser(String params);
  void logoutUser();
}
