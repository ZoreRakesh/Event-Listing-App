import 'dart:async';

import 'package:app/Data/user_data.dart';
import 'package:app/Screens/Authentication/persistant%20storage/persistant_storage.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitial()) {
    on<AppStartInitialEvent>(appStartInitialEvent);
    on<SignUpEvent>(signUpEvent);
    on<LoginEvent>(loginEvent);
    on<LogoutEvent>(logoutEvent);
    on<LoginClickButtonEvent>(loginClickButtonEvent);
    on<SignupClickButtonEvent>(signupClickButtonEvent);
  }

  FutureOr<void> appStartInitialEvent(
      AppStartInitialEvent event, Emitter<AuthenticationState> emit) async {
    final username = await PersistentStorage.getUsername();
    final password = await PersistentStorage.getPassword();
    final email = await PersistentStorage.getEmail();

    if (username.isNotEmpty && password.isNotEmpty && email.isNotEmpty) {
      try {
        emit(AuthenticationLoadingState());
        await Future.delayed(Duration(seconds: 1));

        // Update authentication state
        emit(AuthenticatedState(email: email, username: username));
      } catch (e) {
        
        emit(UnAuthenticatedState());
      }
    } else {
      emit(UnAuthenticatedState());
    }
  }

  FutureOr<void> signUpEvent(
      SignUpEvent event, Emitter<AuthenticationState> emit) async {
    final username = event.username;
    final email = event.email;
    final password = event.password;

    bool isPresent = userlist.any((item) =>
        item['username'] == username &&
        item['email'] == email &&
        item['password'] == password);

    if (!isPresent) {
  
      try {
        userlist.add({
    'username':username,
    'email':email,
    'password':password
  },);

        await PersistentStorage.setEmail(email);
        await PersistentStorage.setUsername(username);
        await PersistentStorage.setPassword(password);

        emit(AuthenticationLoadingState());
        await Future.delayed(const Duration(seconds: 2));

        emit(AuthenticatedState(email: email, username: username));
      } catch (e) {
        emit(AuthenticationErrorShowSnackbarState("$e"));
      }
    } else {
      emit(AuthenticationErrorShowSnackbarState("Already SignUp!"));
    }
  }

  FutureOr<void> loginEvent(
      LoginEvent event, Emitter<AuthenticationState> emit) async {
    final email = event.email;
    final password = event.password;
    late String username;

    bool isPresent = userlist
        .any((item) => item['email'] == email && item['password'] == password);

    if (isPresent) {
      try {
        for (var item in userlist) {
          if (item['email'] == event.email) {
            username = item['username'];
          }
        }

        await PersistentStorage.setEmail(email);
        await PersistentStorage.setUsername(username);
        await PersistentStorage.setPassword(password);

        emit(AuthenticationLoadingState());
        await Future.delayed(const Duration(seconds: 2));

        emit(AuthenticatedState(email: email, username: username));}
        catch(e){
          emit(AuthenticationErrorShowSnackbarState("$e"));
        }

    } else {
      emit(AuthenticationErrorShowSnackbarState(
          "User Not Register! SignUp First"));
    }
  }

  FutureOr<void> logoutEvent(
      LogoutEvent event, Emitter<AuthenticationState> emit) async {
    await PersistentStorage.clearCredentials();
    emit(UnAuthenticatedState());
  }

  FutureOr<void> loginClickButtonEvent(
      LoginClickButtonEvent event, Emitter<AuthenticationState> emit) {
    emit(AuthNavigateToLoginPage());
  }

  FutureOr<void> signupClickButtonEvent(
      SignupClickButtonEvent event, Emitter<AuthenticationState> emit) {
    emit(AuthNavigateToSignupPage());
  }
}
