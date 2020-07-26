import 'package:flutter/material.dart';

import 'homeEvent.dart';
import 'eventPage.dart';

class EventSearchDelegate extends SearchDelegate<HomeEvent> {
  List<HomeEvent> allEvents;
  List<HomeEvent> favorites;

  EventSearchDelegate(this.allEvents, this.favorites);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [IconButton(icon: Icon(Icons.clear), onPressed: () {
      query = "";
    })];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      }
      );
  }

  @override
  Widget buildResults(BuildContext context) {
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty? favorites: allEvents.where((e) => e.toString().startsWith(query)).toList();
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => EventPage(suggestionList[index], favorites)));
        },
        leading: Icon(Icons.event, color: Color.fromRGBO(255, 93, 96, 0.90)),
        title: RichText (
          text: TextSpan (
            text: suggestionList[index].toString().substring(0, query.length),
            style: TextStyle (color: Colors.black, fontWeight: FontWeight.bold,),
              children: [
                TextSpan(
                  text: suggestionList[index].toString().substring(query.length),
                  style: TextStyle(color: Colors.grey)
                )
              ]
          )
        ),



//        Text(suggestionList[index].title),
      ),
      itemCount: suggestionList.length,
    );
  }
}


