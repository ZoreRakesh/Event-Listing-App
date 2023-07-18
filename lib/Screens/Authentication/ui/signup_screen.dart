import 'package:app/Screens/Authentication/bloc/authentication_bloc.dart';
import 'package:app/widget/allsmallwidget.dart';
import 'package:app/widget/my_password_field.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key, required this.authBloc}) : super(key: key);
  final AuthenticationBloc authBloc;

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
    bool isPasswordVisible = false;


  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
  }

  // void signUpUser() async {
  //   // set loading to true
  //   setState(() {
  //     _isLoading = true;
  //   });

  //   // signup user using our authmethodds
  //   String res = await AuthMethods().signUpUser(
  //     email: _emailController.text,
  //     password: _passwordController.text,
  //     username: _usernameController.text,
  //   );
  //   // if string returned is sucess, user has been created
  //   if (res == "success") {
  //     setState(() {
  //       _isLoading = false;
  //     });
  //     // navigate to the home screen
  //     Navigator.of(context).pushReplacement(
  //       MaterialPageRoute(
  //         builder: (context) => const ResponsiveLayout(
  //           mobileScreenLayout: MobileScreenLayout(),
  //           webScreenLayout: WebScreenLayout(),
  //         ),
  //       ),
  //     );
  //   } else {
  //     setState(() {
  //       _isLoading = false;
  //     });
  //     // show the error
  //     showSnackBar(res, context);
  //   }
  // }

  // // selectImage() async {
  // //   Uint8List im = await pickImage(ImageSource.gallery);
  // //   // set state because we need to display the image we selected on the circle avatar
  // //   setState(() {
  // //     _image = im;
  // //   });
  // // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
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
              Text(
                "SignUp",
                style: TextStyle(
                    fontSize: 23,
                    color: Colors.blue,
                    fontWeight: FontWeight.w900),
              ),
              const SizedBox(height: 44),
              MyTextField(
                hintText: 'Enter your username',
                inputType: TextInputType.text,
                controller: _usernameController,
              ),
              const SizedBox(
                height: 10,
              ),
              MyTextField(
                hintText: 'Enter your email',
                inputType: TextInputType.emailAddress,
               controller: _emailController,
              ),
              const SizedBox(
                height: 10,
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
                height: 24,
              ),
              
              InkWell(
                child: Container(
                  child: !_isLoading
                      ? const Text(
                          'Sign up',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w800),
                        )
                      : const CircularProgressIndicator(
                          color: Color.fromARGB(213, 33, 149, 243),
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
                onTap: (){
                  widget.authBloc.add(SignUpEvent(username: _usernameController.text, email: _emailController.text, password: _passwordController.text));
                },
              ),
              const SizedBox(
                height: 18,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: const Text(
                      'Already have an account?',
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                  ),
                  GestureDetector(
                    onTap: (){
                      widget.authBloc.add(LoginClickButtonEvent());
                    } ,
                     
                    child: Container(
                      child: const Text(
                        ' Login.',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 8),
                    ),
                  ),
                ],
              ),
              Flexible(
                child: Container(),
                flex: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }

  showSnackBar(String content, BuildContext context) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(content)));
  }
}
