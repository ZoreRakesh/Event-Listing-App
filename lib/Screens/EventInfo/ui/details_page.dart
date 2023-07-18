import 'package:app/Screens/EventInfo/bloc/event_detail_bloc.dart';
import 'package:app/utils/minuteparts.dart';
import 'package:app/widget/allsmallwidget.dart';
import 'package:flutter/material.dart';
import '../../Home/models/event_data_model.dart';

class Detailspage extends StatelessWidget {
  const Detailspage({
    super.key,
    required this.eventdata, required this.eventBloc,
  });

  final EventDetailBloc eventBloc;
  final EventDataModel eventdata;

  @override
  Widget build(BuildContext context) {

        return Scaffold(
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          body: SafeArea(
            child: Stack(
              children: [
                Column(
                  children: [
                    Expanded(
                        child: CustomScrollView(slivers: [
                      SliverFillRemaining(
                        hasScrollBody: false,
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(bottom: 20),
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 255, 255, 255),
                                // borderRadius: BorderRadius.circular(10),
                                // border: Border.all(color: const Color.fromARGB(33, 0, 0, 0),width: 0)
                              ),
                              child: Container(
                                child: Column(
                                  children: [
                                    Container(
                                      //  margin:const  EdgeInsets.symmetric(vertical: 10),
                                      height: 280,
                                      width: double.infinity,

                                      child: FittedBox(
                                        fit: BoxFit.fill,
                                        child: Image.network(
                                          eventdata.inimgurl,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 16),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                              margin: const EdgeInsets.only(
                                                  top: 20, bottom: 4),
                                              child: Text(
                                                eventdata.eventname,
                                                style: detailsText1,
                                              )),
                                          Container(
                                              margin: const EdgeInsets.only(
                                                  bottom: 10),
                                              child: Text(
                                                eventdata.miniinfo,
                                                style: detailsText2,
                                              )),
                                          Container(
                                            width: double.infinity,
                                            margin: EdgeInsets.symmetric(
                                                vertical: 10),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20)),
                                              color:
                                                  Color.fromARGB(24, 0, 0, 0),
                                            ),
                                            height: 2,
                                          ),
                                          Container(
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 6, vertical: 8),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.location_on,
                                                  size: 15,
                                                  color: Color.fromARGB(
                                                      255, 23, 78, 155),
                                                ),
                                                SB(
                                                  wt: 10,
                                                ),
                                                Text(
                                                  eventdata.venue,
                                                  style: detailsText2,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 6, vertical: 8),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.calendar_today,
                                                  size: 15,
                                                  color: Color.fromARGB(
                                                      255, 23, 78, 155),
                                                ),
                                                SB(
                                                  wt: 10,
                                                ),
                                                Text(
                                                  "${eventdata.date} ${eventdata.month}",
                                                  style: detailsText2,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 6, vertical: 8),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.phone,
                                                  size: 15,
                                                  color: Color.fromARGB(
                                                      255, 23, 78, 155),
                                                ),
                                                SB(
                                                  wt: 10,
                                                ),
                                                Text(
                                                  eventdata.contact,
                                                  style: detailsText2,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 6, vertical: 8),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.attach_money,
                                                  size: 15,
                                                  color: Color.fromARGB(
                                                      255, 23, 78, 155),
                                                ),
                                                SB(
                                                  wt: 10,
                                                ),
                                                Text(
                                                  eventdata.price,
                                                  style: detailsText2,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            width: double.infinity,
                                            margin: EdgeInsets.symmetric(
                                                vertical: 10),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20)),
                                              color:
                                                  Color.fromARGB(24, 0, 0, 0),
                                            ),
                                            height: 2,
                                          ),
                                          Container(
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 10),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "About",
                                                  style: detailsText3,
                                                ),
                                                SB(
                                                  ht: 8,
                                                ),
                                                Text(
                                                  eventdata.about,
                                                  style: detailsText2,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(),
                          ],
                        ),
                      ),
                    ])),
                  ],
                ),
                Positioned(
                  top: 10,
                  left: 15,
                  child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                          padding: EdgeInsets.only(
                              top: 10, bottom: 10, right: 10, left: 12),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(100)),
                            color: Color.fromARGB(129, 0, 0, 0),
                          ),
                          child: Icon(
                            Icons.arrow_back_ios,
                            size: 16,
                            color: Colors.white,
                          ))),
                ),
              ],
            ),
          ),
          bottomNavigationBar: MyTextButton(
            buttonName: const Text(
              "Register",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w900),
            ),
            bgColor: const Color.fromARGB(207, 33, 149, 243),
            onTap: () {
           eventBloc.add(RegisterButtonClickEvent(eventData: eventdata));
            },
          ),
        );
  }
}