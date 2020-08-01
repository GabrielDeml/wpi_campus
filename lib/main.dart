import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:wpi_campus/add_event.dart';
import 'package:wpi_campus/ui/home.dart';
import 'package:wpi_campus/model/repositories/data_repository.dart';
import 'package:wpi_campus/model/repositories/firebase/firebase_data_repository.dart';
import 'package:wpi_campus/ui/user_events.dart';

final get = GetIt.instance;

void main() {
  get.registerSingleton<DataRepository>(FirebaseDataRepository());
  runApp(MaterialApp(
    title: 'WPI Event Manager',
    theme: ThemeData(primaryColor: Color.fromRGBO(172, 43, 55, 1)),
    home: MainPage(),
  ));
}

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget body = Home();
    switch (_selectedIndex) {
      case 1:
        body = UserEvents();
        break;
      case 2:
        body = AddEvent();
        break;
    }

    return Scaffold(
      body: Center(child: body),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color.fromRGBO(172, 43, 55, 1),
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            title: Text('Events'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            title: Text('Add Event'),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (n) => setState(() => _selectedIndex = n),
      ),
    );
  }
}
