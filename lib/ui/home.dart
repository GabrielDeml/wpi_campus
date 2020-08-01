import 'package:flutter/material.dart';
import 'package:wpi_campus/ui/favorites_page.dart';
import 'package:wpi_campus/main.dart';
import 'package:wpi_campus/model/home_event.dart';
import 'package:wpi_campus/ui/chip_drawer.dart';
import 'package:wpi_campus/ui/event_card.dart';
import 'package:wpi_campus/event_search_delegate.dart';
import 'package:wpi_campus/model/repositories/data_repository.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<HomeEvent>>(
      stream: get<DataRepository>().homeEventsStream,
      builder: (context, snapshot) {
        if (!snapshot.hasData) return CircularProgressIndicator();
        final homeEvents = snapshot.data;
        final favorites = [homeEvents[0], homeEvents[2]];
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  "resources/appBar/wpiLogo.png",
                  fit: BoxFit.contain,
                  height: 32,
                )
              ],
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.favorite),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => FavoritePage(favorites)),
                ),
              ),
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  showSearch(
                    context: context,
                    delegate: EventSearchDelegate(homeEvents, favorites),
                  );
                },
              )
            ],
          ),
          drawer: ChipDrawer(homeEvents, favorites),
          body: EventCard(homeEvents, favorites),
        );
      }
    );
  }
}
