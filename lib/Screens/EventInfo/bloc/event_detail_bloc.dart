import 'dart:async';

import 'package:app/Data/register_event.dart';
import 'package:app/Screens/Home/models/event_data_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'event_detail_event.dart';
part 'event_detail_state.dart';

class EventDetailBloc extends Bloc<EventDetailEvent, EventDetailState> {
  EventDetailBloc() : super(EventDetailInitial()) {
    on<EventsInitialStart>(eventsInitialStart);
    on<RegisterButtonClickEvent>(registerButtonClickEvent);
    on<FormSubmitClickedEvent>(formSubmitClickedEvent);
  }

  FutureOr<void> eventsInitialStart(EventsInitialStart event, Emitter<EventDetailState> emit) {
  emit(EventLoadedSuccessState());
  }

  FutureOr<void> registerButtonClickEvent(RegisterButtonClickEvent event, Emitter<EventDetailState> emit) {
    bool isPresent = registerEvents.any((item) => item == event.eventData.eventname);

    if (!isPresent) {
      emit(NavigateToRegisterPageState());
    }else
      emit(EventAlreadyRegisterState());
    }

  }

 

  FutureOr<void> formSubmitClickedEvent(FormSubmitClickedEvent event, Emitter<EventDetailState> emit) async{
    
    registerEvents.add(event.info[0]["eventName"]);
 

  emit(EventRegisterSuccessState(info: event.info));

  }

