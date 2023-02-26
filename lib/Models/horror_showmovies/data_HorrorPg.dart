class HorrorData {
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

  HorrorData(
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

  List<HorrorData> get genderHorror {
    return [
      HorrorData(
        id: 0,
        filmName: "Antlers .".toUpperCase(),
        subtitle: "",
        photo: "assets/images/horror/Antlers-cover.jpg",
        subphoto: "assets/images/horror/antlers-512.jpg",
        filmTrailerName: "Antlers Trailer",
        videoTrailerName: "assets/videos/horror/antlers.mp4",
        actorNames: [
          "Keri Russell",
          "Jesse Plemons",
          "Graham Greene",
          "Scott Haze",
        ],
        actorNameInFilm: [
          "Julia Meadows",
          "Paul Meadows",
          "Warren Stokes",
          "Frank Weaver",
        ],
        actorPhoto: [
          "assets/images/horror/actress/antlers/keri.jpg",
          "assets/images/horror/actress/antlers/jesse.jpg",
          "assets/images/horror/actress/antlers/greene.jpg",
          "assets/images/horror/actress/antlers/scott.jpg"
        ],
        summary:
            "Antlers centers on Julia, a young elementary school teacher who takes a special interest in one of her pupils, Lucas, after he writes a particularly disturbing story for an assignment. She discovers he's keeping a supernatural creature in his home, and unraveling the mystery will require a deep-dive into local legends.",
      ),
      HorrorData(
        id: 1,
        filmName: "Grudge .".toUpperCase(),
        subtitle: "",
        photo: "assets/images/horror/grudge--cover.jpg",
        subphoto: "images/horror/grudge512.jpg",
        filmTrailerName: "Grudge Trailer",
        videoTrailerName: "assets/videos/horror/grudge.mp4",
        actorNames: [
          "Andrea Riseborough",
          "Demián Bichir",
          "John Cho",
          "Betty Gilpin",
        ],
        actorNameInFilm: [
          "Detective Muldoon",
          "Detective Goodman",
          "Peter Spencer",
          "Nina Spencer",
        ],
        actorPhoto: [
          "images/horror/actress/grud/andrea.jpg",
          "images/horror/actress/grud/de.jpg",
          "images/horror/actress/grud/cho.jpg",
          "images/horror/actress/grud/betty.jpg"
        ],
        summary:
            "Matthew Williams (William Mapother), his wife, Jennifer (Clea DuVall), and mother, Emma (Grace Zabriskie), are Americans making a new life in Tokyo. Together they move into a house that has been the site of supernatural occurrences in the past, and it isn't long before their new home begins terrorizing the Williams family as well. The house, as it turns out, is the site of a curse that lingers in a specific place and claims the lives of anyone that comes near.",
      ),
      HorrorData(
        id: 2,
        filmName: "Conjuring III .".toUpperCase(),
        subtitle: "",
        photo: "assets/images/horror/conj-cover.jpg",
        subphoto: "assets/images/horror/conj512.jpg",
        filmTrailerName: "Conjuring-III Trailer",
        videoTrailerName: "assets/videos/horror/conjuring.mp4",
        actorNames: [
          "Vera Farmiga",
          "Patrick Wilson",
          "Shannon Kook",
          "Ruairi O'Connor",
        ],
        actorNameInFilm: [
          "Lorraine Warren",
          "Ed Warren",
          "Drew Thomas",
          "Arne Cheyenne",
        ],
        actorPhoto: [
          "assets/images/horror/actress/conj/vera.jpg",
          "assets/images/horror/actress/conj/wilson.jpg",
          "assets/images/horror/actress/conj/kook.jpg",
          "assets/images/horror/actress/conj/connor.jpg"
        ],
        summary:
            "The official synopsis reads: 'The Conjuring: The Devil Made Me Do It reveals a chilling story of terror, murder and unknown evil that shocked even experienced real-life paranormal investigators Ed and Lorraine Warren'"
            "One of the most sensational cases from their files, it starts with a fight for the soul of a young boy, then takes them beyond anything they’d ever seen before, to mark the first time in U.S. history that a murder suspect would claim demonic possession as a defense.",
      ),
    ];
  }
}
