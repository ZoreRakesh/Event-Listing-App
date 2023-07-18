part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent{}

class HomeProfileButtonClickedEvent extends HomeEvent{}

class HomeProductClickedEvent extends HomeEvent{
  final int index;

  HomeProductClickedEvent({required this.index});
}

class HomeSearchedClickedEvent extends HomeEvent{
  final String value;

  HomeSearchedClickedEvent({required this.value});
}





