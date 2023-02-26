import 'package:firebase_auth/firebase_auth.dart';
import 'package:paykosh/Models/action_showmovies/data_ActionPg.dart';
import 'package:paykosh/Models/animation_showmovies-2/data_AnimationPg.dart';
import 'package:paykosh/Models/comedy_showmovies/data_ComedyPg.dart';
import 'package:paykosh/Models/fantasy_showmovies/data_FantasyPg.dart';
import 'package:paykosh/Models/horror_showmovies/data_HorrorPg.dart';
import 'package:paykosh/Models/romantic_showmovies/data_RomanticPg.dart';
import 'package:paykosh/helper/Colors.dart';
import 'Package:flutter/material.dart';
import 'package:paykosh/homePg/general/general_film_pg.dart';

class GeneralBody extends StatefulWidget {
  dynamic initialPage, id0, id1, id2;

  GeneralBody(this.initialPage, {super.key, this.id0, this.id1, this.id2});

  @override
  _GeneralBodyState createState() =>
      _GeneralBodyState(initialPage, id0, id1, id2);
}

class _GeneralBodyState extends State<GeneralBody> {
  dynamic initialPage = 0.0;
  dynamic id0 = 0, id1 = 1, id2 = 2;

  _GeneralBodyState(this.initialPage, this.id0, this.id1, this.id2);

  final ActionData _displayData = ActionData();
  final ComedyData _comedyData = ComedyData();
  final AnimationData _animationData = AnimationData();
  final HorrorData _horrorData = HorrorData();
  final RomanticData _romanticData = RomanticData();
  final FantasyData _fantasyData = FantasyData();
  Color2 colors = Color2();

