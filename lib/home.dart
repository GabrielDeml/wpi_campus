import 'package:flutter/material.dart';
import 'package:wpi_campus/homeEvent.dart';


import 'eventPage.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static String description1 = "WPI is hosting the WPI COVID-19 Innovation Challenge, to build innovative solutions that address the most pressing "
      "COVID-19 issues related to WPI's return to campus for fall 2020. While WPI will follow federal, state, and local guidance, including that from the"
      " Centers for Disease Control and Prevention, we know our students (incoming and returning) have the creativity, ingenuity, and tenacity to develop"
      " solutions that will help us in our top priorities of health, safety, and well-being for our community—which, of course, includes providing a "
      "high-quality and rewarding college experience. Join us for a few days of developing solutions that can help reduce the spread of COVID-19 while "
      "letting students have the high-quality and rewarding college experience. You might even win one of our three prizes ranging from 500 to "
      "1,000 in Goat Bucks. We can't guarantee that WPI COVID-19 Innovation Challenge solutions will be implemented, but the student input is incredibly"
      " valuable in developing a deeper understanding of our students’ needs. We hope that you’ll join us in our mission, and we look forward to "
      "learning about all your projects and ideas.";

  static String description2 = "Fraternities and sororities are founded on the principles of scholarship, leadership, and community service. In addition"
      " to developing leadership skills, attending social events, and serving the community, being in a fraternity or sorority is about forging friendships"
      " that will last far beyond the college years. With events like the Greek Carnival during New Student Orientation, Greek Week, and the Float"
      " Parade during Homecoming, the Greek community is an integral aspect of WPI, and you’re invited to be a part of it.";

  static String description3 = "As an employer looking to recruit indispensable talent for your company, you’ll find our Career Fairs to be a"
      " valuable resource to connect with our students. Employers consistently give us feedback that WPI students they’ve hired have the technical, "
      "people, and leadership skills to hit the ground running and tackle complex problems. The Career Development Center (CDC) hosts multiple in-person"
      " and virtual Career Fairs for WPI students and alumni to learn about full-time, part-time, summer internship, and co-op opportunities. A great way"
      " to meet and recruit key talent from all WPI disciplines, attending a Career Fair will also increase your organization’s visibility on campus.";

  static HomeEvent event1 = new HomeEvent("resources/imgEvent/covidChallenge.png", "Covid Challenge", "I&E, SAO", "Innovate solutions that address the most pressing COVID-19 issues.", "7/25/2020", "4:30-5:30 PM", ["Remote", "Challenge", "Innovation"], "Online", "https://wpi.zoom.us/", "None", description1, "gr-WPITogetherCovid19InnovationChallenge@wpi.edu");
  static HomeEvent event2 = new HomeEvent("resources/imgEvent/rush.jpg", "Greek Recuitment", "SAO", "Are you ready to become a member of WPI’s vibrant community of fraternities and sororities?", "7/25/2020", "7:30-10:30 PM", ["In-Person", "Greek"], "106 Higgings Lab", "N/A", "None", description2, "sao@wpi.edu");
  static HomeEvent event3 = new HomeEvent("resources/imgEvent/careerFair.jpg", "Career Fair", "CDC", "We can help you take the first step in learning more about jobs and companies that interest you.", "7/25/2020", "2:00-5:00 PM", ["Hybrid"], "203 Salisbury Lab", "https://wpi.zoom.us/", "10", description3, "cdc@wpi.edu");

  List<HomeEvent> _homeEvents = [event1, event2, event3];

  List<HomeEvent> _favorites = [event1, event3];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("resources/appBar/wpiLogo.png", fit: BoxFit.contain,
                height: 32),
          ],
        ),
      ),
      body: ListView.separated(
        itemCount: _homeEvents.length,
        separatorBuilder: (BuildContext context, int index) =>
            Divider(height: 12),
        padding: EdgeInsets.all(16.0),
        itemBuilder: (BuildContext context, int index) {
          return _buildHomeEvents(_homeEvents[index]);
        },
      ),
    );
  }

  Widget _buildHomeEvents(homeEvent) {
    final chips = homeEvent.chips;

    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => EventPage(homeEvent, _favorites)));
      },
      child: Container (
        height: 300,
        decoration: BoxDecoration(
            boxShadow: [BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 2,
              offset: Offset(0, 3),
            )],
            borderRadius: BorderRadius.circular(15.0),
            image: DecorationImage(
              image: AssetImage(homeEvent.img),
              fit: BoxFit.cover,
            )
        ),

        child: Card(
          margin: EdgeInsets.only(top: 130.0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.zero, topRight: Radius.zero, bottomLeft: Radius.circular(15.0), bottomRight: Radius.circular(15.0))),
          color: Color.fromRGBO(172, 43, 55, 0.90),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container (
                    width: 300,
                    child: Row(
                      children: <Widget>[
                        _buildTitleText(homeEvent),
                        _buildOrganizerText(homeEvent),
                      ],
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.only(left: 30, top: 10),
                    child: IconButton(
                      icon: _favorites.contains(homeEvent)? new Icon(Icons.favorite) : new Icon(Icons.favorite_border),
                      color: _favorites.contains(homeEvent)? Color.fromRGBO(255, 93, 96, 0.90) : Colors.white,
                      onPressed: () {
                        setState(() {
                          if(_favorites.contains(homeEvent)) {
                            _favorites.remove(homeEvent);
                          } else {
                            _favorites.add(homeEvent);
                          }
                        });
                      },
                    ),
                  )
                ],
              ),
              _buildDescriptionText(homeEvent),
              Row(
                children: <Widget>[
                  _builderDateText(homeEvent),
//                  _builderContextText(homeEvent),
                ],
              ),
              Row(
                children: List.generate(chips.length, (index) {
                  return Container (
                    padding: EdgeInsets.only(left: 10.0),
                    child: Chip(
                      label: Text(chips[index]),
                      backgroundColor: Color.fromRGBO(116, 0, 29, 1.0),
                      labelStyle: TextStyle(color: Colors.white),
                      labelPadding: EdgeInsets.only(top: 0, bottom: 0, left: 10, right: 10),
                    ),
                  );
                })
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget getTextWidgets(List<String> strings)
  {
    return new Row(children: strings.map((item) => new Text(item)).toList());
  }


  Widget _buildTitleText(homeEvent) {
    final _font = TextStyle(fontSize: 24.0, color: Colors.white);
    return Padding(
      padding: EdgeInsets.only(left: 16.0, top: 16.0),
      child: Text(homeEvent.title, style: _font),
    );
  }

  Widget _buildOrganizerText(homeEvent) {
    final _font = TextStyle(fontSize: 18.0, color: Colors.white, fontStyle: FontStyle.italic);
    return Padding(
      padding: EdgeInsets.only(left: 8.0, top: 16.0),
      child: Text("(" + homeEvent.organizer + ")", style: _font),
    );
  }

  Widget _buildDescriptionText(homeEvent) {
    final _font = TextStyle(fontSize: 14.0, color: Colors.white);
    return Padding(
      padding: EdgeInsets.only(left: 35.0, right: 35.0, top: 5.0),
      child: Text(homeEvent.description, style: _font),
    );
  }

  Widget _builderDateText(homeEvent) {
    final _font = TextStyle(fontSize: 16.0, color: Colors.white);
    return Padding(
      padding: EdgeInsets.only(left: 35.0, top: 5.0),
      child: Text(homeEvent.date + "  |  " + homeEvent.time, style: _font),
    );
  }

}