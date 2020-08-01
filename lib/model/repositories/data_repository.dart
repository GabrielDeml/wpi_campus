import 'package:rxdart/rxdart.dart';
import 'package:wpi_campus/model/home_event.dart';
import 'package:wpi_campus/model/user_event.dart';

abstract class DataRepository {
  Stream<List<UserEvent>> get userEvents;

  Stream<List<HomeEvent>> get homeEvents;

  /// A stream of merged user and home events
  // todo compare with something better than time strings
  Stream<List> get mergedEvents => Rx.combineLatest2(userEvents, homeEvents,
      (a, b) => [...a, ...b]..sort((a, b) => a.time.compareTo(b.time)));
}
