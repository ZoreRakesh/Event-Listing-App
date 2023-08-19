import 'package:app/Screens/Authentication/bloc/authentication_bloc.dart';
import 'package:app/Screens/EventInfo/bloc/event_detail_bloc.dart';
import 'package:app/Screens/EventInfo/ui/event_clicked_main_page.dart';
import 'package:app/Screens/Home/bloc/home_bloc.dart';
import 'package:app/Screens/Home/ui/loading_screen.dart';
import 'package:app/Screens/Profile/ui/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:app/utils/minuteparts.dart';
import 'package:app/widget/allsmallwidget.dart';
import 'package:app/widget/events.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home(
      {super.key,
      required this.username,
      required this.email,
      required this.authBloc});
  final String username;
  final String email;
  final AuthenticationBloc authBloc;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late HomeBloc homeBloc;

  @override
  void initState() {
    homeBloc = BlocProvider.of<HomeBloc>(context);
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToProfilePageState) {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ProfilePage(
                    username: widget.username,
                    authBloc: widget.authBloc,
                    email: widget.email,
                  )));
        } else if (state is HomeNavigateToProductInfoPageState) {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => BlocProvider(
                    create: (context) => EventDetailBloc()..add(EventsInitialStart()),
                    child: EventClicked(
                      eventdata: state.eventdata[state.index],
                    ),
                  )));
        }
      },
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              elevation: 0,
              flexibleSpace: Container(
                // color: Color(0xFFECF8F9),
                color: Color.fromRGBO(33, 149, 243, 0.748),
              ),
              title: MySearchBox(
                onchange: (value) {
                  homeBloc.add(HomeSearchedClickedEvent(value: value));
                },
                hintText: "Search",
                inputType: TextInputType.text,
                icon: Icon(
                  Icons.search_rounded,
                  color: Color.fromARGB(167, 255, 255, 255),
                  size: 22,
                ),
              ),
              actions: [
                GestureDetector(
                    onTap: () {
                      homeBloc.add(HomeProfileButtonClickedEvent());
                    },
                    child: CircleAvatar(
                      radius: 17,
                    )),
                SB(
                  wt: 15,
                )
              ],
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(right: 14, left: 14, top: 12),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (state is HomeNavigateToSearchPageState)
                        SB()
                      else if (state is! HomeNavigateToSearchPageState)
                        const Text(
                          "Upcoming Events",
                          style: mainbodyText,
                        ),
                      BlocBuilder<HomeBloc, HomeState>(
                        buildWhen: (previous, current) =>
                            current is! HomeActionState,
                        builder: (context, state) {
                          switch (state.runtimeType) {
                            case HomeLoadingEventPageState:
                              return LoadingScreen();
                            case HomeLoadedSuccessEventPageState:
                              final successstate =
                                  state as HomeLoadedSuccessEventPageState;
                              return Expanded(
                                  child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: ListView.builder(
                                          itemCount:
                                              successstate.eventdata.length,
                                          itemBuilder: (context, index) {
                                            return Events(
                                              onTap: () {
                                                homeBloc.add(
                                                    HomeProductClickedEvent(
                                                        index: index));
                                              },
                                              eventdata:
                                                  successstate.eventdata[index],
                                            );
                                          })));
                            case HomeErrorState:
                              final errorstate = state as HomeErrorState;
                              return Center(
                                child: Text(errorstate.error),
                              );
                            case HomeNavigateToSearchPageState:
                              final searchstate =
                                  state as HomeNavigateToSearchPageState;
                              return Expanded(
                                  child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: ListView.builder(
                                          itemCount:
                                              searchstate.searchlist.length,
                                          itemBuilder: (context, index) {
                                            return Events(
                                              onTap: () {
                                                homeBloc.add(
                                                    HomeProductClickedEvent(
                                                        index: index));
                                              },
                                              eventdata:
                                                  searchstate.searchlist[index],
                                            );
                                          })));
                            default:
                              return SizedBox(
                                
                              );
                          }
                        },
                      ),
                    ]),
              ),
            ));
      },
    );
  }
}
