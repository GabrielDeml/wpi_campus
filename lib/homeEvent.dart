import 'package:flutter/material.dart';
import 'package:wpi_campus/eventContext.dart';

class HomeEvent {
  // Variables
  String img;
  String title;
  String organizer;
  String description;
  String date;
  EventContext context;
  bool favorite = false;

  // Constructor
  HomeEvent(this.img, this.title, this.organizer, this.description, this.date, this.context);

  //TODO add tags
}