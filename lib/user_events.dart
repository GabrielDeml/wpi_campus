import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wpi_campus/record.dart';
import 'package:wpi_campus/user_event_page.dart';

class UserEvents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "resources/appBar/wpiLogo.png",
              fit: BoxFit.contain,
              height: 32,
            ),
          ],
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        // todo cache stream with Provider or GetIt
        stream: Firestore.instance
            .collection('Events')
            .orderBy('created', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return LinearProgressIndicator();

          return ListView(
            padding: const EdgeInsets.only(top: 20.0),
            children: snapshot.data.documents
                .map((data) => _UserEventTile(Record.fromSnapshot(data)))
                .toList(),
          );
        },
      ),
    );
  }
}

class _UserEventTile extends StatelessWidget {
  final Record record;

  const _UserEventTile(this.record, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: ValueKey(record.name),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: ListTile(
        title: Text(record.name),
        subtitle: Text(record.description),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => UserEventPage(record)),
          );
        },
      ),
    );
  }
}
