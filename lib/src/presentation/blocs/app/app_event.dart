part of 'app_bloc.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object?> get props => [];
}

class AppLogoutRequested extends AppEvent {}

class AppAccountChanged extends AppEvent {
  const AppAccountChanged(this.session);

  final String? session;

  @override
  List<Object?> get props => [session];
}
