import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:wpi_campus/event_search_delegate.dart';
import 'package:wpi_campus/ui/add_event.dart';
import 'package:wpi_campus/model/home_event.dart';
import 'package:wpi_campus/model/user_event.dart';
import 'package:wpi_campus/model/repositories/data_repository.dart';
import 'package:wpi_campus/model/repositories/firebase/firebase_data_repository.dart';
import 'package:wpi_campus/ui/home_event_card.dart';
import 'package:wpi_campus/ui/user_event_card.dart';

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

class _MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          'resources/appBar/wpiLogo.png',
          fit: BoxFit.contain,
          height: 32,
        ),
        actions: <Widget>[
          // fixme favorites and search?
//          IconButton(
//            icon: Icon(Icons.favorite),
//            onPressed: () => Navigator.push(
//              context,
//              MaterialPageRoute(builder: (_) => FavoritePage(favorites)),
//            ),
//          ),
//          IconButton(
//            icon: Icon(Icons.search),
//            onPressed: () {
//              showSearch(
//                context: context,
//                delegate: EventSearchDelegate(homeEvents, favorites),
//              );
//            },
//          )
        ],
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
            // todo put chips as expandable (drop down) wrap here maybe?
            //   chips could also be implemented as sliding up bottom modal
            //   probably not a really important feature tbh for the short term
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
