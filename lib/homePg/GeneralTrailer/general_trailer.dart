import 'package:flutter/material.dart';
import 'package:paykosh/Models/action_showmovies/data_ActionPg.dart';
import 'package:paykosh/Models/animation_showmovies-2/data_AnimationPg.dart';
import 'package:paykosh/Models/comedy_showmovies/data_ComedyPg.dart';
import 'package:paykosh/Models/fantasy_showmovies/data_FantasyPg.dart';
import 'package:paykosh/Models/horror_showmovies/data_HorrorPg.dart';
import 'package:paykosh/Models/romantic_showmovies/data_RomanticPg.dart';
import 'package:paykosh/homePg/GeneralTrailer/trailerPg.dart';

class GeneralTrailer extends StatelessWidget {

  int id;
  dynamic initialPage;
  GeneralTrailer({super.key, required this.id,this.initialPage});

  final ViewTrailer _viewTrailer = ViewTrailer();
  final ComedyData _comedyData = ComedyData();
  final AnimationData _animationData = AnimationData();
  final HorrorData _horrorData = HorrorData();
  final RomanticData _romanticData = RomanticData();
  final FantasyData _fantasyData = FantasyData();
  final ActionData _displayFilm = ActionData();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar:_viewTrailer.appBarTrailerPg(context),
        body: _viewTrailer.viewChewieTrailer(
          filmTrailerName:"${
              (initialPage == 4)?_displayFilm.genderAction[id].filmTrailerName
                  :(initialPage == 0)?_animationData.genderAnimation[id].filmTrailerName
                  :(initialPage == 1)?_comedyData.Gender_Comedy[id].filmTrailerName
                  :(initialPage == 2)?_romanticData.genderRomantic[id].filmTrailerName
                  :(initialPage == 3)?_fantasyData.genderFantasy[id].filmTrailerName
                  :(initialPage == 5)?_horrorData.genderHorror[id].filmTrailerName
                  :null
          }",
          videoTrailerName: "${
              (initialPage == 4)?_displayFilm.genderAction[id].videoTrailerName
                  :(initialPage == 0)?_animationData.genderAnimation[id].videoTrailerName
                  :(initialPage == 1)?_comedyData.Gender_Comedy[id].videoTrailerName
                  :(initialPage == 2)?_romanticData.genderRomantic[id].videoTrailerName
                  :(initialPage == 3)?_fantasyData.genderFantasy[id].videoTrailerName
                  :(initialPage == 5)?_horrorData.genderHorror[id].videoTrailerName
                  :null
          }",
        ),
      ),
    );
  }
}
