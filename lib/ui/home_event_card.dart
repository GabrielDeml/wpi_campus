import 'package:flutter/material.dart';
import 'package:wpi_campus/model/home_event.dart';
import 'package:wpi_campus/ui/event_page.dart';

class HomeEventCard extends StatelessWidget {
  final HomeEvent event;

  const HomeEventCard({Key key, @required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EventPage(event, [])),
          );
        },
        // todo use hero to animate image & make info page use sliver app bar
        child: Container(
          height: 296,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(event.img),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(children: [
            Expanded(child: Container()),
            Container(
              height: 160,
              color: Color.fromRGBO(172, 43, 55, 0.9),
              child: Column(children: [
                // todo clean this up a little
                Row(children: <Widget>[
                  _buildTitleText(),
                  _buildOrganizerText(),
                ]),
                _buildDescriptionText(),
                _builderDateText(),
                Row(children: [
                  for (final chip in event.chips) ...[
                    SizedBox(width: 8),
                    Chip(
                      label: Text(chip),
                      backgroundColor: Color.fromRGBO(116, 0, 29, 1.0),
                      labelStyle: TextStyle(color: Colors.white),
                      labelPadding: const EdgeInsets.symmetric(horizontal: 8),
                    ),
                  ]
                ]),
              ]),
            ),
          ]),
        ),
      ),
    );
  }

  // todo clean up following build functions to use material spec
  Widget _buildTitleText() {
    final _font = TextStyle(fontSize: 24.0, color: Colors.white);
    return Padding(
      padding: EdgeInsets.only(left: 16.0, top: 16.0),
      child: Text(event.title, style: _font),
    );
  }

  Widget _buildOrganizerText() {
    final _font = TextStyle(
        fontSize: 18.0, color: Colors.white, fontStyle: FontStyle.italic);
    return Padding(
      padding: EdgeInsets.only(left: 8.0, top: 16.0),
      child: Text("(" + event.organizer + ")", style: _font),
    );
  }

  Widget _buildDescriptionText() {
    final _font = TextStyle(fontSize: 14.0, color: Colors.white);
    return Padding(
      padding: EdgeInsets.only(left: 35.0, right: 35.0, top: 5.0),
      child: Text(event.description, style: _font),
    );
  }

  Widget _builderDateText() {
    final _font = TextStyle(fontSize: 16.0, color: Colors.white);
    return Padding(
      padding: EdgeInsets.only(left: 35.0, top: 5.0),
      child: Text(event.date + "  |  " + event.time, style: _font),
    );
  }
}
