import 'dart:async';


import 'package:app/Data/search_list.dart';
import 'package:app/Screens/Home/models/List_for_passing_data.dart';
import 'package:app/Screens/Home/models/event_data_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
   on<HomeInitialEvent>(homeInitialEvent);
   on<HomeProductClickedEvent>(homeProductClickedEvent);
   on<HomeProfileButtonClickedEvent>(homeProfileButtontClickedEvent);
   on<HomeSearchedClickedEvent>(homeSearchedClickedEvent);


  }

  FutureOr<void> homeInitialEvent(HomeInitialEvent event, Emitter<HomeState> emit) async{
    emit(HomeLoadingEventPageState());
    await Future.delayed(Duration(seconds: 2));

    try {
          emit(HomeLoadedSuccessEventPageState(eventdata: ListData.data()));
    } catch (e) {
          emit(HomeErrorState("$e"));
    }

  }

  FutureOr<void> homeProductClickedEvent(HomeProductClickedEvent event, Emitter<HomeState> emit) {
    emit(HomeNavigateToProductInfoPageState(eventdata: ListData.data(), index: event.index));

  }

  FutureOr<void> homeProfileButtontClickedEvent(HomeProfileButtonClickedEvent event, Emitter<HomeState> emit) {
    emit(HomeNavigateToProfilePageState());
  
  }

  FutureOr<void> homeSearchedClickedEvent(HomeSearchedClickedEvent event, Emitter<HomeState> emit) {
     if(event.value.isNotEmpty){
      searchList = ListData.data().where((item) =>
          item.eventname.toLowerCase().contains(event.value.toLowerCase()) ||
          item.eventdomain.toLowerCase().contains(event.value.toLowerCase())).toList();
    
    emit(HomeNavigateToSearchPageState(searchlist: searchList));
    }else{
          emit(HomeLoadedSuccessEventPageState(eventdata: ListData.data()));
      
    }
  }
}
