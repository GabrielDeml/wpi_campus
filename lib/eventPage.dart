import 'package:flutter/material.dart';
import 'package:wpi_campus/homeEvent.dart';

class EventPage extends StatelessWidget {
  final HomeEvent homeEvent;
  EventPage(this.homeEvent);

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        title: Row(
          //TODO Center logo
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("resources/appBar/wpiLogo.png", fit: BoxFit.contain,
                height: 32),
          ],
        ),
      ),
      body: _buildInfo(context),
    );
  }

  Widget _buildInfo(BuildContext context) {

  }
}

