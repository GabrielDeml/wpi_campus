import 'package:flutter/material.dart';
import 'package:wpi_campus/eventContext.dart';
import 'package:wpi_campus/homeEvent.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<HomeEvent> _homeEvents = [
    new HomeEvent("resources/imgEvent/covidChallenge.png", "Covid Challenge", "WPI", "A Covid Challenge", "7/25/2020", EventContext.remote),
    new HomeEvent("resources/imgEvent/foisie.jpg", "Covid Challenge", "MIT", "A Covid Challenge", "7/25/2020", EventContext.remote)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("resources/appBar/wpiLogo.png", fit: BoxFit.contain,
                height: 32),
          ],
        ),
      ),
      body: ListView.separated(
        itemCount: _homeEvents.length,
        separatorBuilder: (BuildContext context, int index) =>
            Divider(height: 12),
        padding: EdgeInsets.all(16.0),
        itemBuilder: (BuildContext context, int index) {
          return _buildHomeEvents(_homeEvents[index]);
        },
      ),
    );
  }

  Widget _buildHomeEvents(homeEvent) {

    return Container (
      height: 250,
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 2,
          blurRadius: 2,
          offset: Offset(0, 3),
        )],
        borderRadius: BorderRadius.circular(15.0),
        image: DecorationImage(
          image: AssetImage(homeEvent.img),
          fit: BoxFit.cover,
        )
      ),

      child: Card(
        margin: EdgeInsets.only(top: 140.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.zero, topRight: Radius.zero, bottomLeft: Radius.circular(15.0), bottomRight: Radius.circular(15.0))),
        color: Color.fromRGBO(172, 43, 55, 0.90),
        child: Column(
          children: <Widget>[
            Text(homeEvent.title),
            Text(homeEvent.organizer),
          ],
        ),
//        child: Text(homeEvent.date),

      ),
//      child: Card(
//        child: FittedBox(child: homeEvent.img, fit: BoxFit.cover),
//      ),
    );

    Card (
      margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      child: Column(
        children: <Widget>[
          homeEvent.img,
          Text(homeEvent.title)
        ],
      ),
    );
  }
}