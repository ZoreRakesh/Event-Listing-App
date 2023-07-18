// ignore_for_file: sort_child_properties_last

import 'package:app/Screens/Authentication/bloc/authentication_bloc.dart';
import 'package:app/widget/allsmallwidget.dart';
import 'package:app/widget/my_password_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key, required this.authBloc}) : super(key: key);
  final AuthenticationBloc authBloc;

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
    bool isPasswordVisible =false;


  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  // void loginUser() async {
  //   setState(() {
  //     _isLoading = true;
  //   });
  //   String res = await AuthMethods().loginUser(
  //       email: _emailController.text, password: _passwordController.text);
  //   if (res == 'success') {
  //     Navigator.of(context).pushAndRemoveUntil(
  //         MaterialPageRoute(
  //           builder: (context) => const ResponsiveLayout(
  //             mobileScreenLayout: MobileScreenLayout(),
  //             webScreenLayout: WebScreenLayout(),
  //           ),
  //         ),
  //         (route) => false);

  //     setState(() {
  //       _isLoading = false;
  //     });
  //   } else {
  //     setState(() {
  //       _isLoading = false;
  //     });
  //     showSnackBar(res, context);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: CustomScrollView(
          reverse: true,  
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
               child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: Container(),
                  flex: 1,
                ),
                const SizedBox(height: 64),
                const Text(
                  "Login",
                  style: TextStyle(
                      fontSize: 28,
                      color: Colors.blue,
                      fontWeight: FontWeight.w900),
                ),
                const SizedBox(height: 44),
                MyTextField(
                  hintText: 'Enter your email',
                  inputType: TextInputType.emailAddress,
                  controller: _emailController,
                ),
                const SizedBox(
                  height: 5,
                ),
              
                MyPasswordField(
                              isPasswordVisible: isPasswordVisible,
                              controller: _passwordController,
                              ontap: () {
                                setState(() {
                                  isPasswordVisible = !isPasswordVisible;
                                });
                              }, hintText: 'Enter your password',
                            ),
                const SizedBox(
                  height: 14,
                ),
                  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: const Text(
                        "Don't have an account?",
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 8),
                    ),
                    GestureDetector(
                      onTap: () {
                         widget.authBloc.add(SignupClickButtonEvent());
                      },
                      child: Container(
                        child: const Text(
                          ' Signup.',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 8),
                      ),
                    ),
                  ],
                ),
                SB(ht: 5,),
                InkWell(
                  child: Container(
                    child: !_isLoading
                        ? const Text(
                            'Log in', style: TextStyle(color: Colors.white,fontWeight: FontWeight.w800),
                         
        
                          )
                        : const SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(
                              color: Colors.blue,
                            ),
                          ),
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: const ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                      ),
                      color: Colors.blue,
                    ),
                  ),
                  onTap:(){
                    widget.authBloc.add(LoginEvent(email: _emailController.text, password: _passwordController.text));
                  } ,
                ),
                
        SB(ht: 10,),
              
                Flexible(
                  child: Container(),
                  flex: 2,
                ),
              ],
            ),
          ),
            )
          ],
         
        ),
      ),
    );
  }
}
