part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationState {}

class AuthenticationActionState extends AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationLoadingState extends AuthenticationState {}




class AuthenticatedState extends AuthenticationState{
  final String email;
  final String username;

 AuthenticatedState({required this.email, required this.username});
}

class UnAuthenticatedState extends AuthenticationState{}

class AuthenticationErrorShowSnackbarState extends AuthenticationActionState {
    final String error;

  AuthenticationErrorShowSnackbarState(this.error);
}

class AuthNavigateToLoginPage extends AuthenticationState{}

class AuthNavigateToSignupPage extends AuthenticationState{}
