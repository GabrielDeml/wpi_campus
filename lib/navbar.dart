import 'package:flutter/material.dart';
import 'package:wpi_campus/addEvent.dart';
import 'package:wpi_campus/userEvents.dart';
import 'package:wpi_campus/home.dart';

class MainPageStateFul extends StatefulWidget {
  MainPageStateFul({Key key}) : super(key: key);

  @override
  _MainPageStateFul createState() => _MainPageStateFul();
}

class _MainPageStateFul extends State<MainPageStateFul> {
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
