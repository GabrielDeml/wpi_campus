import 'package:flutter/material.dart';
import 'package:wpi_campus/eventContext.dart';
import 'package:wpi_campus/homeEvent.dart';
import 'package:flutter_tags/flutter_tags.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static HomeEvent event1 = new HomeEvent("resources/imgEvent/covidChallenge.png", "Covid Challenge", "I&E, SAO", "Innovate solutions that address the most pressing COVID-19 issues.", "7/25/2020", EventContext.remote);
  static HomeEvent event2 = new HomeEvent("resources/imgEvent/rush.jpg", "Greek Recuitment", "SAO", "Are you ready to become a member of WPI’s vibrant community of fraternities and sororities?", "7/25/2020", EventContext.in_person);
  static HomeEvent event3 = new HomeEvent("resources/imgEvent/careerFair.jpg", "Career Fair", "CDC", "We can help you take the first step in learning more about jobs and companies that interest you.", "7/25/2020", EventContext.undecided);
  List<HomeEvent> _homeEvents = [event1, event2, event3];

  List<HomeEvent> _favorites = [event1, event3];

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
      height: 300,
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
        margin: EdgeInsets.only(top: 130.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.zero, topRight: Radius.zero, bottomLeft: Radius.circular(15.0), bottomRight: Radius.circular(15.0))),
        color: Color.fromRGBO(172, 43, 55, 0.90),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container (
                  width: 300,
                  child: Row(
                    children: <Widget>[
                      _buildTitleText(homeEvent),
                      _buildOrganizerText(homeEvent),
                    ],
                  ),
                ),

                Container(
                  padding: EdgeInsets.only(left: 30, top: 10),
                  child: IconButton(
                    icon: _favorites.contains(homeEvent)? new Icon(Icons.favorite) : new Icon(Icons.favorite_border),
                    color: _favorites.contains(homeEvent)? Color.fromRGBO(255, 93, 96, 0.90) : Colors.white,
                    onPressed: () {
                      setState(() {
                        if(_favorites.contains(homeEvent)) {
                          _favorites.remove(homeEvent);
                        } else {
                          _favorites.add(homeEvent);
                        }
                      });
                    },
                  ),
                )
              ],
            ),
            _buildDescriptionText(homeEvent),
            Row(
              children: <Widget>[
                _builderDateText(homeEvent),
                _builderContextText(homeEvent),
              ],
            ),
            Row(
              children: <Widget>[
                Container (
                  padding: EdgeInsets.only(left: 10.0),
                  child: Chip(
                    label: Text("Admin"),
                    backgroundColor: Color.fromRGBO(116, 0, 29, 1.0),
                    labelStyle: TextStyle(color: Colors.white),
                    labelPadding: EdgeInsets.only(top: 0, bottom: 0, left: 10, right: 10),
//                  elevation: 5,
                  ),
                ),
//                Tag(
//                  id: 1,// optional
//                  icon: Icon.home, // optional
//                  title: 'First Tag', // required
//                  active: true, // optional
//                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTitleText(homeEvent) {
    final _font = TextStyle(fontSize: 24.0, color: Colors.white);
    return Padding(
      padding: EdgeInsets.only(left: 16.0, top: 16.0),
      child: Text(homeEvent.title, style: _font),
    );
  }

  Widget _buildOrganizerText(homeEvent) {
    final _font = TextStyle(fontSize: 18.0, color: Colors.white, fontStyle: FontStyle.italic);
    return Padding(
      padding: EdgeInsets.only(left: 8.0, top: 16.0),
      child: Text("(" + homeEvent.organizer + ")", style: _font),
    );
  }

  Widget _buildDescriptionText(homeEvent) {
    final _font = TextStyle(fontSize: 14.0, color: Colors.white);
    return Padding(
      padding: EdgeInsets.only(left: 35.0, right: 35.0, top: 5.0),
      child: Text(homeEvent.description, style: _font),
    );
  }

  Widget _builderDateText(homeEvent) {
    final _font = TextStyle(fontSize: 16.0, color: Colors.white);
    return Padding(
      padding: EdgeInsets.only(left: 35.0, top: 5.0),
      child: Text(homeEvent.date + "  |", style: _font),
    );
  }

  Widget _builderContextText(homeEvent) {
    final _font = TextStyle(fontSize: 16.0, color: Colors.white);
    return Padding(
      padding: EdgeInsets.only(left: 8.0, top: 5.0),
      child: Text(homeEvent.getContextString(), style: _font),
    );
  }

}