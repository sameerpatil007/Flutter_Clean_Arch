import '../../core/usecases/usecase.dart';
import '../repositories/user_data_repository.dart';

class UserSessionStreamUseCase implements UseCase<Stream<String?>, void> {
  final UserDataRepository _userDataRepository;

  UserSessionStreamUseCase(this._userDataRepository);

  @override
  Future<Stream<String?>> call({void params}) async {
    return _userDataRepository.session;
  }
}