import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'homeEvent.dart';
import 'eventCard.dart';

class ChipDrawer extends StatefulWidget {
  final List<HomeEvent> homeEvents;
  final List<HomeEvent> favorite;

  ChipDrawer(this.homeEvents, this.favorite);

  @override
  _ChipDrawerState createState() => _ChipDrawerState(this.homeEvents, this.favorite);
}

class _ChipDrawerState extends State<ChipDrawer> {
  final List<HomeEvent> homeEvents;
  final List<HomeEvent> favorite;

  final List<String> tags = [
    "In-Person",
    "Hybrid",
    "Remote",
    "Undecided",
    "Greek",
    "Career",
    "Challenge",
    "Innovation",
    "Club",
    "Sport",
    "Music",
    "Charity",
    "Info"
  ];

  _ChipDrawerState(this.homeEvents, this.favorite);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Scaffold (
        appBar: AppBar(
          centerTitle: true,
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
            Image.asset("resources/appBar/wpiLogo.png", fit: BoxFit.contain, height: 32),
          ],
        ),
      ),
        body: buildChipContainer(),
      )
    );
  }

  Widget buildChipContainer() {
    return Container(
      child: Wrap(
        children: List.generate(tags.length, (index) {
          return GestureDetector(
              onTap: () {
                List<HomeEvent> currentEvents = homeEvents.where((e) => e.chips.contains(tags[index])).toList();
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Scaffold (
                    appBar: AppBar(
                      centerTitle: true,
                      title: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset("resources/appBar/wpiLogo.png", fit: BoxFit.contain, height: 32),
                        ],
                      ),
                    ),
                    body: EventCard(currentEvents, favorite),
                  );
                }));
                },
          child: Container (
            padding: EdgeInsets.only(left: 2.0, right: 2.0),
            child: Chip (
              label: Text(tags[index]),
              backgroundColor: Color.fromRGBO(116, 0, 29, 1.0),
              labelStyle: TextStyle(color: Colors.white),
              labelPadding: EdgeInsets.only(top: 0, bottom: 0, left: 10, right: 10),
            )
          )
          );
        })
      ),
    );
  }
}

//Row(
//children: List.generate(chips.length, (index) {
//return Container (
//padding: EdgeInsets.only(left: 10.0),
//child: Chip(
//label: Text(chips[index]),
//backgroundColor: Color.fromRGBO(116, 0, 29, 1.0),
//labelStyle: TextStyle(color: Colors.white),
//labelPadding: EdgeInsets.only(top: 0, bottom: 0, left: 10, right: 10),
//),
//);
//})
//)
