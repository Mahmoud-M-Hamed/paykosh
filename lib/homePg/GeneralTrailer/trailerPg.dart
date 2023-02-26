import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../../helper/Colors.dart';
import 'chewiPg.dart';

class ViewTrailer extends StatelessWidget {
  final Color2 colors = Color2();

  ViewTrailer({super.key});

  Widget trailerName({required String filmName}) {
    return Text(
      filmName,
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        letterSpacing: 2,
        color: Colors.black,
        fontStyle: FontStyle.italic,
      ),
    );
  }

  Widget viewChewieTrailer(
      {String? videoTrailerName, String? filmTrailerName}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.topCenter,
          margin: const EdgeInsets.only(top: 90),
          child: const Icon(
            Icons.movie_filter_outlined,
            color: Colors.black,
            size: 100,
          ),
        ),
        Container(
          alignment: Alignment.topCenter,
          child: trailerName(filmName: filmTrailerName!),
        ),
        Container(
          alignment: Alignment.topCenter,
          margin: const EdgeInsets.only(top: 30),
          height: 230,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.black,
          ),
          child: ChewiVideo(
            videoPlayerController:
                VideoPlayerController.asset(videoTrailerName!),
            looping: true,
          ),
        ),
      ],
    );
  }

  PreferredSizeWidget appBarTrailerPg(BuildContext context) {
    return AppBar(
      leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_outlined,
            size: 20,
            color: Colors.black54,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          }),
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
                backgroundColor: Colors.black,
                backgroundImage: NetworkImage(
                    "${FirebaseAuth.instance.currentUser!.photoURL}"))
            : const CircleAvatar(
                backgroundColor: Colors.black,
                backgroundImage: ExactAssetImage("assets/images/image-5.jpg"),
              ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarTrailerPg(context),
      body: viewChewieTrailer(),
    );
  }
}
