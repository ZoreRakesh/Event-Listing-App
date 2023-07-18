class EventDataModel {
  final String eventname;
  final String eventdomain;
  final String time;
  final String month;
  final String date;
  final String imgurl;
  final String inimgurl;
  final String about;
  final String miniinfo;
  final String price;
  final String contact;
  final String venue;
  final List controllerList;



  EventDataModel( 
      {required this.eventname,
      required this.eventdomain,
      required this.time,
      required this.month,
      required this.date,
      required this.imgurl,
      required this.inimgurl,
      required this.about,
      required this.miniinfo,
      required this.price,
      required this.contact,
      required this.venue, 
      required this.controllerList});
}
