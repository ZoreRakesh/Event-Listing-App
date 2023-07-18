part of 'event_detail_bloc.dart';

@immutable
abstract class EventDetailState {}

class EventDetailActionState extends EventDetailState {}

class EventDetailInitial extends EventDetailState {}

class EventLoadedSuccessState extends EventDetailState {}

class NavigateToRegisterPageState extends EventDetailState{}

class EventRegisterSuccessState extends EventDetailActionState{
    final List info;

  EventRegisterSuccessState({required this.info});
}

class EventAlreadyRegisterState extends EventDetailActionState{}
