import '../../core/usecases/usecase.dart';
import '../entities/account.dart';
import '../repositories/user_data_repository.dart';

class SaveAccountUseCase implements UseCase<void, Account> {
  final UserDataRepository _userDataRepository;

  SaveAccountUseCase(this._userDataRepository);

  @override
  Future<void> call({required Account params}) {
    _userDataRepository.saveAccount(params);
    return Future(() => null);
  }
}
