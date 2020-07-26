import 'package:cloud_firestore/cloud_firestore.dart';

class Record {
  final String name;
  final String description;
  final int maxCapacity;
  final DocumentReference reference;

  Record.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['name'] != null),
        assert(map['maxCapacity'] != null),
        assert(map['description'] != null),
        name = map['name'],
        maxCapacity = map['maxCapacity'],
        description = map['description'];

  Record.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "Record<$name:$maxCapacity$description>";
}