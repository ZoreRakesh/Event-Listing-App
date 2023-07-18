import 'package:app/Screens/Authentication/bloc/authentication_bloc.dart';
import 'package:app/utils/minuteparts.dart';
import 'package:app/widget/allsmallwidget.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage(
      {super.key,
      required this.username,
      required this.email,
      required this.authBloc});
  final String username;
  final String email;
  final AuthenticationBloc authBloc;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      
                        left: -6,
                        child: GestureDetector(
                           onTap: () {
                              Navigator.of(context).pop();
                            },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: Icon(
                              Icons.arrow_back,
                              size: 18,
                            ),
                          ),
                        )),
                    const Text(
                      "Profile",
                      style: upperbodyText,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 20, bottom: 5),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SB(
                          ht: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            widget.authBloc.add(LogoutEvent());
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                              ),
                              padding: EdgeInsets.all(0.5),
                              child: CircleAvatar(
                                radius: 50,
                              )),
                        ),
                        SB(
                          ht: 10,
                        ),
                        Text(
                          widget.username,
                          style: mainbodyText,
                        ),
                        Text(
                          "@ " + widget.email,
                          style: midBodyText,
                        ),
                        SB(
                          ht: 30,
                        ),
                        Container(
                          width: double.infinity,
                          margin: EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Color.fromARGB(24, 0, 0, 0),
                          ),
                          height: 2,
                        ),
                        MyMenuItem(
                            firstIcon: Icons.edit,
                            menuName: "EditProfile",
                            lastIcon: true),
                        MyMenuItem(
                            firstIcon: Icons.book,
                            menuName: "Tickets",
                            lastIcon: true),
                        MyMenuItem(
                            firstIcon: Icons.settings_outlined,
                            menuName: "Settings",
                            lastIcon: true),
                        Container(
                          width: double.infinity,
                          margin: EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Color.fromARGB(24, 0, 0, 0),
                          ),
                          height: 2,
                        ),
                        GestureDetector(
                            onTap: () {
                            Navigator.of(context).pop();
                            widget.authBloc.add(LogoutEvent());
                          },
                          child: MyMenuItem(
                            firstIcon: Icons.logout,
                            menuName: "Log Out",
                            lastIcon: false,
                          
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ]),
      )),
    );
  }
}