  PreferredSizeWidget appBarHomePg(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios_outlined,
          size: 20,
          color: Colors.black54,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: Text(
        "Paykosh",
        style: TextStyle(
          color: Colors.black.withOpacity(0.6),
          fontStyle: FontStyle.italic,
          fontSize: 20,
          letterSpacing: 3,
          fontFamily: "Pacifico",
        ),
      ),
      actions: [
        (FirebaseAuth.instance.currentUser!.photoURL != null)
            ? CircleAvatar(
                backgroundColor: Colors.transparent,
                backgroundImage: NetworkImage(
                    "${FirebaseAuth.instance.currentUser!.photoURL}"))
            : const CircleAvatar(
                backgroundColor: Colors.transparent,
                backgroundImage: ExactAssetImage("assets/images/logo.png"),
              ),
      ],
    );
  }

  Widget listTile_3({required int id}) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        SizedBox(
          height: 200,
          width: double.infinity,
          child: Material(
            color: Colors.black,
            borderRadius: BorderRadius.circular(20),
            shadowColor: colors.zety,
            elevation: 25,
            child: Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
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
                          ? _displayData.genderAction[id].photo
                          : (initialPage == 5)
                          ? _horrorData.genderHorror[id].photo
                          : ''}"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ),
        Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              colors: [
                Colors.black.withOpacity(0.8),
                Colors.black.withOpacity(0.5)
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 140),
          width: 180,
          child: Material(
            color: Colors.black.withOpacity(0.35),
            borderRadius: BorderRadius.circular(17),
            shadowColor: colors.zety,
            elevation: 25,
            child: ListTile(
              contentPadding:
                  const EdgeInsets.only(top: 10, bottom: 10, left: 6, right: 2),
              title: Text(
                "${(initialPage == 0)
                    ? _animationData.genderAnimation[id].filmName
                    : (initialPage == 1)
                    ? _comedyData.Gender_Comedy[id].filmName
                    : (initialPage == 2)
                    ? _romanticData.genderRomantic[id].filmName
                    : (initialPage == 3)
                    ? _fantasyData.genderFantasy[id].filmName
                    : (initialPage == 4) ? _displayData.genderAction[id].filmName
                    : (initialPage == 5) ? _horrorData.genderHorror[id].filmName
                    : ''}",
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontStyle: FontStyle.italic),
              ),
              leading: Container(
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: ExactAssetImage(
                      "${(initialPage == 0)
                          ? _animationData.genderAnimation[id].subphoto
                          : (initialPage == 1)
                          ? _comedyData.Gender_Comedy[id].subphoto
                          : (initialPage == 2)
                          ? _romanticData.genderRomantic[id].subphoto
                          : (initialPage == 3)
                          ? _fantasyData.genderFantasy[id].subphoto
                          : (initialPage == 4)
                          ? _displayData
                          .genderAction[id].subphoto
                          : (initialPage == 5)
                          ? _horrorData
                          .genderHorror[id].subphoto
                          : null}"
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(17)),
              subtitle: Text(
                "${
                (initialPage == 0)
                    ? _animationData.genderAnimation[id].subtitle
                    : (initialPage == 1)
                    ? _comedyData.Gender_Comedy[id].subtitle
                    : (initialPage == 2)
                    ? _romanticData.genderRomantic[id].subtitle
                    : (initialPage == 3)
                    ? _fantasyData.genderFantasy[id].subtitle
                    : (initialPage == 4)
                    ? _displayData.genderAction[id].subtitle
                    : (initialPage == 5)
                    ? _horrorData.genderHorror[id].subtitle
                    : null}",
                style: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                    fontSize: 15,
                    fontStyle: FontStyle.italic),
              ),
              enabled: true,
              onTap: () {
                if (initialPage == 4 &&
                    _displayData.genderAction[id].id == 0) {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: _goToFast));
                }
                if (initialPage == 4 &&
                    _displayData.genderAction[id].id == 1) {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: _goToFree));
                }
                if (initialPage == 4 &&
                    _displayData.genderAction[id].id == 2) {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: _goToNoTime));
                }
                if (initialPage == 0 &&
                    _animationData.genderAnimation[id].id == 0) {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: _goToRaya));
                }
                if (initialPage == 0 &&
                    _animationData.genderAnimation[id].id == 1) {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: _goToTomJerry));
                }
                if (initialPage == 0 &&
                    _animationData.genderAnimation[id].id == 2) {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: _goToBossBaby));
                }
                if (initialPage == 1 &&
                    _comedyData.Gender_Comedy[id].id == 0) {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: _goToSuper));
                }
                if (initialPage == 1 &&
                    _comedyData.Gender_Comedy[id].id == 1) {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: _goToHalloween));
                }
                if (initialPage == 1 &&
                    _comedyData.Gender_Comedy[id].id == 2) {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: _goToFreaky));
                }
                if (initialPage == 2 &&
                    _romanticData.genderRomantic[id].id == 0) {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: _goToAllMyLife));
                }
                if (initialPage == 2 &&
                    _romanticData.genderRomantic[id].id == 1) {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: _goToLifeInYear));
                }
                if (initialPage == 2 &&
                    _romanticData.genderRomantic[id].id == 2) {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: _goToStarsFell));
                }
                if (initialPage == 3 &&
                    _fantasyData.genderFantasy[id].id == 0) {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: _goToAvatar));
                }
                if (initialPage == 3 &&
                    _fantasyData.genderFantasy[id].id == 1) {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: _goToMorbius));
                }
                if (initialPage == 3 &&
                    _fantasyData.genderFantasy[id].id == 2) {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: _goToInfinite));
                }
                if (initialPage == 5 &&
                    _horrorData.genderHorror[id].id == 0) {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: _goToConj));
                }
                if (initialPage == 5 &&
                    _horrorData.genderHorror[id].id == 1) {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: _goToGrudge));
                }
                if (initialPage == 5 &&
                    _horrorData.genderHorror[id].id == 2) {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: _goToAntlers));
                }
              },
              onLongPress: () {},
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      widget.initialPage = initialPage;
      widget.id0 = id0;
      widget.id1 = id1;
      widget.id2 = id2;
    });
    return Scaffold(
      appBar: appBarHomePg(context),
      body: ListView(
        padding: const EdgeInsets.all(14),
        children: [
          listTile_3(id: 2),
          const SizedBox(height: 30),
          listTile_3(id: 1),
          const SizedBox(height: 30),
          listTile_3(id: 0),
          const SizedBox(height: 25),
        ],
      ),
    );
  }

  Widget _goToFast(BuildContext context) {
    return GeneralFilmPage(
      id: id0,
      initialPage: initialPage,
    );
  }

  Widget _goToFree(BuildContext context) {
    return GeneralFilmPage(
        id: id1, initialPage: initialPage);
  }

  Widget _goToNoTime(BuildContext context) {
    return GeneralFilmPage(
        id: id2, initialPage: initialPage);
  }

  Widget _goToRaya(BuildContext context) {
    return GeneralFilmPage(
        id: id0, initialPage: initialPage);
  }

  Widget _goToTomJerry(BuildContext context) {
    return GeneralFilmPage(
        id: id1, initialPage: initialPage);
  }

  Widget _goToBossBaby(BuildContext context) {
    return GeneralFilmPage(
        id: id2, initialPage: initialPage);
  }

  Widget _goToSuper(BuildContext context) {
    return GeneralFilmPage(
        id: id0, initialPage: initialPage);
  }

  Widget _goToHalloween(BuildContext context) {
    return GeneralFilmPage(
        id: id1, initialPage: initialPage);
  }

  Widget _goToFreaky(BuildContext context) {
    return GeneralFilmPage(
        id: id2, initialPage: initialPage);
  }

  Widget _goToAllMyLife(BuildContext context) {
    return GeneralFilmPage(
        id: id0, initialPage: initialPage);
  }

  Widget _goToLifeInYear(BuildContext context) {
    return GeneralFilmPage(
        id: id1, initialPage: initialPage);
  }

  Widget _goToStarsFell(BuildContext context) {
    return GeneralFilmPage(
        id: id2, initialPage: initialPage);
  }

  Widget _goToAvatar(BuildContext context) {
    return GeneralFilmPage(
        id: id0, initialPage: initialPage);
  }

  Widget _goToMorbius(BuildContext context) {
    return GeneralFilmPage(
        id: id1, initialPage: initialPage);
  }

  Widget _goToInfinite(BuildContext context) {
    return GeneralFilmPage(
        id: id2, initialPage: initialPage);
  }

  Widget _goToConj(BuildContext context) {
    return GeneralFilmPage(
        id: id0, initialPage: initialPage);
  }

  Widget _goToGrudge(BuildContext context) {
    return GeneralFilmPage(
        id: id1, initialPage: initialPage);
  }

  Widget _goToAntlers(BuildContext context) {
    return GeneralFilmPage(
        id: id2, initialPage: initialPage);
  }
}
