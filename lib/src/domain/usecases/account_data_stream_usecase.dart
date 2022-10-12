import '../../core/usecases/usecase.dart';
import '../entities/account.dart';
import '../repositories/user_data_repository.dart';

class AccountDataStreamUseCase implements UseCase<Stream<Account?>, void> {
  final UserDataRepository _userDataRepository;

  AccountDataStreamUseCase(this._userDataRepository);

  @override
  Future<Stream<Account?>> call({void params}) async {
    return _userDataRepository.account;
  }
}
