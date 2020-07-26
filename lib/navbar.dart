import 'package:flutter/material.dart';
import 'package:wpi_campus/addEvent.dart';
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
//    _widgetOptions.add(AdsTest());

//    Build app bar
    return Scaffold(
      appBar: AppBar(
        title: Text('The Mood'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xff008DCB),
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
//            icon: Icon(Icons.whatshot),
//            title: Text('Ads'),
//          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
