part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeActionState extends HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadingEventPageState extends HomeState{}

class HomeLoadedSuccessEventPageState extends HomeState {
  final List<EventDataModel> eventdata;

  HomeLoadedSuccessEventPageState({ required this.eventdata});

}

class HomeErrorState extends HomeState {
  final String error;

  HomeErrorState(this.error);
}

class HomeNavigateToProfilePageState extends HomeActionState {}

class HomeNavigateToSearchPageState extends HomeState {
  final List<EventDataModel> searchlist;

  HomeNavigateToSearchPageState({required this.searchlist});
}

class HomeNavigateToProductInfoPageState extends HomeActionState {
  final List<EventDataModel> eventdata;
  final int index;

  HomeNavigateToProductInfoPageState( {required this.index,required this.eventdata});
}


