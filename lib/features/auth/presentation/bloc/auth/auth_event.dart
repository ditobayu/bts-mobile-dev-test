part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

final class LoginEvent extends AuthEvent {
  final String email;
  final String password;

  const LoginEvent(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}
final class RegisterEvent extends AuthEvent {
  final String username;
  final String email;
  final String password;

  const RegisterEvent(this.username, this.email, this.password);

  @override
  List<Object> get props => [username, email, password];
}
final class CheckCurrentUserEvent extends AuthEvent {
  const CheckCurrentUserEvent();
}