import 'package:app/Screens/EventInfo/bloc/event_detail_bloc.dart';
import 'package:app/Screens/EventInfo/ui/details_page.dart';
import 'package:app/Screens/Home/models/event_data_model.dart';
import 'package:app/Screens/EventInfo/ui/Register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventClicked extends StatelessWidget {
  const EventClicked({super.key, required this.eventdata});
  final EventDataModel eventdata;

  @override
  Widget build(BuildContext context) {
        final EventDetailBloc eventBloc = BlocProvider.of<EventDetailBloc>(context);
    return BlocConsumer<EventDetailBloc, EventDetailState>(
      
      listenWhen: (previous, current) => current is EventDetailActionState,
      buildWhen: (previous, current) => current is! EventDetailActionState,
      listener: (context, state) {
        if(state is EventRegisterSuccessState){
           showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: const Text("Successfully Register"),
                  content: Text(state.info[0]['Email']),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      eventBloc.add(EventsInitialStart());
                      },
                      child: 
                        const Text("okay"),
                     
                    ),
                  ],
                ),
              );
        }
         if(state is EventAlreadyRegisterState){
           showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: const Text("Already Register"),
                  content: const Text("Check Your Tickets"),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                      child: 
                        const Text("okay",style: TextStyle(color: Colors.blue),),
                     
                    ),
                  ],
                ),
              );
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case EventLoadedSuccessState:
            return Detailspage(eventdata: eventdata, eventBloc: eventBloc,);

          case NavigateToRegisterPageState:
            return RegisterPage(eventData: eventdata, eventBloc: eventBloc,);
          default:
        }
        return Container();
      },
    );
  }
}
