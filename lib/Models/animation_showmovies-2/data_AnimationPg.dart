class AnimationData {
  int? id;
  String? title,
      photo,
      subphoto,
      display,
      discrbtion,
      filmName,
      subtitle,
      filmTrailerName,
      videoTrailerName,
      summary;

  List<String>? actorNames, actorNameInFilm, actorPhoto;

  AnimationData(
      {this.id,
      this.actorPhoto,
      this.actorNameInFilm,
      this.actorNames,
      this.title,
      this.photo,
      this.subphoto,
      this.display,
      this.discrbtion,
      this.filmName,
      this.subtitle,
      this.filmTrailerName,
      this.videoTrailerName,
      this.summary});

  List<AnimationData> get genderAnimation {
    return [
      AnimationData(
        id: 0,
        filmName: "Boss Baby 2 .".toUpperCase(),
        subtitle: "",
        photo: "assets/images/animation/babyboss/babyBoss-cover-2.jpg",
        subphoto: "assets/images/animation/babyboss/babyBoss512.png",
        filmTrailerName: "Boss Baby 2 Trailer",
        videoTrailerName: "assets/videos/animation/bossbaby.mp4",
        actorNames: [
          "James Marsden",
          "Amy Sedaris",
          "Lisa Kudrow",
          "Jeff Goldblum",
        ],
        actorNameInFilm: [
          "Tim Templeton",
          "Tina Templeton",
          "Janice Templeton",
          "Dr. Armstrong",
        ],
        actorPhoto: [
          "assets/images/animation/actress/boss_baby/james_marsden.jpg",
          "assets/images/animation/actress/boss_baby/amy.jpg",
          "assets/images/animation/actress/boss_baby/lisa_kudrow.jpg",
          "assets/images/animation/actress/boss_baby/jeff.jpg"
        ],
        summary:
            "Boss Baby 2 will be titled The Boss Baby: Family Business and will jump forward in time when Templeton brothers Tim (James Marsden) and Ted (Alec Baldwin) have grown up. Tim is now married with his own family and Ted has become a successful hedge fund CEO. Unfortunately, they have lost touch with each other.",
      ),
      AnimationData(
        id: 1,
        filmName: "Tom & Jerry .".toUpperCase(),
        subtitle: "",
        photo: "assets/images/animation/tom&jerry/tomandjerry-2.jpg",
        subphoto: "assets/images/animation/tom&jerry/tom&jerry--512.png",
        filmTrailerName: "Tom & Jerry Trailer",
        videoTrailerName: "assets/videos/animation/tom&jerry.mp4",
        actorNames: [
          "Chloë Grace ",
          "Michael Peña",
          "Colin Jost",
          "Rob Delaney",
        ],
        actorNameInFilm: [
          "Kayla",
          "Terrance",
          "Ben",
          " Mr. DuBros",
        ],
        actorPhoto: [
          "assets/images/animation/actress/Chloe_moretz.jpg",
          "assets/images/animation/actress/michael_pena.jpg",
          "assets/images/animation/actress/colin_jost.jpg",
          "assets/images/animation/actress/rob_delaney.jpg"
        ],
        summary:
            "The series features comic fights between an iconic pair of adversaries, a house cat (Tom) and a mouse (Jerry). The plots of each short usually center on Tom and Jerry's numerous attempts to have the best of each other and the mayhem and destruction that follows.",
      ),
      AnimationData(
        id: 2,
        filmName: "Raya-LastDragon .".toUpperCase(),
        subtitle: "",
        photo: "assets/images/animation/raya&dragon/raya-lastdragon-cover.jpg",
        subphoto: "assets/images/animation/raya&dragon/raya.jpg",
        filmTrailerName: "Raya & The Last-Dragon",
        videoTrailerName: "assets/videos/animation/raya.mp4",
        actorNames: [
          "Kelly Marie Tran",
          "Awkwafina",
          "Don Hall",
          "Carlos López Estrada	",
        ],
        actorNameInFilm: [
          "Raya",
          "Sisu",
          "Director",
          " Director",
        ],
        actorPhoto: [
          "assets/images/animation/actress/raya/kelly_marie.jpg",
          "assets/images/animation/actress/raya/awkwafina.jpg",
          "assets/images/animation/actress/raya/don-hall.jpg",
          "assets/images/animation/actress/raya/carlos.jpg"
        ],
        summary:
            "Long ago, in the fantasy world of Kumandra, humans and dragons lived together in harmony. However, when sinister monsters known as the Druun threatened the land, the dragons sacrificed themselves to save humanity. Now, 500 years later, those same monsters have returned, and it's up to a lone warrior to track down the last dragon and stop the Druun for good.",
      ),
    ];
  }
}
