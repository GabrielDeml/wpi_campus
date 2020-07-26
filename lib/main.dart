import 'package:flutter/material.dart';
import 'package:wpi_campus/navbar.dart';
import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WPI Event Manager',
      theme: ThemeData(primaryColor: Color.fromRGBO(172, 43, 55, 1)),
      home: MainPageStateFul(),
    );
  }
}

