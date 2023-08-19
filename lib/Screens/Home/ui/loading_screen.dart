import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> with SingleTickerProviderStateMixin {
 late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2), // Total duration for fade-in and fade-out
    )..repeat(reverse: true); // Repeats the animation with fading in and out
  }


  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(vertical: 10),
      child:AnimatedSwitcher(
      duration: Duration(seconds: 2), // Total duration for fade-in and fade-out
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return FadeTransition(
            opacity: Tween<double>(begin: 0.3, end: 0.6).animate(
              CurvedAnimation(
                parent: _controller, // Use the AnimationController to control the animation
                curve: Interval(0, 0.2), // Control the fade-in duration
              ),
            ),
            child: EventsLoad(), // Replace this with your content widget
          );
        },
      ),
    ),

    ));
  }
}

class EventsLoad extends StatelessWidget {
  const EventsLoad({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        height: 150,
        width: double.infinity,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(10), boxShadow: [
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
            Positioned(
              child: Container(
                color: Color.fromARGB(148, 0, 0, 0),
              ),
            ),
          ],
        ),
      )
    ]);
  }
}
