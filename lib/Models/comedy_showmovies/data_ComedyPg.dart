class ComedyData {
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


  ComedyData(
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

  // ignore: non_constant_identifier_names
  List<ComedyData> get Gender_Comedy {
    return [
      ComedyData(
        id: 0,
        filmName: "freaky .".toUpperCase(),
        photo: "assets/images/comedy/freaky-cover2.jpeg",
        subphoto: "assets/images/comedy/freaky-512.jpg",
        subtitle: "",
        filmTrailerName: "Freaky Trailer",
        videoTrailerName: "assets/videos/comedy/freaky.mp4",
        actorNames: [
          "Vince Vaughn",
          "Kathryn Newton",
          "Alan Ruck",
          "Misha Osherovich",
        ],
        actorNameInFilm: [
          "The Butcher",
          "	Millie",
          "Mr. Bernardi",
          "Josh Detmer",
        ],
        actorPhoto: [
          "assets/images/comedy/actress/freaky/vince.jpg",
          "assets/images/comedy/actress/freaky/kathryn.png",
          "assets/images/comedy/actress/freaky/alan.jpg",
          "assets/images/comedy/actress/freaky/misha.jpg"
        ],
        summary:
            "Seventeen-year-old Millie Kessler spends her days trying to survive high school and the cruel actions of the popular crowd. But when she becomes the latest target of the Butcher, the town's infamous serial killer, her senior year becomes the least of her worries. When the Butcher's mystical dagger causes him and Millie to magically switch bodies, the frightened teen learns she has just 24 hours to get her identity back before she looks like a middle-aged maniac forever.",
      ),
      ComedyData(
        id: 1,
        filmName: "hubie halloween .".toUpperCase(),
        photo: "assets/images/comedy/halloween-cover.jpg",
        subphoto: "assets/images/comedy/halloween-512.jpg",
        subtitle: "",
        filmTrailerName: "Huibe Halloween Trailer",
        videoTrailerName: "assets/videos/comedy/halloween.mp4",
        actorNames: [
          "Adam Sandler",
          "Kevin James",
          "Julie Bowen",
          "Ray Liotta",
        ],
        actorNameInFilm: [
          "Hubie Dubois",
          "Sgt. Steve Downey",
          "Violet Valentine",
          "Pete Landolfa",
        ],
        actorPhoto: [
          "assets/images/comedy/actress/halloween/adam.jpg",
          "assets/images/comedy/actress/halloween/kevin.jpg",
          "assets/images/comedy/actress/halloween/julie.jpg",
          "assets/images/comedy/actress/halloween/ray.jpg"
        ],
        summary:
            "It's October 31st in Salem, Massachusetts, and a town's eccentric, devoted community volunteer and the good-natured object of his fellow citizen's derision and meanest pranks, finds himself in the midst of a real investigation, for a real murderer.",
      ),
      ComedyData(
        id: 2,
        filmName: "super-intelligence .".toUpperCase(),
        photo: "assets/images/comedy/super-cover.jpeg",
        subphoto: "assets/images/comedy/super512.jpg",
        subtitle: "",
        filmTrailerName: "Super-Intelligence",
        videoTrailerName: "assets/videos/comedy/super.mp4",
        actorNames: [
          "Melissa McCarthy",
          "Bobby Cannavale",
          "Brian Tyree Henry",
          "Jean Smart",
        ],
        actorNameInFilm: [
          "Carol Vivian",
          "George Churchill",
          "Dennis Caruso",
          " President Monahan",
        ],
        actorPhoto: [
          "assets/images/comedy/actress/super/melissa.jpg",
          "assets/images/comedy/actress/super/bobby.jpg",
          "assets/images/comedy/actress/super/brian.jpg",
          "assets/images/comedy/actress/super/jean.png"
        ],
        summary:
            "When a powerful superintelligence chooses to study Carol, the most average person on Earth, the fate of the world hangs in the balance. As the AI decides whether to enslave, save or destroy humanity, it's up to Carol to prove people are worth saving.",
      ),
    ];
  }
}
