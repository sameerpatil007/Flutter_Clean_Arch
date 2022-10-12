import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:vehiclehub/src/domain/entities/api_status.dart';

import '../../core/resources/data_state.dart';
import '../../domain/entities/login_response.dart';
import '../../domain/usecases/authenticate_user_usecase.dart';
import '../../domain/usecases/validate_user_usecase.dart';
import '../formz/email.dart';
import '../formz/otp.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._validateUserUseCase, this._authenticateUserUseCase) : super(const LoginState());

  final ValidateUserUseCase _validateUserUseCase;
  final AuthenticateUserUseCase _authenticateUserUseCase;

  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(
      state.copyWith(
        email: email,
        status: Formz.validate([email, state.otp]),
      ),
    );
  }

  void otpChanged(String value) {
    final password = Otp.dirty(value);
    emit(
      state.copyWith(
        otp: password,
        status: Formz.validate([state.email, password]),
      ),
    );
  }

  Future<void> validateUser() async {
    if (!state.status.isValidated) return;
    emit(state.copyWith(status: FormzStatus.submissionInProgress));

    DataState<ApiStatus> validateUserResponse = await _validateUserUseCase(params: state.email.value);
    if (validateUserResponse.data != null) {
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } else {
      emit(
        state.copyWith(errorMessage: validateUserResponse.error!.message, status: FormzStatus.submissionFailure),
      );
    }
  }

  Future<void> authenticateUser() async {
    if (!state.status.isValidated) return;
    emit(state.copyWith(status: FormzStatus.submissionInProgress));

    DataState<LoginResponse> authenticationResponse = await _authenticateUserUseCase(params: state.email.value);
    if (authenticationResponse.data != null) {
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } else {
      emit(
        state.copyWith(errorMessage: authenticationResponse.error!.message, status: FormzStatus.submissionFailure),
      );
    }
  }

  // Future<void> logInWithGoogle() async {
  //   emit(state.copyWith(status: FormzStatus.submissionInProgress));
  //   try {
  //     await _authenticationRepository.logInWithGoogle();
  //     emit(state.copyWith(status: FormzStatus.submissionSuccess));
  //   // } on LogInWithGoogleFailure catch (e) {
  //   //   emit(
  //   //     state.copyWith(
  //   //       errorMessage: e.message,
  //   //       status: FormzStatus.submissionFailure,
  //   //     ),
  //   //   );
  //   } catch (_) {
  //     emit(state.copyWith(status: FormzStatus.submissionFailure));
  //   }
  // }
}
