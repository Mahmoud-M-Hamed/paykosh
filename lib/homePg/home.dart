// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:paykosh/homePg/data_background/background_HomePg.dart';
import 'package:paykosh/homePg/general/general_body.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../helper/Colors.dart';
import 'data_background/data.dart';

class HomePage extends StatefulWidget {
  dynamic initialPage;

  HomePage({super.key, this.initialPage});

  @override
  State<StatefulWidget> createState() {
    return _HomePageState(initialPage);
  }
}

// ignore: camel_case_types
class _HomePageState extends State<HomePage> {
  Color2 colors = Color2();
  dynamic _width, _height;
  List<data> movieData = data().gender_2;
  data? displayMovie;
  final PageController _pageController = PageController();

  dynamic initialPage = 0.0;

  _HomePageState(this.initialPage);

  Future<void> signOut(BuildContext context) async {
    await GoogleSignIn().signOut();
    SystemNavigator.pop();
  }

  AlertDialog showAlertDialog(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.all(12),
      title: const Text(
        "SignOut !",
        style: TextStyle(fontSize: 20),
      ),
      content: const Text(
        "Do You Want SignOut ?",
      ),
      actions: [
        MaterialButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              "No",
              style: TextStyle(color: Colors.deepOrangeAccent),
            )),
        MaterialButton(
            onPressed: () async {
              await signOut(context);
            },
            child: const Text("Yes",
                style: TextStyle(color: Colors.deepOrangeAccent))),
      ],
    );
  }

  PreferredSizeWidget appBarHomePg(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.logout, color: Colors.black, size: 27),
        onPressed: () {
          showDialog(
              context: context,
              builder: showAlertDialog,
              barrierDismissible: false);
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
                backgroundImage: NetworkImage(
                    "${FirebaseAuth.instance.currentUser!.photoURL}"),
                backgroundColor: Colors.transparent,
              )
            : const CircleAvatar(
                backgroundImage: ExactAssetImage("assets/images/logo.png"),
                backgroundColor: Colors.transparent,
              ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;

    displayMovie = movieData[initialPage.round()];

    _pageController.addListener(() {
      setState(() {
        initialPage = _pageController.page;
      });
    });


    Widget _goToAnimationBody(BuildContext context) {
      return GeneralBody(
        initialPage,
        id0: 0,
        id1: 1,
        id2: 2,
      );
    }

    Widget _goToActionBody(BuildContext context) {
      return GeneralBody(
        initialPage,
        id0: 0,
        id1: 1,
        id2: 2,
      );
    }

    Widget _goToHorrorBody(BuildContext context) {
      return GeneralBody(
        initialPage,
        id0: 0,
        id1: 1,
        id2: 2,
      );
    }

    Widget _goToFantasyBody(BuildContext context) {
      return GeneralBody(
        initialPage,
        id0: 0,
        id1: 1,
        id2: 2,
      );
    }

    Widget _goToComedyBody(BuildContext context) {
      return GeneralBody(
        initialPage,
        id0: 0,
        id1: 1,
        id2: 2,
      );
    }

    Widget _goToRomanticBody(BuildContext context) {
      return GeneralBody(
        initialPage,
        id0: 0,
        id1: 1,
        id2: 2,
      );
    }

    void _onPressedIconButton() {
      switch (initialPage.round()) {
        case 0:
          Navigator.of(context)
              .push(MaterialPageRoute(builder: _goToAnimationBody));
          break;
        case 1:
          Navigator.of(context)
              .push(MaterialPageRoute(builder: _goToComedyBody));
          break;
        case 2:
          Navigator.of(context)
              .push(MaterialPageRoute(builder: _goToRomanticBody));
          break;
        case 3:
          Navigator.of(context)
              .push(MaterialPageRoute(builder: _goToFantasyBody));
          break;
        case 4:
          Navigator.of(context)
              .push(MaterialPageRoute(builder: _goToActionBody));
          break;
        case 5:
          Navigator.of(context)
              .push(MaterialPageRoute(builder: _goToHorrorBody));
          break;
        default:
          return;
      }
    }

    return Stack(
      children: [
        SizedBox(
          width: _width,
          height: _height,
          child: Scaffold(
            appBar: appBarHomePg(context),
            extendBodyBehindAppBar: true,
            resizeToAvoidBottomInset: false,
            body: Stack(
              children: [
                backgroundHomePage(
                  backgroundImage: displayMovie!.photo,
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    margin: const EdgeInsets.only(top: 130),
                    child: _movieList(),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  margin: const EdgeInsets.only(bottom: 120),
                  child: IconButton(
                    icon: const Icon(
                      Icons.menu_open,
                      size: 30,
                      color: Colors.black45,
                    ),
                    onPressed: _onPressedIconButton,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _movieList() {
    return Stack(
      children: [
        _movieStack(),
        _pageIndicator(),
        SizedBox(
          height: 500,
          child: PageView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            controller: _pageController,
            itemCount: movieData.length,
            itemBuilder: (context, index) {
              return Container();
            },
          ),
        ),
      ],
    );
  }

  Widget _movieStack() {
    List<Widget> children = [];

    for (int i = displayMovie!.gender_2.length - 1; i >= 0; i--) {
      double topOffset = (2.0 * i) - (initialPage * 2);
      children.add(Positioned.fill(
          top: topOffset,
          left: initialPage > (i) ? -(initialPage - i) * (_width * 4) : 0,
          child: _containerBody(movieData[i])));
    }

    return Stack(
      children: children,
    );
  }

  Container displayTextData(
      {required String displayDataInText,
      required String fontFamily,
      required Color color,
      required double fontsize}) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Text(
        displayDataInText,
        style: TextStyle(
          color: color,
          fontFamily: fontFamily,
          fontStyle: FontStyle.italic,
          letterSpacing: 1,
          wordSpacing: 3,
          fontSize: fontsize,
        ),
      ),
    );
  }

  Widget _containerBody(data displayData) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: 270,
        height: 502,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 1, blurRadius: 2)
          ],
        ),
        child: Stack(
          children: [
            Container(
              height: 500,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
                color: Colors.white,
              ),
            ),
            Column(
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15),
                    ),
                    image: DecorationImage(
                        image: ExactAssetImage(displayData.photo!),
                        fit: BoxFit.cover),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                displayTextData(
                    displayDataInText: displayData.title!,
                    fontFamily: "PirataOne",
                    color: colors.zety,
                    fontsize: 22),
                displayTextData(
                  displayDataInText: displayData.discrbtion!,
                  color: colors.zety.withOpacity(0.5),
                  fontsize: 10,
                  fontFamily: '',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _pageIndicator() {
    return Container(
      alignment: Alignment.bottomCenter,
      margin: const EdgeInsets.only(bottom: 30),
      child: SmoothPageIndicator(
        controller: _pageController,
        count: movieData.length,
        effect: WormEffect(
            activeDotColor: Colors.black,
            dotColor: Colors.grey.withOpacity(0.5)),
        onDotClicked: (index) => _pageController.animateToPage(index,
            duration: const Duration(milliseconds: 500),
            curve: Curves.bounceOut),
      ),
    );
  }
}
