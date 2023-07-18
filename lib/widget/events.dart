import 'package:app/Screens/Home/models/event_data_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Events extends StatelessWidget {
  const Events({
    Key? key,
 required this.onTap, 
 required this.eventdata,

  }) : super(key: key);
  final EventDataModel eventdata;
  final onTap;


  @override
  Widget build(BuildContext context) {


    return GestureDetector(
      onTap: onTap,
      child: Column(children: [
        Container(
          
          margin:const  EdgeInsets.symmetric(vertical: 8),
                      height: 150,
      
      width: double.infinity,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
      boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(127, 83, 83, 83),
                      offset: const Offset(
                        0.2,
                        4.0,
                      ),
                      blurRadius: 10.0,
                      spreadRadius: 0.0,
                    ), //BoxShadow
                    ]),
      clipBehavior: Clip.hardEdge,
      
      child: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: [
          FittedBox(
            fit: BoxFit.fill,
            child: Image.network(
              eventdata.imgurl,
              fit: BoxFit.contain,
            ),
          ),
      Positioned(child:  Container(
        decoration: const BoxDecoration(
          
          gradient: LinearGradient(
                //           begin: Alignment.topRight,
                // end: Alignment.bottomLeft,
                // stops: [
                //   0.1,
                //   0.4,
                //   0.6,
                //   0.9,
                // ],
                // colors: [
                //   Colors.yellow,
                //   Colors.red,
                //   Colors.indigo,
                //   Colors.teal,
                // ],
    
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [
              0.0,
              0.65,
              
            ],
            colors: [
              Color.fromARGB(0, 255, 255, 255),
              Color.fromARGB(148, 0, 0, 0),
             
            ],
          )
        ),),),
          Positioned(
            width: 220,
            bottom: 25,
            left: 20,
            child: Text(
              eventdata.eventname,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700),
            ),
          ),
          Positioned(
            width: 190,
            bottom: 10,
            left: 20,
            child: Text(
              eventdata.eventdomain,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.w600),
            ),
          ),
           Positioned(
            top: 12,
            right: 20,
            child: Container(
              decoration: const BoxDecoration(
              color:  Color.fromARGB(36, 0, 0, 0),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(8),bottomLeft: Radius.circular(4),bottomRight: Radius.circular(4),topRight: Radius.circular(4))
              ),
              padding: const EdgeInsets.all(4),
              child: Column(crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                Text(eventdata.date,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 8,
                  fontWeight: FontWeight.w600),),
                   Text(
              eventdata.month,
              style: const TextStyle(
                  color: Colors.white,
                  
                  fontSize: 8,
                  fontWeight: FontWeight.w700),
            ),
            ],),),
          ),
          Positioned(
            bottom: 10,
            right: 20,
            child: Text(
              eventdata.time,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.w600),
            ),
          ),
          
        ],
      ),
        )
      ]),
    );
  }
}
