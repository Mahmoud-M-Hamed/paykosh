import 'package:paykosh/Models/action_showmovies/data_ActionPg.dart';
import 'package:paykosh/Models/animation_showmovies-2/data_AnimationPg.dart';
import 'package:paykosh/Models/comedy_showmovies/data_ComedyPg.dart';
import 'package:paykosh/Models/fantasy_showmovies/data_FantasyPg.dart';
import 'package:paykosh/Models/horror_showmovies/data_HorrorPg.dart';
import 'package:paykosh/Models/romantic_showmovies/data_RomanticPg.dart';
import 'package:paykosh/helper/Colors.dart';
import 'Package:flutter/material.dart';
import 'package:paykosh/homePg/GeneralTrailer/general_trailer.dart';

class GeneralFilmPage extends StatefulWidget {
  int? id;
  dynamic initialPage;

  GeneralFilmPage({super.key, this.id, this.initialPage});

  @override
  _GeneralFilmPageState createState() =>
      _GeneralFilmPageState(id!, initialPage);
}

class _GeneralFilmPageState extends State<GeneralFilmPage> {
  int id = 0;
  dynamic initialPage = 0.0;

  _GeneralFilmPageState(this.id, this.initialPage);

  final ComedyData _comedyData = ComedyData();
  final AnimationData _animationData = AnimationData();
  final HorrorData _horrorData = HorrorData();
  final RomanticData _romanticData = RomanticData();
  final FantasyData _fantasyData = FantasyData();
  final ActionData _displayFilm = ActionData();
  Color2 colors = Color2();

