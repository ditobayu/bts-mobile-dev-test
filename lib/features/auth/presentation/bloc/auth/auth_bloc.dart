import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_project/core/resources/data_state.dart';
import 'package:test_project/features/auth/domain/entities/token.dart';
import 'package:test_project/features/auth/domain/usecases/check_current_user.dart';
import 'package:test_project/features/auth/domain/usecases/login.dart';
import 'package:test_project/features/auth/domain/usecases/register.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUsecase loginUsecase;
  final RegisterUsecase registerUsecase;
  final CheckCurrentUserUsecase checkCurrentUserUsecase;
  
  AuthBloc(
    this.loginUsecase,
    this.registerUsecase,
    this.checkCurrentUserUsecase,
  ) : super(AuthInitial()) {
    on<LoginEvent>(_onLoginEvent);
    on<RegisterEvent>(_onRegisterEvent);
    on<CheckCurrentUserEvent>(_onCheckCurrentUserEvent);
  }

  Future<void> _onLoginEvent(
    LoginEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final result = await loginUsecase(
      params: LoginParams(
        username: event.email,
        password: event.password,
      ),
    );

    if (result is DataSuccess<TokenEntity>) {
      emit(AuthLoaded(result.data!));
    } else if (result is DataError) {
      emit(AuthError(result.error!));
    } 
  }

  Future<void> _onRegisterEvent(
    RegisterEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final result = await registerUsecase(
      params: RegisterParams(
        username: event.username,
        password: event.password,
        email: event.email,
      ),
    );

    if (result is DataSuccess<void>) {
      emit(AuthRegistered());
    } else if (result is DataError) {
      emit(AuthError(result.error!));
    } 
  }

  Future<void> _onCheckCurrentUserEvent(
    CheckCurrentUserEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final result = await checkCurrentUserUsecase();

    if (result is DataSuccess<TokenEntity>) {
      emit(AuthLoaded(result.data!));
    } else if (result is DataError) {
      emit(AuthError(result.error!));
    } 
  }
}
