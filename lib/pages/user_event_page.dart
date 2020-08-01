import 'package:flutter/material.dart';
import 'package:wpi_campus/record.dart';

class UserEventPage extends StatelessWidget {
  final Record record;

  const UserEventPage(this.record, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // fixme wouldn't it make sense to just keep record.name in
            //   the app bar and leave it at that?
            Image.asset(
              "resources/appBar/wpiLogo.png",
              fit: BoxFit.contain,
              height: 32,
            ),
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          _buildImage(),
          _buildGeneralInfo(),
          _buildDescriptionHeader(),
          _buildDescription(),
        ],
      ),
    );
  }

  Widget _buildDescription() {
    final _font = TextStyle(fontSize: 18.0, color: Colors.black);
    return Padding(
      padding:
          EdgeInsets.only(left: 30.0, top: 15.0, right: 30.0, bottom: 30.0),
      child: Text(record.description, style: _font),
    );
  }

  Widget _buildDescriptionHeader() {
    final _font = TextStyle(fontSize: 28.0, color: Colors.black);
    return Padding(
      padding: EdgeInsets.only(left: 15.0, top: 15.0),
      child: Text("Description", style: _font),
    );
  }

  Widget _buildGeneralInfo() {
    final _font = TextStyle(fontSize: 16.0, color: Colors.black);
    return Padding(
      padding: EdgeInsets.only(left: 50.0, top: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            record.name,
            style: TextStyle(
              fontSize: 28.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text("Organizer: " + record.organizer, style: _font),
          Text("Contact: " + record.contact, style: _font),
          Text(" "),
          Text("Date: " + record.date, style: _font),
          Text("Time: " + record.time, style: _font),
          Text("Location: " + record.location, style: _font),
          Text(" "),
          Text("Zoom Link: " + record.zoom, style: _font),
          Text("Capacity: " + record.capacity, style: _font),
        ],
      ),
    );
  }

  Widget _buildImage() {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(record.image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
