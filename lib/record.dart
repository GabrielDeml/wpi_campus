import 'package:cloud_firestore/cloud_firestore.dart';

class Record {
  final String name;
  final String description;
  final String organizer;
  final String contact;
  final String date;
  final String time;
  final String location;
  final String zoom;
  final String capacity;
  final String image;

  final DocumentReference reference;

  Record.fromMap(Map<String, dynamic> map, {this.reference})
      : name = map['name'] ?? '',
        description = map['description'] ?? '',
        organizer = map['organizer'] ?? '',
        contact = map['contact'] ?? '',
        date = map['date'] ?? '',
        time = map['time'] ?? '',
        location = map['location'] ?? '',
        zoom = map['zoom'] ?? '',
        capacity = map['capacity'] ?? '', 
        image = map['image'] ?? 'https://www.wpi.edu/sites/default/files/inline-image/Offices/Marketing-Communications/WPI_Inst_Prim_FulClr.png';

  Record.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "Record<$name:$capacity$description>";
}
