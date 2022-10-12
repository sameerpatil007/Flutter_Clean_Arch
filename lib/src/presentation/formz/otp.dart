import 'package:formz/formz.dart';

enum OtpValidationError { empty }

class Otp extends FormzInput<String, OtpValidationError> {
  const Otp.pure() : super.pure('');
  const Otp.dirty([super.value = '']) : super.dirty();

  @override
  OtpValidationError? validator(String? value) {
    return value?.isNotEmpty == true ? null : OtpValidationError.empty;
  }
}