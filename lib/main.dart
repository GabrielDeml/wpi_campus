import 'package:flutter/material.dart';
import 'package:wpi_campus/navbar.dart';

void main() {
  runApp(MaterialApp(
    title: 'WPI Event Manager',
    theme: ThemeData(primaryColor: Color.fromRGBO(172, 43, 55, 1)),
    home: MainPageStateFul(),
  ));
}
