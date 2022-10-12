import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../core/utils/enums.dart';
import '../../../domain/entities/account.dart';
import '../../../domain/usecases/account_data_stream_usecase.dart';
import '../../../domain/usecases/logout_usecase.dart';
import '../../../domain/usecases/user_session_stream_usecase.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  late StreamSubscription<String?> _sessionSubscription;
  final LogoutUseCase _logoutUseCase;
  final UserSessionStreamUseCase _userSessionStreamUseCase;

  AppBloc({
    required UserSessionStreamUseCase userSessionStreamUseCase,
    required LogoutUseCase logoutUseCase,
  })  : _logoutUseCase = logoutUseCase,
        _userSessionStreamUseCase = userSessionStreamUseCase,
        super(const AppState.unauthenticated()) {
    initStreamSubscription();
    on<AppAccountChanged>(_onAccountChanged);
    on<AppLogoutRequested>(_onLogoutRequested);
  }

  initStreamSubscription() async {
    _sessionSubscription = (await _userSessionStreamUseCase()).listen(
      (session) => add(AppAccountChanged(session)),
    );
  }

  void _onAccountChanged(AppAccountChanged event, Emitter<AppState> emit) {
    emit(
      event.session != null ? AppState.authenticated(event.session!) : const AppState.unauthenticated(),
    );
  }

  void _onLogoutRequested(AppLogoutRequested event, Emitter<AppState> emit) {
    _logoutUseCase();
  }

  @override
  Future<void> close() {
    _sessionSubscription.cancel();
    return super.close();
  }
}
