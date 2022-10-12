part of 'app_bloc.dart';

class AppState extends Equatable {
  const AppState._({
    required this.status,
    this.session,
  });

  const AppState.authenticated(String session) : this._(status: AppStatus.authenticated, session: session);

  const AppState.unauthenticated() : this._(status: AppStatus.unauthenticated);

  final AppStatus status;
  final String? session;

  @override
  List<Object?> get props => [status, session];
}
