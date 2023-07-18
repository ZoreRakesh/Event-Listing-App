import 'package:app/Screens/Authentication/bloc/authentication_bloc.dart';
import 'package:app/widget/allsmallwidget.dart';
import 'package:flutter/material.dart';


class WelcomePage extends StatelessWidget {
  final AuthenticationBloc authBloc;

  const WelcomePage({super.key, required this.authBloc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Flexible(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: const Image(
                          image: NetworkImage("https://png.pngtree.com/png-clipart/20201208/original/pngtree-creative-event-and-designer-company-logo-design-template-png-image_5510678.jpg")),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    const Text(
                      "EventO",
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 50,
                        fontWeight: FontWeight.w900,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: const Text(
                        "#EventsJustForYou",
                        style: TextStyle(
                          color: Color.fromARGB(255, 51, 51, 51),
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: MyTextButton(
                      
                        bgColor: Colors.blue,
                        buttonName: const Text(
                          'Sign Up',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                        onTap: () {
                         authBloc.add(SignupClickButtonEvent());
                          
                        },
                      ),
                    ),
                    const SizedBox(width: 2,),
                    Expanded(
                      child: MyTextButton(
                        bgColor: const Color.fromARGB(255, 228, 228, 228),
                        buttonName: const Text(
                          'Sign In',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                        onTap: () {
                          authBloc.add(LoginClickButtonEvent());

                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
