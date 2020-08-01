import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:wpi_campus/add_event.dart';
import 'package:wpi_campus/model/home_event.dart';
import 'package:wpi_campus/model/user_event.dart';
import 'package:wpi_campus/ui/chip_drawer.dart';
import 'package:wpi_campus/ui/event_page.dart';
import 'package:wpi_campus/ui/home.dart';
import 'package:wpi_campus/model/repositories/data_repository.dart';
import 'package:wpi_campus/model/repositories/firebase/firebase_data_repository.dart';
import 'package:wpi_campus/ui/user_event_page.dart';
import 'package:wpi_campus/ui/user_events.dart';

final get = GetIt.instance;

void main() {
  get.registerSingleton<DataRepository>(FirebaseDataRepository());
  runApp(MaterialApp(
    title: 'WPI Event Manager',
    theme: ThemeData(
      // todo consider using a material swatch instead of just primary color
      primaryColor: Color.fromRGBO(172, 43, 55, 1),
      // todo toggle for bright/dark mode? or follow system
      brightness: Brightness.dark, // todo(gabe) can use Brightness.light too
    ),
    home: MainPage(),
  ));
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // todo logo, search icon
          ),
      body: Body(),
      // todo if not signed in make this null
      floatingActionButton: FloatingActionButton(
          tooltip: 'Create Event',
          child: Icon(Icons.add),
          onPressed: () {
            // todo add event page
          }),
    );
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List>(
      stream: get<DataRepository>().mergedEvents,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return LinearProgressIndicator();
        }
        final list = snapshot.data;
        return Column(children: [
          ChipDrawer(list.where((e) => e is HomeEvent).toList(), []),
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
        child: Container(
          height: 296,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(event.img)),
          ),
          child: Column(children: [
            Expanded(child: Container()),
            Container(
              height: 160,
              color: Color.fromRGBO(172, 43, 55, 0.9),
              child: Column(children: [
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
    return Container(
      key: ValueKey(event.name),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5.0),
      ),
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