  Widget _freeGuyTrailer(BuildContext context) {
    return GeneralTrailer(
      id: widget.id!,
      initialPage: widget.initialPage,
    );
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      widget.id = id;
      widget.initialPage = initialPage;
    });

    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Stack(
              children: [
                _photoContainer(id),
                Container(
                  margin: const EdgeInsets.only(top: 5, right: 40),
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios_outlined,
                      size: 20,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                Container(
                  alignment: Alignment.topRight,
                  margin: const EdgeInsets.only(top: 210),
                  child: _containerAbovePhoto(id),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 315),
                  child: Column(
                    children: [
                      Container(
                          alignment: Alignment.topCenter,
                          child: _bodyBelowFilmName()),
                      Container(
                        alignment: Alignment.topCenter,
                        margin: const EdgeInsets.only(top: 30),
                        // ignore: deprecated_member_use
                        child: MaterialButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(19),
                          ),
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 12, bottom: 12),
                          elevation: 12,
                          splashColor: colors.betroly,
                          color: colors.orange_2.withOpacity(0.8),
                          onPressed: () {
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: _freeGuyTrailer));
                          },
                          child: SizedBox(
                            width: 110,
                            child: Row(
                              children: [
                                Text(
                                  "View Trailer",
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.7)),
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  color: colors.offwhite.withOpacity(0.7),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 12),
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.all(12),
                        child: const Text(
                          "Plot Summary :",
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topCenter,
                        padding: const EdgeInsets.all(12),
                        child: summaryText(id),
                      ),
                      Container(
                        alignment: Alignment.topCenter,
                        margin: const EdgeInsets.only(top: 20),
                        padding: const EdgeInsets.all(12),
                        child: _castCrew(id),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _bodyBelowFilmName() {
    return (initialPage == 4 && _displayFilm.genderAction[id].id == 1)
        ? _bodyBottomphoto_1(
            gener_1: ".Comedy",
            gener_2: ".Action",
            gener_3: ".Adventure",
            filmTime: "8:00 PM SAT",
            ticketCost: "50 L.E")
        : (initialPage == 4 && _displayFilm.genderAction[id].id == 0)
            ? _bodyBottomphoto_1(
                gener_2: ".Action",
                gener_3: ".Adventure",
                filmTime: "8:00 PM FRI",
                ticketCost: "50 L.E", gener_1: '.Exciting')
            : (initialPage == 4 &&
                    _displayFilm.genderAction[id].id == 2)
                ? _bodyBottomphoto_1(
                    gener_1: ".Racing",
                    gener_2: ".Action",
                    gener_3: ".Adventure",
                    filmTime: "8:00 PM SUN",
                    ticketCost: "50 L.E")
                : (initialPage == 0 &&
                        _animationData.genderAnimation[id].id == 2)
                    ? _bodyBottomphoto_1(
                        gener_1: ".Animation",
                        gener_2: ".Action",
                        gener_3: ".Adventure",
                        filmTime: "8:00 PM MON",
                        ticketCost: "50 L.E")
                    : (initialPage == 0 &&
                            _animationData.genderAnimation[id].id == 1)
                        ? _bodyBottomphoto_1(
                            gener_1: ".Animation",
                            gener_3: "Adventure",
                            gener_2: ".Comedy",
                            filmTime: "8:00 PM TUE",
                            ticketCost: "50 L.E")
                        : (initialPage == 0 &&
                                _animationData.genderAnimation[id].id == 0)
                            ? _bodyBottomphoto_1(
                                gener_1: ".Animation",
                                gener_2: ".Adventure",
                                gener_3: ".Comedy",
                                filmTime: "8:00 PM WED",
                                ticketCost: "50 L.E")
                            : (initialPage == 1 &&
                                    _comedyData.Gender_Comedy[id].id == 2)
                                ? _bodyBottomphoto_1(
                                    gener_1: ".Comedy",
                                    gener_2: ".Drama",
                                    gener_3: ".Adventure",
                                    filmTime: "8:00 PM THU",
                                    ticketCost: "50 L.E")
                                : (initialPage == 1 &&
                                        _comedyData.Gender_Comedy[id].id ==
                                            1)
                                    ? _bodyBottomphoto_1(
                                        gener_1: ".Comedy",
                                        gener_2: ".Action",
                                        gener_3: ".Adventure",
                                        filmTime: "12:00 AM SAT",
                                        ticketCost: "50 L.E")
                                    : (initialPage == 1 &&
                                            _comedyData.Gender_Comedy[id].id ==
                                                0)
                                        ? _bodyBottomphoto_1(
                                            gener_1: ".Comedy",
                                            gener_2: ".Horror",
                                            gener_3: ".Adventure",
                                            filmTime: "12:00 AM FRI",
                                            ticketCost: "50 L.E")
                                        : (initialPage == 2 &&
                                                _romanticData
                                                        .genderRomantic[id]
                                                        .id ==
                                                    0)
                                            ? _bodyBottomphoto_1(
                                                gener_1: ".Romantic",
                                                gener_2: ".Comedy",
                                                gener_3: ".Adventure",
                                                filmTime: "12:00 AM SUN",
                                                ticketCost: "50 L.E")
                                            : (initialPage == 2 &&
                                                    _romanticData.genderRomantic[id].id ==
                                                        1)
                                                ? _bodyBottomphoto_1(
                                                    gener_1: ".Romantic",
                                                    gener_2: ".Comedy",
                                                    gener_3: ".Adventure",
                                                    filmTime: "12:00 AM MON",
                                                    ticketCost: "50 L.E")
                                                : (initialPage == 2 &&
                                                        _romanticData.genderRomantic[id].id ==
                                                            2)
                                                    ? _bodyBottomphoto_1(
                                                        gener_1: ".Romantic",
                                                        gener_2: ".Comedy",
                                                        gener_3: ".Adventure",
                                                        filmTime:
                                                            "10:00 PM TUE",
                                                        ticketCost: "50 L.E")
                                                    : (initialPage == 3 &&
                                                            _fantasyData.genderFantasy[id].id ==
                                                                0)
                                                        ? _bodyBottomphoto_1(
                                                            gener_1: ".Fantasy",
                                                            gener_2: ".Action",
                                                            gener_3:
                                                                ".Adventure",
                                                            filmTime:
                                                                "10:00 PM WED",
                                                            ticketCost:
                                                                "50 L.E")
                                                        : (initialPage == 3 &&
                                                                _fantasyData.genderFantasy[id].id ==
                                                                    1)
                                                            ? _bodyBottomphoto_1(
                                                                gener_1:
                                                                    ".Fantasy",
                                                                gener_2: ".Horror",
                                                                gener_3: ".Adventure",
                                                                filmTime: "10:00 PM THU",
                                                                ticketCost: "50 L.E")
                                                            : (initialPage == 3 && _fantasyData.genderFantasy[id].id == 2)
                                                                ? _bodyBottomphoto_1(gener_1: ".Fantasy", gener_2: ".Action", gener_3: ".Adventure", filmTime: "10:00 PM FRI", ticketCost: "50 L.E")
                                                                : (initialPage == 5 && _horrorData.genderHorror[id].id == 2)
                                                                    ? _bodyBottomphoto_1(gener_1: ".Horror", gener_2: ".Action", gener_3: ".Adventure", filmTime: "10:00 PM SAT", ticketCost: "50 L.E")
                                                                    : (initialPage == 5 && _horrorData.genderHorror[id].id == 1)
                                                                        ? _bodyBottomphoto_1(gener_1: ".Horror", gener_2: ".Action", gener_3: ".Adventure", filmTime: "8:00 PM Saturday", ticketCost: "50 L.E")
                                                                        : (initialPage == 5 && _horrorData.genderHorror[id].id == 0)
                                                                            ? _bodyBottomphoto_1(gener_1: ".Horror", gener_2: ".Action", gener_3: ".Adventure", filmTime: "8:00 PM Saturday", ticketCost: "50 L.E")
                                                                            : Container();
  }

  Widget _photoContainer(int id) {
    return Container(
      height: 250,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: ExactAssetImage(
              "${(initialPage == 0)
                  ? _animationData.genderAnimation[id].photo
                  : (initialPage == 1)
                  ? _comedyData.Gender_Comedy[id].photo
                  : (initialPage == 2)
                  ? _romanticData.genderRomantic[id].photo
                  : (initialPage == 3)
                  ? _fantasyData.genderFantasy[id].photo
                  : (initialPage == 4)
                  ? _displayFilm.genderAction[id].photo
                  : (initialPage == 5)
                  ? _horrorData.genderHorror[id].photo
                  : ''}",
            ),
            fit: BoxFit.fill),
        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(80)),
      ),
    );
  }

  Widget _containerAbovePhoto(id) {
    return Container(
      height: 80,
      width: 250,
      padding: const EdgeInsets.only(left: 35, top: 25),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(50), bottomLeft: Radius.circular(50)),
        gradient: LinearGradient(
          colors: [
            colors.gamaly.withOpacity(0.5),
            colors.verylightblue.withOpacity(0.8),
          ],
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
        ),
        boxShadow: const [
          BoxShadow(
              offset: Offset(0, 7),
              blurRadius: 25,
              spreadRadius: 1,
              color: Colors.black38),
        ],
      ),
      child: Text(
        "${(initialPage == 0)
            ? _animationData.genderAnimation[id].filmName
            : (initialPage == 1)
            ? _comedyData.Gender_Comedy[id].filmName
            : (initialPage == 2)
            ? _romanticData.genderRomantic[id].filmName
            : (initialPage == 3)
            ? _fantasyData.genderFantasy[id].filmName
            : (initialPage == 4)
            ? _displayFilm.genderAction[id].filmName
            : (initialPage == 5)
            ? _horrorData.genderHorror[id].filmName
            : null}",
        style: TextStyle(
            color: Colors.deepOrangeAccent.withOpacity(0.7),
            fontStyle: FontStyle.italic,
            fontFamily: "Pacifico",
            fontSize: 15,
            letterSpacing: 1),
      ),
    );
  }

