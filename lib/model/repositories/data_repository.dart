import 'package:rxdart/rxdart.dart';
import 'package:wpi_campus/model/home_event.dart';
import 'package:wpi_campus/model/user_event.dart';

abstract class DataRepository {
  BehaviorSubject<List<UserEvent>> get userEventsStream;

  BehaviorSubject<List<HomeEvent>> get homeEventsStream;

  /// A stream of merged user and home events
  /// Emits a list (or null) as soon as it is created
  // todo compare with something better than time strings
  Stream<List> get eventsStream {
    return Rx.combineLatest2(userEventsStream, homeEventsStream, (a, b) {
        if (a == null || b == null) {
          return null;
        }
        return [...a, ...b]..sort((a, b) => a.time.compareTo(b.time));
      });
  }
}
