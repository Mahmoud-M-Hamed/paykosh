class RomanticData {
  int? id;
  String? title,
      photo,
      subphoto,
      display,
      discrbtion,
      filmName,
      filmTrailerName,
      videoTrailerName,
      subtitle,
      summary;
  List<String>? actorNames, actorNameInFilm, actorPhoto;


  RomanticData(
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

  List<RomanticData> get genderRomantic {
    return [
      RomanticData(
        id: 0,
        filmName: "Stars Fell on alabama .".toUpperCase(),
        subtitle: "",
        photo: "assets/images/romantic/starsfellonalabama-cover.jpg",
        subphoto: "assets/images/romantic/stars512.jpeg",
        filmTrailerName: "Stars Fell On Alabama",
        videoTrailerName: "assets/videos/romantic/stars.mp4",
        actorNames: [
          "Ciara Hanna",
          "James Maslow",
          "Jason Burkey",
          "Lesa Wilson",
        ],
        actorNameInFilm: [
          "Madison Belle",
          "Bryce Dixon",
          "Kevin Weathers",
          "Rachel Kemnade",
        ],
        actorPhoto: [
          "assets/images/romantic/actress/stars/ciara.jpg",
          "assets/images/romantic/actress/stars/james.jpg",
          "assets/images/romantic/actress/stars/jason.jpg",
          "assets/images/romantic/actress/stars/lisa.jpg"
        ],
        summary:
            "Stars Fell on Alabama is a romantic comedy about Bryce Dixon, a successful Hollywood agent who focuses on work and an extravagant LA-lifestyle, and Madison Belle, a Hollywood starlet on the verge of becoming a true star, if she can just land the right role.",
      ),
      RomanticData(
        id: 1,
        filmName: "life in a year .".toUpperCase(),
        subtitle: "",
        photo: "assets/images/romantic/life-cover.jpg",
        subphoto: "assets/images/romantic/life-in-a-year-512.jpg",
        filmTrailerName: "Life In A Year Trailer",
        videoTrailerName: "assets/videos/romantic/lifeinayear.mp4",
        actorNames: [
          "Jaden Smith",
          "Cara Delevingne",
          "Nia Long",
          "RZA",
        ],
        actorNameInFilm: [
          "Daryn",
          "Isabelle",
          "Catherine",
          "Ron",
        ],
        actorPhoto: [
          "assets/images/romantic/actress/lifeinyear/smith.jpg",
          "assets/images/romantic/actress/lifeinyear/cara.jpg",
          "assets/images/romantic/actress/lifeinyear/nia.jpg",
          "assets/images/romantic/actress/lifeinyear/RZA.jpg"
        ],
        summary:
            "Life in a Year is a 2020 American romantic drama film directed by Mitja Okorn, from a screenplay by Jeffrey Addiss and Will Matthews about a 17 year old teenager who finds that his girlfriend is dying of cancer. It stars Jaden Smith, Cara Delevingne, Cuba Gooding Jr., and Nia Long.",
      ),
      RomanticData(
        id: 2,
        filmName: "all my life .".toUpperCase(),
        subtitle: "",
        photo: "assets/images/romantic/allmylife-cover.jpg",
        subphoto: "assets/images/romantic/allmylife512.jpg",
        filmTrailerName: "All My Life Trailer",
        videoTrailerName: "assets/videos/romantic/allmylife.mp4",
        actorNames: [
          "Jessica Rothe",
          "Harry Shum Jr.",
          "Chrissie Fit ",
          "Jay Pharoah",
        ],
        actorNameInFilm: [
          "Jennifer Carter",
          "Solomon",
          " Amanda Fletcher",
          "Dave Berger",
        ],
        actorPhoto: [
          "assets/images/romantic/actress/allmy/jessica.jpg",
          "assets/images/romantic/actress/allmy/harry.jpg",
          "assets/images/romantic/actress/allmy/chrissie.jpg",
          "assets/images/romantic/actress/allmy/jay.jpg"
        ],
        summary:
            "Life in a Year is a 2020 American romantic drama film directed by Mitja Okorn, from a screenplay by Jeffrey Addiss and Will Matthews about a 17 year old teenager who finds that his girlfriend is dying of cancer. It stars Jaden Smith, Cara Delevingne, Cuba Gooding Jr., and Nia Long.",
      ),
    ];
  }
}
