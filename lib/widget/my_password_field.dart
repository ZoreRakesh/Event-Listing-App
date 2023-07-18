import 'package:app/utils/minuteparts.dart';
import 'package:flutter/material.dart';


class MyPasswordField extends StatelessWidget {
  const MyPasswordField(
      {Key? key,
      required this.isPasswordVisible,
      required this.ontap,
      this.controller,
      this.error, required this.hintText})
      : super(key: key);

  final bool isPasswordVisible;
  final String hintText;
  final  ontap;
  final TextEditingController? controller;
  final String? error;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        style: kBodyText.copyWith(color: Colors.black87
        ),
        controller: controller,
        obscureText: !isPasswordVisible,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
           labelStyle: helperText,
          labelText: hintText,
            filled: true, //<-- SEE HERE
    fillColor: Color.fromARGB(144, 255, 255, 255),
          suffixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: IconButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: ontap,
              icon: Icon(
                isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                color: Colors.grey,
              ),
            ),
          ),
          contentPadding: EdgeInsets.all(20),
          hintText: 'Password',
          hintStyle: midBodyText.copyWith(color: Colors.white),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromARGB(57, 158, 158, 158),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(18),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blue,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(18),
          ),
          errorText: error,
        ),
      ),
    );
  }
}
