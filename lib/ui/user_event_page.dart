import 'package:flutter/material.dart';
import 'package:wpi_campus/model/user_event.dart';

class UserEventPage extends StatelessWidget {
  final UserEvent record;

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
//        Text(snapShotData.description)
          _buildImage(),
//        _buildTitleText(homeEvent),
//        _buildChips(homeEvent),
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

//  Widget _buildChips(homeEvent) {
//    final chips = homeEvent.chips;
//
//    return Row(
//        children: List.generate(chips.length, (index) {
//          return Container (
//            padding: EdgeInsets.only(left: 15.0, top: 10),
//            child: Chip(
//              label: Text(chips[index]),
//              backgroundColor: Color.fromRGBO(170, 42, 54, 1.0),
//              labelStyle: TextStyle(color: Colors.white),
//              labelPadding: EdgeInsets.only(top: 0, bottom: 0, left: 10, right: 10),
//            ),
//          );
//        })
//    );
//  }

//  Widget _buildTitleText(homeEvent) {
//    final _font = TextStyle(fontSize: 36.0, color: Colors.black);
//    return Row(
//      children: <Widget>[
//        Container(
//          width: 300,
//          padding: EdgeInsets.only(left: 15.0, top: 15.0),
//          child: Text(homeEvent.title, style: _font),
//        ),
//        Container(
//          padding: EdgeInsets.only(left: 50, top: 10),
//          child: IconButton(
//            icon: favorites.contains(homeEvent)? new Icon(Icons.favorite) : new Icon(Icons.favorite_border),
//            color: favorites.contains(homeEvent)? Color.fromRGBO(170, 42, 54, 1.0) : Colors.black,
//            onPressed: () {
//              setState(() {
//                if(favorites.contains(homeEvent)) {
//                  favorites.remove(homeEvent);
//                } else {
//                  favorites.add(homeEvent);
//                }
//              });
//            },
//          ),
//        )
//      ],
//    );
//  }

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
