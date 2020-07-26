import 'package:flutter/material.dart';
import 'package:wpi_campus/homeEvent.dart';

import 'eventCard.dart';

class FavoritePage extends StatefulWidget {
  final List<HomeEvent> _favorites;

  FavoritePage(this._favorites);

  @override
  _FavoritePageState createState() => _FavoritePageState(_favorites);
}

class _FavoritePageState extends State<FavoritePage> {
  final List<HomeEvent> _favorites;

  _FavoritePageState(this._favorites);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset("resources/appBar/wpiLogo.png", fit: BoxFit.contain,
                    height: 32),
              ],
            ),
        ),

        body: EventCard(_favorites, _favorites)
    );
  }
}
