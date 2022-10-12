import 'package:equatable/equatable.dart';

import 'account.dart';
import 'api_status.dart';

class LoginResponse extends Equatable {
  final ApiStatus status;
  final Account? account;
  final String? sessionId;

  const LoginResponse({required this.status, this.account, this.sessionId});

  @override
  List<Object?> get props => [status, account, sessionId];

  @override
  bool? get stringify => true;
}
