import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wpi_campus/record.dart';
import 'package:wpi_campus/userEventPage.dart';

import 'eventCard.dart';
import 'homeEvent.dart';

class UserEvents extends StatefulWidget {
  @override
  _UserEventsState createState() {
    return _UserEventsState();
  }
}

class _UserEventsState extends State<UserEvents> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("resources/appBar/wpiLogo.png",
                fit: BoxFit.contain, height: 32),
          ],
        ),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance
          .collection('Events')
          .orderBy('created', descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();
        return _buildList(context, snapshot.data.documents);
      },
    );
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    List<HomeEvent> homeEvents = snapshot.map((data) => Record.fromSnapshot(data).getHomeEvent()).toList();
    List<HomeEvent> favorites = [];
    return EventCard(homeEvents, favorites);
  }

//  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
//    final record = Record.fromSnapshot(data);
//
//    return Padding(
//      key: ValueKey(record.name),
//      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//      child: Container(
//        decoration: BoxDecoration(
//          border: Border.all(color: Colors.grey),
//          borderRadius: BorderRadius.circular(5.0),
//        ),
//        child: ListTile(
//          title: Text(record.name),
////          trailing: Text(record.capacity.toString()),
//          subtitle: Text(record.description),
//          onTap: () {
//            print(data.documentID);
//            return Navigator.push(
//                context,
//                MaterialPageRoute(
//                    builder: (context) => UserEventPage(data.documentID)));
//          },
//        ),
//      ),
//    );
//  }
}
