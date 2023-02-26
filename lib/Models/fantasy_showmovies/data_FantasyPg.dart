class FantasyData {
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

  FantasyData(
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

  List<FantasyData> get genderFantasy {
    return [
      FantasyData(
        id: 0,
        filmName: "infinite 2 .".toUpperCase(),
        subtitle: "",
        photo: "assets/images/fantasy/infinite-cover.jpg",
        subphoto: "assets/images/fantasy/infinite512.jpg",
        filmTrailerName: "Infinite-2 Trailer",
        videoTrailerName: "assets/videos/fantasy/infinite.mp4",
        actorNames: [
          "Mark Wahlberg",
          "Dylan O'Brien",
          "Chiwetel Ejiofor",
          "Sophie Cookson",
        ],
        actorNameInFilm: [
          "Evan McCauley",
          "Heinrich Treadway",
          "Ted McCauley",
          "Tammy",
        ],
        actorPhoto: [
          "assets/images/fantasy/actress/infi/mark.jpg",
          "assets/images/fantasy/actress/infi/dylan.jpg",
          "assets/images/fantasy/actress/infi/chiwetel.jpg",
          "assets/images/fantasy/actress/infi/sophie.jpg"
        ],
        summary:
            "The story centers on a schizophrenic man named Evan Michaels, who, haunted by memories of his past two lives, joins the organization, uncovering dangerous secrets. The adaptation, Infinite, will be scripted by John Lee Hancock and Ian Shorr.",
      ),
      FantasyData(
        id: 1,
        filmName: "Morbius .".toUpperCase(),
        subtitle: "",
        photo: "assets/images/fantasy/morbius.jpg",
        subphoto: "assets/images/fantasy/Morbius512.jpg",
        filmTrailerName: "Morbius Trailer",
        videoTrailerName: "assets/videos/fantasy/morbuis.mp4",
        actorNames: [
          "Jared Leto",
          "Matt Smith",
          "Jared Harris",
          "Al Madrigal",
        ],
        actorNameInFilm: [
          "Michael Morbius",
          "Loxias Crown",
          "Morbius' mentor",
          "Alberto Rodriguez",
        ],
        actorPhoto: [
          "assets/images/fantasy/actress/morbius/jared2.jpg",
          "assets/images/fantasy/actress/morbius/matt.jpg",
          "assets/images/fantasy/actress/morbius/jared.jpg",
          "assets/images/fantasy/actress/morbius/madrigal.jpg"
        ],
        summary:
            "Biochemist Michael Morbius tries to cure himself of a rare blood disease, but when his experiment goes wrong, he inadvertently infects himself with a form of vampirism instead.",
      ),
      FantasyData(
        id: 2,
        filmName: "Avatar 2 .".toUpperCase(),
        subtitle: "",
        photo: "assets/images/fantasy/avatar-cover.jpg",
        subphoto: "assets/images/fantasy/avatar512.jpg",
        filmTrailerName: "Avatar-II Trailer",
        videoTrailerName: "assets/videos/fantasy/avatar.mp4",
        actorNames: [
          "Sam Worthington",
          "Zoe Saldana",
          "CCH Pounder",
          "Cliff Curtis",
        ],
        actorNameInFilm: [
          "Jake Sully",
          "Neytiri",
          "Mo'at",
          "Tonowari",
        ],
        actorPhoto: [
          "assets/images/fantasy/actress/avat/sam.jpg",
          "assets/images/fantasy/actress/avat/zoe.jpg",
          "assets/images/fantasy/actress/avat/pounder.jpg",
          "assets/images/fantasy/actress/avat/cliff.jpg"
        ],
        summary:
            "It's more of a family saga about the struggle with the humans. The one thing we do know about Avatar 2 is that the story will be focused around the oceans of the planet Pandora, and what details we have about new characters would appear to confirm that much.",
      ),
    ];
  }
}
