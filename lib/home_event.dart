class HomeEvent {
  final String img;
  final String title;
  final String organizer;
  final String description;
  final String date;
  final String time;
  final String location;
  final String zoom;
  final String capacity;
  final String fullDescription;
  final String contact;
  final List<String> chips;

  const HomeEvent(
    this.img,
    this.title,
    this.organizer,
    this.description,
    this.date,
    this.time,
    this.chips,
    this.location,
    this.zoom,
    this.capacity,
    this.fullDescription,
    this.contact,
  );

  // todo fromMap and fromSnapshot

  @override
  String toString() => title;
}
