part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();
  
  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthLoaded extends AuthState {
  final TokenEntity token;

  const AuthLoaded(this.token);

  @override
  List<Object> get props => [token];
}

final class AuthRegistered extends AuthState {}

final class AuthError extends AuthState {
  final String error;

  const AuthError(this.error);

  @override
  List<Object> get props => [error];
}