import 'package:cloud_firestore/cloud_firestore.dart';

import 'homeEvent.dart';

class Record {
  final String capacity;
  final List<String> chips;
  final String contact;
  final String date;
  final String description;
  final String fullDescription;
  final String image;
  final String location;
  final String organizer;
  final String time;
  final String title;
  final String zoom;

  final DocumentReference reference;

  Record.fromMap(Map<String, dynamic> map, {this.reference}) :
      this.capacity = map["Capacity"],
      this.chips = map["Chips"],
      this.contact = map["Contact"],
      this.date = map["Date"],
      this.description = map["Description"],
      this.fullDescription = map["FullDescription"],
      this.image = map["Image"],
      this.location = map["Location"],
      this.organizer = map["Organizer"],
      this.time = map["Time"],
      this.title = map["Title"],
      this.zoom = map["Zoom"];
//      : name = map['name'] != null ? map['name'] : '',
//        description = map['description'],
//        organizer = map['organizer'],
//        contact = map['contact'],
//        date = map['date'],
//        time = map['time'],
//        location = map['location'],
//        zoom = map['zoom'],
//        capacity = map['capacity'] != null ? map['capacity'] : '',
//        image = map['image'] != null ? map['image'] : 'https://www.wpi.edu/sites/default/files/inline-image/Offices/Marketing-Communications/WPI_Inst_Prim_FulClr.png';

  Record.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  HomeEvent getHomeEvent() {
    return new HomeEvent(this.image, this.title, this.organizer, this.description, this.date, this.time, this.chips, this.location, this.zoom, this.capacity, this.fullDescription, this.contact);
  }

  @override
  String toString() => "Record<$title:$capacity$description>";
}
