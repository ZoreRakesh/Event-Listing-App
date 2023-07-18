import 'package:app/Data/event_data.dart';
import 'package:app/Screens/Home/models/event_data_model.dart';


class ListData{

static List<EventDataModel> data(){
return EventData.eventdata.map((e) => EventDataModel(
            eventname: e['eventname'],
            eventdomain: e['eventdomain'], 
            time: e['time'], 
            month: e['month'], 
            date: e['date'], 
            imgurl: e['imgurl'], 
            about: e['about'], 
            contact: e['contact'], 
            inimgurl: e['inimgurl'], 
            miniinfo: e['miniinfo'], 
            price: e['price'],
            venue:e['venue'],
            controllerList:e['controllerList'])).toList();
}
}