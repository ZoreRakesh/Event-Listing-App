import 'package:app/Screens/Authentication/bloc/authentication_bloc.dart';
import 'package:app/Screens/Authentication/ui/start_screen.dart';
import 'package:flutter/material.dart';

import "package:flutter_bloc/flutter_bloc.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter',
      theme: ThemeData(
        fontFamily: "Opensans",
        scaffoldBackgroundColor: const Color(0xFFECF8F9),
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 241, 241, 241)),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => AuthenticationBloc()..add(AppStartInitialEvent()),
        child: Start(),
      )
      
    );
  }
}
