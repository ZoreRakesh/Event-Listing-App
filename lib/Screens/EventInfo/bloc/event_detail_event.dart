part of 'event_detail_bloc.dart';

@immutable
abstract class EventDetailEvent {}

class EventsInitialStart extends EventDetailEvent{}

class RegisterButtonClickEvent extends EventDetailEvent{
  final EventDataModel eventData;

  RegisterButtonClickEvent({required this.eventData});
}

class FormSubmitClickedEvent extends EventDetailEvent{
  final List<Map<String,dynamic>> info;

  FormSubmitClickedEvent({required this.info});
}