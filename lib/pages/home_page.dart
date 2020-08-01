import 'package:flutter/material.dart';
import 'package:wpi_campus/pages/favorites_page.dart';
import 'package:wpi_campus/home_event.dart';
import 'package:wpi_campus/chip_drawer.dart';
import 'package:wpi_campus/event_card.dart';
import 'package:wpi_campus/event_search_delegate.dart';

const description1 =
    "WPI is hosting the WPI COVID-19 Innovation Challenge, to build innovative solutions that address the most pressing "
    "COVID-19 issues related to WPI's return to campus for fall 2020. While WPI will follow federal, state, and local guidance, including that from the"
    " Centers for Disease Control and Prevention, we know our students (incoming and returning) have the creativity, ingenuity, and tenacity to develop"
    " solutions that will help us in our top priorities of health, safety, and well-being for our community—which, of course, includes providing a "
    "high-quality and rewarding college experience. Join us for a few days of developing solutions that can help reduce the spread of COVID-19 while "
    "letting students have the high-quality and rewarding college experience. You might even win one of our three prizes ranging from 500 to "
    "1,000 in Goat Bucks. We can't guarantee that WPI COVID-19 Innovation Challenge solutions will be implemented, but the student input is incredibly"
    " valuable in developing a deeper understanding of our students’ needs. We hope that you’ll join us in our mission, and we look forward to "
    "learning about all your projects and ideas.";

const description2 =
    "Fraternities and sororities are founded on the principles of scholarship, leadership, and community service. In addition"
    " to developing leadership skills, attending social events, and serving the community, being in a fraternity or sorority is about forging friendships"
    " that will last far beyond the college years. With events like the Greek Carnival during New Student Orientation, Greek Week, and the Float"
    " Parade during Homecoming, the Greek community is an integral aspect of WPI, and you’re invited to be a part of it.";

const description3 =
    "As an employer looking to recruit indispensable talent for your company, you’ll find our Career Fairs to be a"
    " valuable resource to connect with our students. Employers consistently give us feedback that WPI students they’ve hired have the technical, "
    "people, and leadership skills to hit the ground running and tackle complex problems. The Career Development Center (CDC) hosts multiple in-person"
    " and virtual Career Fairs for WPI students and alumni to learn about full-time, part-time, summer internship, and co-op opportunities. A great way"
    " to meet and recruit key talent from all WPI disciplines, attending a Career Fair will also increase your organization’s visibility on campus.";

const event1 = HomeEvent(
    "resources/imgEvent/covidChallenge.png",
    "Covid Challenge",
    "I&E, SAO",
    "Innovate solutions that address the most pressing COVID-19 issues.",
    "7/25/2020",
    "4:30-5:30 PM",
    ["!", "Remote", "Challenge", "Innovation"],
    "Online",
    "https://wpi.zoom.us/",
    "None",
    description1,
    "gr-WPITogetherCovid19InnovationChallenge@wpi.edu");
const event2 = HomeEvent(
    "resources/imgEvent/rush.jpg",
    "Greek Recuitment",
    "SAO",
    "Are you ready to become a member of WPI’s vibrant community of fraternities and sororities?",
    "7/25/2020",
    "7:30-10:30 PM",
    ["!", "In-Person", "Greek"],
    "106 Higgings Lab",
    "N/A",
    "None",
    description2,
    "sao@wpi.edu");
const event3 = HomeEvent(
    "resources/imgEvent/careerFair.jpg",
    "Career Fair",
    "CDC",
    "We can help you take the first step in learning more about jobs and companies that interest you.",
    "7/25/2020",
    "2:00-5:00 PM",
    ["!", "Hybrid"],
    "203 Salisbury Lab",
    "https://wpi.zoom.us/",
    "10",
    description3,
    "cdc@wpi.edu");

const _homeEvents = [event1, event2, event3];

const _favorites = [event1, event3];

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              MaterialPageRoute(builder: (_) => FavoritePage(_favorites)),
            ),
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: EventSearchDelegate(_homeEvents, _favorites),
              );
            },
          )
        ],
      ),
      drawer: ChipDrawer(_homeEvents, _favorites),
      body: EventCard(_homeEvents, _favorites),
    );
  }
}
