import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:wpi_campus/add_event.dart';
import 'package:wpi_campus/model/home_event.dart';
import 'package:wpi_campus/model/user_event.dart';
import 'package:wpi_campus/ui/event_page.dart';
import 'package:wpi_campus/model/repositories/data_repository.dart';
import 'package:wpi_campus/model/repositories/firebase/firebase_data_repository.dart';
import 'package:wpi_campus/ui/user_event_page.dart';

final get = GetIt.instance;

// todo consider using a material swatch instead of just primary color
final _theme = ThemeData(primaryColor: Color.fromRGBO(172, 43, 55, 1));

void main() {
  get.registerSingleton<DataRepository>(FirebaseDataRepository());
  runApp(MaterialApp(
    title: 'WPI Event Manager',
    theme: _theme.copyWith(brightness: Brightness.light),
    darkTheme: _theme.copyWith(brightness: Brightness.dark),
    themeMode: ThemeMode.system,
    home: _MainPage(),
  ));
}

// todo move the following to different files

class _MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // todo logo, search icon
          ),
      // todo if not signed in make this fab null
      floatingActionButton: FloatingActionButton(
        tooltip: 'Create Event',
        child: Icon(Icons.add),
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (_) => AddEvent())),
      ),
      body: StreamBuilder<List>(
        stream: get<DataRepository>().eventsStream,
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return LinearProgressIndicator();
          }
          final list = snapshot.data;
          return Column(children: [
            // todo put chips as expandable (drop down) wrap here
            //   chips could also be implemented as sliding up bottom modal
            Expanded(
              // todo switch to grid on bigger screen sizes
              child: ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  final item = list[index];
                  if (item is HomeEvent) {
                    return HomeEventCard(event: item);
                  } else if (item is UserEvent) {
                    return UserEventCard(event: item);
                  }
                  print('Event list contains a non-event: $item');
                  return Container();
                },
              ),
            ),
          ]);
        },
      ),
    );
  }
}

class HomeEventCard extends StatelessWidget {
  final HomeEvent event;

  const HomeEventCard({Key key, @required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EventPage(event, [])),
          );
        },
        // todo use hero to animate image & make info page use sliver app bar
        child: Container(
          height: 296,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(event.img),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(children: [
            Expanded(child: Container()),
            Container(
              height: 160,
              color: Color.fromRGBO(172, 43, 55, 0.9),
              child: Column(children: [
                // todo
                Text(event.title),
                Placeholder(),
              ]),
            ),
          ]),
        ),
      ),
    );
  }
}

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
