class data {
  int? id;
  String? title, photo, subphoto, display, discrbtion, filmName, subtitle;

  data(
      {this.id,
      this.title,
      this.photo,
      this.subphoto,
      this.display,
      this.discrbtion,
      this.filmName,
      this.subtitle});

  List<data> get gender_2 {
    return [
      data(
          id: 0,
          title: ".Animation",
          photo: "assets/images/home/Onward.jpg",
          discrbtion:
              "Not everyone can become a great artist, but a great artist can come from anywhere. – Anton Ego, Ratatouille.\n\nAll it takes is little faith and trust. – Peter Pan.\n\nTo infinity, and beyond! – Buzz Lightyear, Toy Story.\n"),
      data(
          id: 1,
          title: ".Comedy",
          photo: "assets/images/home/Comedy.jpg",
          discrbtion:
              "I am in one of those moods where i just want to throw a book at someone's face and be like :'I FACEBOOKED YOU.' "),
      data(
          id: 2,
          title: ".Romantic",
          photo: "assets/images/home/Romantic-1.jpg",
          discrbtion:
              "The best love is the kind that awakens the soul and makes us reach for more, that plants a fire in our hearts and brings peace to our minds. And that’s what you’ve given me. That’s what I’d hoped to give you forever. – Nicholas Sparks, The Notebook.\n"),
      data(
          id: 3,
          title: ".Fantasy",
          photo: "assets/images/home/Fantasy.jpg",
          discrbtion:
              "It is not our abilities that show what we truly are… it is our choices. – Dumbledore, Harry Potter and the Chamber of Secrets" +
                  "\n"),
      data(
          id: 4,
          title: ".Action",
          photo: "assets/images/home/Action.jpg",
          discrbtion:
              "The truth is a matter of circumstances, it’s not all things to all people all the time. – Captain America: The Winter Soldier.\n\nI believe whatever doesn’t kill you, simply makes you…stranger. – The Dark Knight, The Joker"),
      data(
          id: 5,
          title: ".Horror",
          photo: "assets/images/home/horror-2.jpg",
          discrbtion:
              "A Census Taker Once Tried To Test Me. I Ate His Liver With Some Fava Beans And A Nice Chianti - The Silence Of The Lambs,\n\nI See Dead People - The Sixth Sense.\n\nDo You Like Scary Movies? - Scream."),
    ];
  }
}
