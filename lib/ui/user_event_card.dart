import 'package:flutter/material.dart';
import 'package:wpi_campus/model/user_event.dart';
import 'package:wpi_campus/ui/user_event_page.dart';

class UserEventCard extends StatelessWidget {
  final UserEvent event;

  const UserEventCard({Key key, this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        title: Text(event.name),
        subtitle: Text(event.description),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => UserEventPage(event)),
          );
        },
      ),
    );
  }
}
