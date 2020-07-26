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

  String getContextString() {
    switch(this.context) {
      case EventContext.undecided:
        return "Undecided";
        break;
      case EventContext.hybrid:
        return "Hybrid";
        break;
      case EventContext.in_person:
        return "In-Person";
        break;
      case EventContext.remote:
        return "Remote";
        break;
      default:
        return "Undecided";
        break;
    }
  }
  //TODO add tags
}