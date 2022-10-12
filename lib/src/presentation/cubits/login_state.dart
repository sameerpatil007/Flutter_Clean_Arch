part of 'login_cubit.dart';

class LoginState extends Equatable {
  const LoginState({
    this.email = const Email.pure(),
    this.otp = const Otp.pure(),
    this.status = FormzStatus.pure,
    this.errorMessage,
  });

  final Email email;
  final Otp otp;
  final FormzStatus status;
  final String? errorMessage;

  @override
  List<Object> get props => [email, otp, status];

  LoginState copyWith({
    Email? email,
    Otp? otp,
    FormzStatus? status,
    String? errorMessage,
  }) {
    return LoginState(
      email: email ?? this.email,
      otp: otp ?? this.otp,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
