part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent {}

class AppStartInitialEvent extends AuthenticationEvent{}

class SignUpEvent extends AuthenticationEvent{
  final String email;
  final String username;
  final String password;

  SignUpEvent( {required this.username, required this.email, required this.password});
}


class LoginEvent extends AuthenticationEvent{
  final String email;
  final String password;

  LoginEvent( {required this.email, required this.password});
}

class LogoutEvent extends AuthenticationEvent{}

class LoginClickButtonEvent extends AuthenticationEvent{}

class SignupClickButtonEvent extends AuthenticationEvent{}


