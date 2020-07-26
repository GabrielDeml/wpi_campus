import 'package:flutter/material.dart';
import 'package:wpi_campus/homeEvent.dart';

import 'eventPage.dart';

class EventCard extends StatefulWidget {
  final List<HomeEvent> _homeEvents;
  final List<HomeEvent> _favorites;

  EventCard(this._homeEvents, this._favorites);

  @override
  _EventCardState createState() => _EventCardState(_homeEvents, _favorites);
}

class _EventCardState extends State<EventCard> {
  final List<HomeEvent> _homeEvents;
  final List<HomeEvent> _favorites;

  _EventCardState(this._homeEvents, this._favorites);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    final chips = homeEvent.chips;

    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => EventPage(homeEvent, _favorites)));
      },
      child: Container (
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
//                  _builderContextText(homeEvent),
                ],
              ),
              Row(
                  children: List.generate(chips.length, (index) {
                    return Container (
                      padding: EdgeInsets.only(left: 10.0),
                      child: Chip(
                        label: Text(chips[index]),
                        backgroundColor: Color.fromRGBO(116, 0, 29, 1.0),
                        labelStyle: TextStyle(color: Colors.white),
                        labelPadding: EdgeInsets.only(top: 0, bottom: 0, left: 10, right: 10),
                      ),
                    );
                  })
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget getTextWidgets(List<String> strings)
  {
    return new Row(children: strings.map((item) => new Text(item)).toList());
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
      child: Text(homeEvent.date + "  |  " + homeEvent.time, style: _font),
    );
  }
}
