import 'package:flutter/material.dart';
import 'package:wpi_campus/homeEvent.dart';

class EventPage extends StatefulWidget {
  final HomeEvent homeEvent;
  final List<HomeEvent> favorites;

  EventPage(this.homeEvent, this.favorites);

  @override
  _EventPageState createState() => _EventPageState(this.homeEvent, this.favorites);
}

class _EventPageState extends State<EventPage> {
  final HomeEvent homeEvent;
  final List<HomeEvent> favorites;

  _EventPageState(this.homeEvent, this.favorites);

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset("resources/appBar/wpiLogo.png", fit: BoxFit.contain,
                height: 32),
          ],
        ),
      ),
      body: _buildInfo(context),
    );
  }

  Widget _buildInfo(context) {
    return ListView (
      children: <Widget>[
        _buildImage(context,homeEvent),
        _buildTitleText(homeEvent),
        _buildChips(homeEvent),
        _buildGeneralInfo(homeEvent),
      ],
    );
  }

  Widget _buildGeneralInfo(homeEvent) {
    final _font = TextStyle(fontSize: 16.0, color: Colors.black);
    return Padding(
      padding: EdgeInsets.only(left: 50.0, top: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Organization: " + homeEvent.organizer, style: _font),
          Text("Date: " + homeEvent.date + " | " + homeEvent.time, style: _font),
          Text("Location: " + homeEvent.location, style: _font),
          Text("Zoom Link: " + homeEvent.zoom, style: _font),
          Text("Capacity: " + homeEvent.capacity, style: _font),
          ],
      ),
    );
  }

  Widget _buildChips(homeEvent) {
    final chips = homeEvent.chips;

    return Row(
        children: List.generate(chips.length, (index) {
          return Container (
            padding: EdgeInsets.only(left: 15.0, top: 10),
            child: Chip(
              label: Text(chips[index]),
              backgroundColor: Color.fromRGBO(170, 42, 54, 1.0),
              labelStyle: TextStyle(color: Colors.white),
              labelPadding: EdgeInsets.only(top: 0, bottom: 0, left: 10, right: 10),
            ),
          );
        })
    );
  }

  Widget _buildTitleText(homeEvent) {
    final _font = TextStyle(fontSize: 36.0, color: Colors.black);
    return Row(
      children: <Widget>[
        Container(
          width: 300,
          padding: EdgeInsets.only(left: 15.0, top: 15.0),
          child: Text(homeEvent.title, style: _font),
        ),
        Container(
          padding: EdgeInsets.only(left: 50, top: 10),
          child: IconButton(
            icon: favorites.contains(homeEvent)? new Icon(Icons.favorite) : new Icon(Icons.favorite_border),
            color: favorites.contains(homeEvent)? Color.fromRGBO(170, 42, 54, 1.0) : Colors.black,
            onPressed: () {
              setState(() {
                if(favorites.contains(homeEvent)) {
                  favorites.remove(homeEvent);
                } else {
                  favorites.add(homeEvent);
                }
              });
            },
          ),
        )
      ],
//        Padding(
//      padding: EdgeInsets.only(left: 15.0, top: 15.0),
//      child: Text(homeEvent.title, style: _font),
//    )
    );
  }

  Widget _buildImage(context, homeEvent) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(homeEvent.img),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

