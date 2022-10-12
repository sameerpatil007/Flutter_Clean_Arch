import '../../core/params/validate_user_request.dart';
import '../../core/resources/data_state.dart';
import '../../core/usecases/usecase.dart';
import '../entities/api_status.dart';
import '../repositories/authentication_repository.dart';

class ValidateUserUseCase implements UseCase<DataState<ApiStatus>, String> {
  final AuthenticationRepository _authRepository;

  ValidateUserUseCase(this._authRepository);

  @override
  Future<DataState<ApiStatus>> call({required String params}) {
    return _authRepository.validateUser(params);
  }
}