//Adventure

  Widget _bodyBottomphoto_1(
      {required String gener_1,
      required String gener_2,
      required String gener_3,
      required String filmTime,
      required String ticketCost}) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerRight,
          margin: const EdgeInsets.only(right: 12),
          child: Text(
            filmTime,
            style: const TextStyle(
                color: Colors.deepOrange,
                fontWeight: FontWeight.bold,
                fontSize: 16),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          alignment: Alignment.centerRight,
          margin: const EdgeInsets.only(right: 12),
          child: Text(
            ticketCost,
            style: const TextStyle(
                color: Colors.deepOrange,
                fontWeight: FontWeight.bold,
                fontSize: 22),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(
                    width: 2, color: Colors.black.withOpacity(0.3)),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Text(
                gener_1,
                style: const TextStyle(color: Colors.black),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(
                    width: 2, color: Colors.black.withOpacity(0.3)),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Text(
                gener_3,
                style: const TextStyle(color: Colors.black),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(
                    width: 2, color: Colors.black.withOpacity(0.3)),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Text(
                gener_2,
                style: const TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget summaryText(id) {
    return Text(
        "${(initialPage == 4)
            ? _displayFilm.genderAction[id].summary
            : (initialPage == 0)
            ? _animationData.genderAnimation[id].summary
            : (initialPage == 1)
            ? _comedyData.Gender_Comedy[id].summary
            : (initialPage == 2)
            ? _romanticData.genderRomantic[id].summary
            : (initialPage == 3)
            ? _fantasyData.genderFantasy[id].summary
            : (initialPage == 5)
            ? _horrorData.genderHorror[id].summary
            : null}");
  }

  Widget _castCrew(id) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _cast(
          actorName:
              "${(initialPage == 4)
                  ? _displayFilm.genderAction[id].actorNames![0]
                  : (initialPage == 0)
                  ? _animationData.genderAnimation[id].actorNames![0]
                  : (initialPage == 1)
                  ? _comedyData.Gender_Comedy[id].actorNames![0]
                  : (initialPage == 2)
                  ? _romanticData.genderRomantic[id].actorNames![0]
                  : (initialPage == 3)
                  ? _fantasyData.genderFantasy[id].actorNames![0]
                  : (initialPage == 5)
                  ? _horrorData.genderHorror[id].actorNames![0]
                  : null}",
          actorNameInFilm:
              "${(initialPage == 4)
                  ? _displayFilm.genderAction[id].actorNameInFilm![0]
                  : (initialPage == 0)
                  ? _animationData.genderAnimation[id].actorNameInFilm![0]
                  : (initialPage == 1)
                  ? _comedyData.Gender_Comedy[id].actorNameInFilm![0]
                  : (initialPage == 2)
                  ? _romanticData.genderRomantic[id].actorNameInFilm![0]
                  : (initialPage == 3)
                  ? _fantasyData.genderFantasy[id].actorNameInFilm![0]
                  : (initialPage == 5)
                  ? _horrorData.genderHorror[id].actorNameInFilm![0]
                  : null}",
          actorPhoto:
              "${(initialPage == 4)
                  ? _displayFilm.genderAction[id].actorPhoto![0]
                  : (initialPage == 0)
                  ? _animationData.genderAnimation[id].actorPhoto![0]
                  : (initialPage == 1)
                  ? _comedyData.Gender_Comedy[id].actorPhoto![0]
                  : (initialPage == 2)
                  ? _romanticData.genderRomantic[id].actorPhoto![0]
                  : (initialPage == 3)
                  ? _fantasyData.genderFantasy[id].actorPhoto![0]
                  : (initialPage == 5)
                  ? _horrorData.genderHorror[id].actorPhoto![0]
                  : null}",
        ),
        const Padding(padding: EdgeInsets.only(left: 8)),
        _cast(
          actorName:
              "${(initialPage == 4)
                  ? _displayFilm.genderAction[id].actorNames![1]
                  : (initialPage == 0)
                  ? _animationData.genderAnimation[id].actorNames![1]
                  : (initialPage == 1)
                  ? _comedyData.Gender_Comedy[id].actorNames![1]
                  : (initialPage == 2)
                  ? _romanticData.genderRomantic[id].actorNames![1]
                  : (initialPage == 3)
                  ? _fantasyData.genderFantasy[id].actorNames![1]
                  : (initialPage == 5)
                  ? _horrorData.genderHorror[id].actorNames![1]
                  : null}",
          actorNameInFilm:
              "${(initialPage == 4)
                  ? _displayFilm.genderAction[id].actorNameInFilm![1]
                  : (initialPage == 0)
                  ? _animationData.genderAnimation[id].actorNameInFilm![1]
                  : (initialPage == 1)
                  ? _comedyData.Gender_Comedy[id].actorNameInFilm![1]
                  : (initialPage == 2)
                  ? _romanticData.genderRomantic[id].actorNameInFilm![1]
                  : (initialPage == 3)
                  ? _fantasyData.genderFantasy[id].actorNameInFilm![1]
                  : (initialPage == 5)
                  ? _horrorData.genderHorror[id].actorNameInFilm![1]
                  : null}",
          actorPhoto:
              "${(initialPage == 4)
                  ? _displayFilm.genderAction[id].actorPhoto![1]
                  : (initialPage == 0)
                  ? _animationData.genderAnimation[id].actorPhoto![1]
                  : (initialPage == 1)
                  ? _comedyData.Gender_Comedy[id].actorPhoto![1]
                  : (initialPage == 2)
                  ? _romanticData.genderRomantic[id].actorPhoto![1]
                  : (initialPage == 3)
                  ? _fantasyData.genderFantasy[id].actorPhoto![1]
                  : (initialPage == 5)
                  ? _horrorData.genderHorror[id].actorPhoto![1]
                  : null}",
        ),
        const Padding(padding: EdgeInsets.only(left: 8)),
        _cast(
          actorName:
              "${(initialPage == 4)
                  ? _displayFilm.genderAction[id].actorNames![2]
                  : (initialPage == 0)
                  ? _animationData.genderAnimation[id].actorNames![2]
                  : (initialPage == 1)
                  ? _comedyData.Gender_Comedy[id].actorNames![2]
                  : (initialPage == 2)
                  ? _romanticData.genderRomantic[id].actorNames![2]
                  : (initialPage == 3)
                  ? _fantasyData.genderFantasy[id].actorNames![2]
                  : (initialPage == 5)
                  ? _horrorData.genderHorror[id].actorNames![2]
                  : null}",
          actorNameInFilm:
              "${(initialPage == 4)
                  ? _displayFilm.genderAction[id].actorNameInFilm![2]
                  : (initialPage == 0)
                  ? _animationData.genderAnimation[id].actorNameInFilm![2]
                  : (initialPage == 1)
                  ? _comedyData.Gender_Comedy[id].actorNameInFilm![2]
                  : (initialPage == 2)
                  ? _romanticData.genderRomantic[id].actorNameInFilm![2]
                  : (initialPage == 3)
                  ? _fantasyData.genderFantasy[id].actorNameInFilm![2]
                  : (initialPage == 5)
                  ? _horrorData.genderHorror[id].actorNameInFilm![2]
                  : null}",
          actorPhoto:
              "${(initialPage == 4)
                  ? _displayFilm.genderAction[id].actorPhoto![2]
                  : (initialPage == 0)
                  ? _animationData.genderAnimation[id].actorPhoto![2]
                  : (initialPage == 1)
                  ? _comedyData.Gender_Comedy[id].actorPhoto![2]
                  : (initialPage == 2)
                  ? _romanticData.genderRomantic[id].actorPhoto![2]
                  : (initialPage == 3)
                  ? _fantasyData.genderFantasy[id].actorPhoto![2]
                  : (initialPage == 5)
                  ? _horrorData.genderHorror[id].actorPhoto![2]
                  : null}",
        ),
        const Padding(padding: EdgeInsets.only(left: 8)),
        _cast(
          actorName:
              "${(initialPage == 4)
                  ? _displayFilm.genderAction[id].actorNames![3]
                  : (initialPage == 0)
                  ? _animationData.genderAnimation[id].actorNames![3]
                  : (initialPage == 1)
                  ? _comedyData.Gender_Comedy[id].actorNames![3]
                  : (initialPage == 2)
                  ? _romanticData.genderRomantic[id].actorNames![3]
                  : (initialPage == 3)
                  ? _fantasyData.genderFantasy[id].actorNames![3]
                  : (initialPage == 5)
                  ? _horrorData.genderHorror[id].actorNames![3]
                  : null}",
          actorNameInFilm:
              "${(initialPage == 4)
                  ? _displayFilm.genderAction[id].actorNameInFilm![3]
                  : (initialPage == 0)
                  ? _animationData.genderAnimation[id].actorNameInFilm![3]
                  : (initialPage == 1)
                  ? _comedyData.Gender_Comedy[id].actorNameInFilm![3]
                  : (initialPage == 2)
                  ? _romanticData.genderRomantic[id].actorNameInFilm![3]
                  : (initialPage == 3)
                  ? _fantasyData.genderFantasy[id].actorNameInFilm![3]
                  : (initialPage == 5)
                  ? _horrorData.genderHorror[id].actorNameInFilm![3]
                  : null}",
          actorPhoto:
              "${(initialPage == 4)
                  ? _displayFilm.genderAction[id].actorPhoto![3]
                  : (initialPage == 0)
                  ? _animationData.genderAnimation[id].actorPhoto![3]
                  : (initialPage == 1)
                  ? _comedyData.Gender_Comedy[id].actorPhoto![3]
                  : (initialPage == 2)
                  ? _romanticData.genderRomantic[id].actorPhoto![3]
                  : (initialPage == 3)
                  ? _fantasyData.genderFantasy[id].actorPhoto![3]
                  : (initialPage == 5)
                  ? _horrorData.genderHorror[id].actorPhoto![3]
                  : null}",
        ),
      ],
    );
  }

  Widget _cast({required String actorName,
    required String actorNameInFilm,
    required String actorPhoto}) {
    return SizedBox(
      width: 70,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(90),
              image: DecorationImage(
                  image: ExactAssetImage(actorPhoto), fit: BoxFit.cover),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 7),
                child: Text(
                  actorName,
                  style: const TextStyle(fontSize: 12),
                ),
              ),
              Text("as",
                  style: TextStyle(
                      color: Colors.black54.withOpacity(0.4), fontSize: 11)),
              Container(
                margin: const EdgeInsets.only(left: 7),
                child: Text(
                  actorNameInFilm,
                  style: TextStyle(
                      color: Colors.black54.withOpacity(0.4), fontSize: 10),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
