import 'package:flutter/material.dart';
import 'package:wpi_campus/addEvent.dart';
import 'package:wpi_campus/test.dart';
import 'userEvents.dart';
import 'home.dart';

class MainPageStateFul extends StatefulWidget {
  MainPageStateFul({Key key}) : super(key: key);

  @override
  _MainPageStateFul createState() => _MainPageStateFul();
}

class _MainPageStateFul extends State<MainPageStateFul> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = new List<Widget>();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
//  Home screen buttons
    _widgetOptions.add(Home());
    _widgetOptions.add(UserEvents());
    _widgetOptions.add(AddEvent());
//    _widgetOptions.add(Test());

//    Build app bar
    return MaterialApp(

      title: 'WPI Event Manager',
      theme: ThemeData(primaryColor: Color.fromRGBO(172, 43, 55, 1)),
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("resources/appBar/wpiLogo.png", fit: BoxFit.contain,
                  height: 32),
            ],
          ),
        ),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
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
//          BottomNavigationBarItem(
//            icon: Icon(Icons.settings),
//            title: Text('Testing'),
//          ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
