import '../../core/resources/data_state.dart';
import '../../core/usecases/usecase.dart';
import '../entities/login_response.dart';
import '../repositories/authentication_repository.dart';

class AuthenticateUserUseCase implements UseCase<DataState<LoginResponse>, String> {
  final AuthenticationRepository _authRepository;

  AuthenticateUserUseCase(this._authRepository);

  @override
  Future<DataState<LoginResponse>> call({required String params}) {
    return _authRepository.authenticateUser(params);
  }
}
