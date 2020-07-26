import 'package:cloud_firestore/cloud_firestore.dart';

class Record {
  final String name;
  final String description;
  final String organizer;
  final String maxCapacity;
  final DocumentReference reference;

  Record.fromMap(Map<String, dynamic> map, {this.reference})
      :name = map['name'] != null ? map['name']: '',
        maxCapacity = map['maxCapacity'] != null ? map['maxCapacity']: '',
        description = map['description'] != null ? map['description'] : '',
        organizer = map['organizer'] != null ? map['organizer'] : '';

  Record.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "Record<$name:$maxCapacity$description>";
}