import 'package:app/Screens/EventInfo/bloc/event_detail_bloc.dart';
import 'package:app/Screens/Home/models/event_data_model.dart';
import 'package:app/utils/minuteparts.dart';
import 'package:app/widget/allsmallwidget.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage(
      {super.key, required this.eventData, required this.eventBloc});
  final EventDataModel eventData;
  final EventDetailBloc eventBloc;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _fncontroller = TextEditingController();
  final TextEditingController _lncontroller = TextEditingController();
  final TextEditingController _emailcontroller = TextEditingController();
  bool error = false;


  TextInputType _convertToTextInputType(String inputType) {
    switch (inputType) {
      case 'text':
        return TextInputType.text;
      case 'number':
        return TextInputType.number;
      case 'email':
        return TextInputType.emailAddress;
      default:
        return TextInputType.text;
    }
  }

  List<Map<String, String>> infoUser =[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(
                  bottom: 10,
                ),
                width: double.infinity,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                        left: 0,
                        child: GestureDetector(
                            onTap: () {
                              widget.eventBloc.add(EventsInitialStart());
                            },
                            child: Container(
                                width: 40,
                                alignment: Alignment.topLeft,
                                child: Icon(
                                  Icons.arrow_back,
                                  size: 18,
                                )))),
                    const Text(
                      "Registration",
                      style: upperbodyText,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: CustomScrollView(slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: MyTextField(
                                hintText: 'First Name',
                                inputType: TextInputType.text,
                                controller: _fncontroller,
                              ),
                            ),
                            SB(
                              wt: 10,
                            ),
                            Expanded(
                              child: MyTextField(
                                hintText: 'Last Name',
                                inputType: TextInputType.text,
                                controller: _lncontroller,
                              ),
                            ),
                          ],
                        ),
                        MyTextField(
                          hintText: 'Email',
                          inputType: TextInputType.emailAddress,
                          controller: _emailcontroller,
                        ),
                        // Expanded(
                        //   child: SingleChildScrollView(
                        //     child: Column(
                        //       children: List.generate(
                        //         widget.eventData.controllerList.length,
                        //         (index) => MyTextField(
                        //           hintText: widget.eventData
                        //               .controllerList[index]['hintText'],
                        //           inputType: _convertToTextInputType(widget
                        //               .eventData.controllerList[index]['type']),
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        
                        error?Text("Error Plss Filll ALL the Content"):SB(),
                        SB(
                          ht: 20,
                        ),
                        MyTextButton(
                            buttonName: Text("Submit",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 16,
                                )),
                            onTap: () {
                              if(_fncontroller.text.isNotEmpty && _lncontroller.text.isNotEmpty && _emailcontroller.text.isNotEmpty){
                                  error = false;
                                  infoUser.add({'FN':_fncontroller.text,'LN':_lncontroller.text,'Email':_emailcontroller.text,'eventName':widget.eventData.eventname});
                                  widget.eventBloc.add(FormSubmitClickedEvent(info: infoUser));
                                  print(infoUser);
                              }else{
                                setState(() {
                                  error = true;
                                });
                              }
                            },
                            bgColor: const Color.fromARGB(207, 33, 149, 243)),
                      ],
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
