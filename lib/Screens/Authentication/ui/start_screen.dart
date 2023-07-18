import 'package:app/Screens/Authentication/bloc/authentication_bloc.dart';
import 'package:app/Screens/Authentication/ui/signup_screen.dart';
import 'package:app/Screens/Authentication/ui/welcome_screen.dart';
import 'package:app/Screens/Home/bloc/home_bloc.dart';
import 'package:app/Screens/Home/ui/home_page.dart';
import 'package:app/widget/allsmallwidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_screen.dart';

class Start extends StatefulWidget {
  const Start({super.key});

  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
  late AuthenticationBloc authBloc;

  @override
  void initState() {
    authBloc = BlocProvider.of<AuthenticationBloc>(context);
    authBloc.add(AppStartInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
      listenWhen: (previous, current) => current is AuthenticationActionState,
      buildWhen: (previous, current) => current is! AuthenticationActionState,
      listener: (context, state) {
        
        if(state is AuthenticationErrorShowSnackbarState){
           ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(state.error)));
        }
      },
      builder: (context, state) {
        print(state);
        switch (state.runtimeType) {
          case AuthenticationLoadingState:
          return const Scaffold(body: Center(child: CircularProgressIndicator(),),);


          case UnAuthenticatedState:
            return WelcomePage(
              authBloc: authBloc,
            );

          case AuthNavigateToLoginPage:
          return LoginScreen(authBloc: authBloc);  

          case AuthNavigateToSignupPage:
          return SignupScreen(authBloc: authBloc);

          case AuthenticatedState:
          final authState = state as AuthenticatedState;
            return BlocProvider(
              create: (context) => HomeBloc(),
              child: Home(authBloc: authBloc, email: authState.email, username: authState.username,),
            );
          default:
            return SB();
        }
      },
    );
  }

  @override
  void dispose() {
    authBloc.close();
    super.dispose();
  }
}
