import 'package:flutter/material.dart';
import 'package:wpi_campus/pages/add_event_page.dart';
import 'package:wpi_campus/pages/home_page.dart';
import 'package:wpi_campus/user_events.dart';

void main() {
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
