import '../../core/usecases/usecase.dart';
import '../repositories/authentication_repository.dart';
import '../repositories/user_data_repository.dart';

class LogoutUseCase implements UseCase<void, void> {
  final AuthenticationRepository _authenticationRepository;
  final UserDataRepository _userDataRepository;

  LogoutUseCase(this._authenticationRepository, this._userDataRepository);

  @override
  Future<void> call({void params}) {
    _authenticationRepository.logoutUser();
    _userDataRepository.logoutUser();
    return Future(() => null);
  }
}
