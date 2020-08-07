import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';
import 'package:wpi_campus/model/home_event.dart';
import 'package:wpi_campus/model/repositories/data_repository.dart';
import 'package:wpi_campus/model/user_event.dart';

const _description1 =
    "WPI is hosting the WPI COVID-19 Innovation Challenge, to build innovative solutions that address the most pressing "
    "COVID-19 issues related to WPI's return to campus for fall 2020. While WPI will follow federal, state, and local guidance, including that from the"
    " Centers for Disease Control and Prevention, we know our students (incoming and returning) have the creativity, ingenuity, and tenacity to develop"
    " solutions that will help us in our top priorities of health, safety, and well-being for our community—which, of course, includes providing a "
    "high-quality and rewarding college experience. Join us for a few days of developing solutions that can help reduce the spread of COVID-19 while "
    "letting students have the high-quality and rewarding college experience. You might even win one of our three prizes ranging from 500 to "
    "1,000 in Goat Bucks. We can't guarantee that WPI COVID-19 Innovation Challenge solutions will be implemented, but the student input is incredibly"
    " valuable in developing a deeper understanding of our students’ needs. We hope that you’ll join us in our mission, and we look forward to "
    "learning about all your projects and ideas.";

const _description2 =
    "Fraternities and sororities are founded on the principles of scholarship, leadership, and community service. In addition"
    " to developing leadership skills, attending social events, and serving the community, being in a fraternity or sorority is about forging friendships"
    " that will last far beyond the college years. With events like the Greek Carnival during New Student Orientation, Greek Week, and the Float"
    " Parade during Homecoming, the Greek community is an integral aspect of WPI, and you’re invited to be a part of it.";

const _description3 =
    "As an employer looking to recruit indispensable talent for your company, you’ll find our Career Fairs to be a"
    " valuable resource to connect with our students. Employers consistently give us feedback that WPI students they’ve hired have the technical, "
    "people, and leadership skills to hit the ground running and tackle complex problems. The Career Development Center (CDC) hosts multiple in-person"
    " and virtual Career Fairs for WPI students and alumni to learn about full-time, part-time, summer internship, and co-op opportunities. A great way"
    " to meet and recruit key talent from all WPI disciplines, attending a Career Fair will also increase your organization’s visibility on campus.";

const _event1 = HomeEvent(
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
    _description1,
    "gr-WPITogetherCovid19InnovationChallenge@wpi.edu");
const _event2 = HomeEvent(
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
    _description2,
    "sao@wpi.edu");
const _event3 = HomeEvent(
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
    _description3,
    "cdc@wpi.edu");

const _homeEvents = [_event1, _event2, _event3];

class FirebaseDataRepository extends DataRepository {
  // ignore: close_sinks
  final _homeEventsStream = BehaviorSubject<List<HomeEvent>>.seeded(null);

  // ignore: close_sinks
  final _userEventsStream = BehaviorSubject<List<UserEvent>>.seeded(null);

  FirebaseDataRepository() {
    _userEventsStream.addStream(Firestore.instance
        .collection('Events')
        .orderBy('created', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.documents
            .map((doc) => UserEvent.fromSnapshot(doc))
            .toList()));
    _homeEventsStream.add(_homeEvents); // fixme use firebase for home events
  }

  @override
  BehaviorSubject<List<HomeEvent>> get homeEventsStream => _homeEventsStream;

  @override
  BehaviorSubject<List<UserEvent>> get userEventsStream => _userEventsStream;
}
