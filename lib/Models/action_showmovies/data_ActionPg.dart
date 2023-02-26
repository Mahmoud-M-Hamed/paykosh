class ActionData {
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

  ActionData(
      {this.id,
      this.actorNames,
      this.actorNameInFilm,
      this.actorPhoto,
      this.title,
      this.photo,
      this.subphoto,
      this.display,
      this.discrbtion,
      this.filmName,
      this.filmTrailerName,
      this.videoTrailerName,
      this.subtitle,
      this.summary});

  List<ActionData> get genderAction {
    return [
      ActionData(
        id: 0,
        filmName: "Fast&Furious 9 .".toUpperCase(),
        subtitle: "",
        photo: "assets/images/action/vindie-cover-2.jpg",
        subphoto: "assets/images/action/fast&farious512.jpg",
        filmTrailerName: "Fast & Furious 9 Trailer",
        videoTrailerName: "assets/videos/action/f9.mp4",
        actorNames: [
          "Vin Diesel",
          "Michelle Rodriguez",
          "Tyrese Gibson",
          "John Cena	",
        ],
        actorNameInFilm: [
          "Dominic Toretto",
          "Letty Ortiz",
          "Roman Pearce",
          "Jakob Toretto"
        ],
        actorPhoto: [
          "assets/images/action/actress/fast/vin.jpg",
          "assets/images/action/actress/fast/michelle.jpg",
          "assets/images/action/actress/fast/tyrese.jpg",
          "assets/images/action/actress/fast/john.jpg"
        ],
        summary:
            "F9 finds Vin Diesel's Dom Toretto leading a quiet life with Letty and his son, Brian. However, a new threat is coming in the form of someone from Dom's past. The crew will come together again to stop a plot led by the most skilled assassin and high-performance driver they've ever come up against: Dom's brother, Jakob",
      ),
      ActionData(
        id: 1,
        filmName: "Free Guy .".toUpperCase(),
        subtitle: "",
        photo: "assets/images/action/freeguy-cover.jpg",
        subphoto: "assets/images/action/freeguy512.jpg",
        filmTrailerName: "Free Guy Trailer",
        videoTrailerName: "assets/videos/action/freeguy.mp4",
        actorNames: [
          "Ryan Reynolds",
          "Utkarsh Ambudkar",
          "Joe Keery",
          "Lil Rel Howery"
        ],
        actorNameInFilm: ["Guy", "Mouser", "Keys", "Buddy"],
        actorPhoto: [
          "assets/images/action/actress/free/ryan.jpg",
          "assets/images/action/actress/free/utkarsh.jpg",
          "assets/images/action/actress/free/joe.jpg",
          "assets/images/action/actress/free/lil.jpg"
        ],
        summary:
            "What's the story about? A bank teller is stuck in his routine discovers he's a background character in the open-world action-adventure video game Free City, and he is the only one capable of saving his world.",
      ),
      ActionData(
        id: 2,
        filmName: "No Time To Die .".toUpperCase(),
        subtitle: "",
        photo: "assets/images/action/notimetodie-cover.jpg",
        subphoto: "assets/images/action/notimetodie512-512.jpg",
        filmTrailerName: "No Time To Die Trailer",
        videoTrailerName: "assets/videos/action/notime.mp4",
        actorNames: [
          "Daniel Craig",
          "Rami Malek",
          "Léa Seydoux",
          "Lashana Lynch",
        ],
        actorNameInFilm: [
          " James Bond",
          "Safin",
          "Dr. Madeleine",
          "Nomi",
        ],
        actorPhoto: [
          "assets/images/action/actress/no_time/daneial.jpg",
          "assets/images/action/actress/no_time/rami.jpg",
          "assets/images/action/actress/no_time/lea.jpg",
          "assets/images/action/actress/no_time/lashana.jpg"
        ],
        summary:
            "Recruited to rescue a kidnapped scientist, globe-trotting spy James Bond finds himself hot on the trail of a mysterious villain, who's armed with a dangerous new technology.",
      ),
    ];
  }
}
