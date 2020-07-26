import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wpi_campus/homeEvent.dart';

class UserEventPage extends StatefulWidget {
  final String documentId;

  UserEventPage(this.documentId);

  @override
  _UserEventPageState createState() => _UserEventPageState(this.documentId);
}

class _UserEventPageState extends State<UserEventPage> {
  final String documentId;

//  String description = '';
  SnapShotData snapShotData = new SnapShotData();

  _UserEventPageState(this.documentId);

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
      body: _buildInfo(context),
    );
  }

  Widget _buildInfo(context) {
//    Future<DocumentSnapshot> documentSnapshotFuture =
    Firestore.instance
        .collection('Events')
        .document(documentId)
        .get()
        .then((documentSnapshot) {
//      print(documentSnapshot.data['description']);
      setState(() {
        snapShotData.description = documentSnapshot.data['description'];
      });
    });
    return ListView(
      children: <Widget>[
//        Text(snapShotData.description)
//          _buildImage(context, snapShotData),
////        _buildTitleText(homeEvent),
////        _buildChips(homeEvent),
//          _buildGeneralInfo(documentSnapshot),
//          _buildDescriptionHeader(),
          _buildDescription(snapShotData),
      ],
    );
//    });
  }

  Widget _buildDescription(SnapShotData snapShotData) {
    final _font = TextStyle(fontSize: 18.0, color: Colors.black);
    return Padding(
      padding:
          EdgeInsets.only(left: 30.0, top: 15.0, right: 30.0, bottom: 30.0),
      child: Text(snapShotData.description, style: _font),
    );
  }

  Widget _buildDescriptionHeader() {
    final _font = TextStyle(fontSize: 28.0, color: Colors.black);
    return Padding(
      padding: EdgeInsets.only(left: 15.0, top: 15.0),
      child: Text("Description", style: _font),
    );
  }

  Widget _buildGeneralInfo(SnapShotData snapShotData) {
    final _font = TextStyle(fontSize: 16.0, color: Colors.black);
    return Padding(
      padding: EdgeInsets.only(left: 50.0, top: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Organization: " + "organizer", style: _font),
          Text("Contact: " + "contact", style: _font),
          Text(" "),
          Text("Date: " + "date" + " | " + "time", style: _font),
          Text("Location: " + "location", style: _font),
          Text(" "),
          Text("Zoom Link: " + "zoom", style: _font),
          Text("Capacity: " + "capacity", style: _font),
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

  Widget _buildImage(context, SnapShotData snapShotData) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200,
      decoration: BoxDecoration(
//        image: DecorationImage(
//          image: AssetImage(homeEvent.img),
//          fit: BoxFit.cover,
//        ),

          ),
    );
  }
}

class SnapShotData {
  String description = '';
  String organizer = '';

}
