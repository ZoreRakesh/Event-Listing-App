import 'package:app/utils/minuteparts.dart';
import 'package:flutter/material.dart';

class SB extends StatelessWidget {
  const SB({super.key, this.ht,this.wt});
  final double? ht;
  final double? wt;


  @override
  Widget build(BuildContext context) {
    return SizedBox(height: ht,width: wt,);
  }
}


class MyTextField extends StatelessWidget {
  const MyTextField({
    Key? key,
    required this.hintText,
    required this.inputType,
    this.controller,
    this.error,
    this.icon,
  }) : super(key: key);
  final String hintText;
  final TextInputType inputType;
  final TextEditingController? controller;
  final Widget? icon;
  final String? error;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        style: kBodyText.copyWith(color: Colors.black87
        ),
        controller: controller,
    
        keyboardType: inputType,
        decoration: InputDecoration(
           labelStyle: helperText,
          labelText: hintText,
            filled: true, //<-- SEE HERE
    fillColor: Color.fromARGB(144, 255, 255, 255),
          
          contentPadding: EdgeInsets.all(20),
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
    // return Container(

    //  margin: EdgeInsets.symmetric(vertical:8),
    //   height: 45,
    //   child: TextField(
        
    //     style:  kBodyText.copyWith(color: Colors.black87
    //     ),
    //     keyboardType: inputType,
    //     textInputAction: TextInputAction.next,
    //     controller: controller,
        
    //     decoration: InputDecoration(
    //       // helperText: hintText,
    //     labelStyle: helperText,
    //       labelText: hintText,
    //    filled: true, //<-- SEE HERE
    // fillColor: Color.fromARGB(144, 255, 255, 255),
    //       prefixIcon: icon,
    //       errorText: error,
    //       errorBorder: InputBorder.none,
    //       errorStyle: errorText,
    //       contentPadding: const EdgeInsets.symmetric(vertical:5,horizontal: 10),
    //      helperStyle: helperText,
          
    //       enabledBorder: OutlineInputBorder(
    //         borderSide: const BorderSide(
    //           color: Color.fromARGB(0, 0, 0, 0),
    //           width: 1,
    //         ),
    //         borderRadius: BorderRadius.circular(10),
    //       ),
    //       focusedBorder: OutlineInputBorder(
    //         borderSide: const BorderSide(
    //           color: Color.fromARGB(97, 33, 149, 243),
    //           width: 1,
    //         ),
    //         borderRadius: BorderRadius.circular(10),
    //       ),
    //     ),
    //   ),
    // );
  }
}



class MyTextButton extends StatelessWidget {
  const MyTextButton({
    Key? key,
    required this.buttonName,
    required this.onTap,
    required this.bgColor,
  }) : super(key: key);
  final Widget buttonName;
  final onTap;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 7),
      height: 40,
      width: double.infinity,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.all(Radius.circular(6))
      ),
      child: TextButton(
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.resolveWith(
            (states) => Colors.black12,
          ),
        ),
        onPressed: onTap,
        child: buttonName,
      ),
    );
  }
}

class MySearchBox extends StatelessWidget {


  const MySearchBox({
    Key? key,
    required this.hintText,
    required this.inputType,
    this.controller,
    this.error,
    this.icon,
    this.onchange
  }) : super(key: key);
  final String hintText;
  final TextInputType inputType;
  final TextEditingController? controller;
  final Widget? icon;
  final String? error;
  final onchange;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin  : const EdgeInsets.symmetric(vertical: 6),
      height: 35,

      child: TextField(
        onChanged: onchange,
        
        style: midBodyText.copyWith(color: Color.fromARGB(221, 255, 255, 255)),
        keyboardType: inputType,
        textInputAction: TextInputAction.next,
        controller: controller,
        
        
        decoration: InputDecoration(
        
       filled: true, //<-- SEE HERE
    fillColor: Color.fromARGB(75, 255, 255, 255),
          prefixIcon: icon,
          errorText: error,
          contentPadding: const EdgeInsets.symmetric(vertical:0,horizontal: 0),
          hintText: hintText,
          hintStyle: midBodyText.copyWith(color: Colors.white),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color.fromARGB(57, 158, 158, 158),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(18),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.blue,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(18),
          ),
        ),
      ),
    );
  }
}

class MyMenuItem extends StatelessWidget {
  const MyMenuItem({super.key, required this.firstIcon,required this.menuName,required this.lastIcon, this.ontap});
  final IconData firstIcon;
  final bool lastIcon;
  final ontap;

  final String menuName;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      margin: EdgeInsets.symmetric(vertical: 7),
                            padding: EdgeInsets.symmetric(vertical: 6),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(firstIcon,color: Color.fromARGB(141, 0, 0, 0),size: 20,),
                                SB(wt:15),
                                Text(menuName,style:menuText,),
                                Expanded(child: Container()),
                                lastIcon?Icon(Icons.arrow_forward_ios,color: Color.fromARGB(200, 0, 0, 0),size: 15,):Container(),
                              ],
                            ),
                 
                        );
  }
}