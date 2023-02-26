import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BookingSysPg extends StatefulWidget {
  @override
  _BookingSysPgState createState() => _BookingSysPgState();
}

class _BookingSysPgState extends State<BookingSysPg> {
  Color bookedColor = Colors.deepOrange;
  Color availableColor = Colors.transparent;
  Color selectedColor = Colors.blue;

  final DateTime _dateTime = DateTime.now();
  final _formkey_3 = GlobalKey<FormState>();
  TextEditingController creditCardController = TextEditingController();

  var firebaseUserId = FirebaseAuth.instance.currentUser!.uid;
  var userNameAuth = FirebaseAuth.instance.currentUser!.displayName;
  CollectionReference usersTimeCollection =
      FirebaseFirestore.instance.collection('users time');

  CollectionReference seatsCollection =
      FirebaseFirestore.instance.collection('seats');

  CollectionReference usersCollection =
      FirebaseFirestore.instance.collection("users");

  CollectionReference usersTimeWithId =
      FirebaseFirestore.instance.collection('UsersTimeWithId');

  CollectionReference bookedFilmName =
      FirebaseFirestore.instance.collection('Booked_F');

  String? test, docsId, chooseFilmFromDropdown, chooseCinemaFromDropdown;
  String? a1,
      a2,
      a3,
      b1,
      b2,
      b3,
      b4,
      b5,
      c1,
      c2,
      c3,
      c4,
      c5,
      d1,
      d2,
      d3,
      d4,
      d5,
      e1,
      e2,
      e3,
      e4,
      e5;

  List filmNamesList = [
    'Raya & The Last Dragon',
    'Tom & Jerry',
    'Boss Baby 2',
    'Super-Intelligence',
    'Hubie Halloween',
    'Freaky',
    'All My Life',
    'Life In A Year',
    'Stars Fell On Alabama',
    'Avatar 2',
    'Morbius',
    'Infinite 2',
    'No Time To Die',
    'Free Guy',
    'Fast & Furious 9',
    'Conjuring 3',
    'Grudge',
    'Antlers'
  ];

  List cinemaNamesList = [
    'Galaxy Star',
    'Dream Palace',
    'CineWorld',
    'Circuit Theater'
  ];

  // <-------------------------------Functions--------------------------------------
  //  <-------------------------------backEnd----------------------------------------
  // -------------------------------------------------------------------------------------------------

  Stream<void> bookedUsersWithTimeDocID() async* {
    await usersTimeCollection.doc('$_dateTime').set({
      '0-User Name': (userNameAuth != null)
          ? FirebaseAuth.instance.currentUser!.displayName
          : usersCollection
              .doc(firebaseUserId)
              .get()
              .then((value) => value.get(['User Name'])),
      '0-E-Mail': FirebaseAuth.instance.currentUser!.email,
      '0-Id': FirebaseAuth.instance.currentUser!.uid,
      '0-FilmName': chooseFilmFromDropdown,
      '0-CinemaName': chooseCinemaFromDropdown,
      'A1': (a1 == 'Booked') ? "Booked" : 'available',
      'A2': (a2 == 'Booked') ? "Booked" : 'available',
      'A3': (a3 == 'Booked') ? "Booked" : 'available',
      'B1': (b1 == 'Booked') ? "Booked" : 'available',
      'B2': (b2 == 'Booked') ? "Booked" : 'available',
      'B3': (b3 == 'Booked') ? "Booked" : 'available',
      'B4': (b4 == 'Booked') ? "Booked" : 'available',
      'B5': (b5 == 'Booked') ? "Booked" : 'available',
      'C1': (c1 == 'Booked') ? "Booked" : 'available',
      'C2': (c2 == 'Booked') ? "Booked" : 'available',
      'C3': (c3 == 'Booked') ? "Booked" : 'available',
      'C4': (c4 == 'Booked') ? "Booked" : 'available',
      'C5': (c5 == 'Booked') ? "Booked" : 'available',
      'D1': (d1 == 'Booked') ? "Booked" : 'available',
      'D2': (d2 == 'Booked') ? "Booked" : 'available',
      'D3': (d3 == 'Booked') ? "Booked" : 'available',
      'D4': (d4 == 'Booked') ? "Booked" : 'available',
      'D5': (d5 == 'Booked') ? "Booked" : 'available',
      'E1': (e1 == 'Booked') ? "Booked" : 'available',
      'E2': (e2 == 'Booked') ? "Booked" : 'available',
      'E3': (e3 == 'Booked') ? "Booked" : 'available',
      'E4': (e4 == 'Booked') ? "Booked" : 'available',
      'E5': (e5 == 'Booked') ? "Booked" : 'available',
    });
  }

  Stream<void> bookedUsersWithFilmName() async* {
    await bookedFilmName
        .doc((chooseFilmFromDropdown == 'Antlers')
            ? 'H_ant'
            : (chooseFilmFromDropdown == 'Tom & Jerry')
                ? '1A_t&m'
                : (chooseFilmFromDropdown == 'Boss Baby 2')
                    ? '1A_babyboss'
                    : (chooseFilmFromDropdown == 'Super-Intelligence')
                        ? 'C_super'
                        : (chooseFilmFromDropdown == 'Hubie Halloween')
                            ? 'C_hubie'
                            : (chooseFilmFromDropdown == 'Freaky')
                                ? 'C_freaky'
                                : (chooseFilmFromDropdown == 'All My Life')
                                    ? 'R_all'
                                    : (chooseFilmFromDropdown ==
                                            'Life In A Year')
                                        ? 'R_life'
                                        : (chooseFilmFromDropdown ==
                                                'Stars Fell On Alabama')
                                            ? 'R_star'
                                            : (chooseFilmFromDropdown ==
                                                    'Avatar 2')
                                                ? 'F_avatar'
                                                : (chooseFilmFromDropdown ==
                                                        'Morbius')
                                                    ? 'F_mor'
                                                    : (chooseFilmFromDropdown ==
                                                            'Infinite 2')
                                                        ? 'F_inf'
                                                        : (chooseFilmFromDropdown ==
                                                                'No Time To Die')
                                                            ? 'AC_notime'
                                                            : (chooseFilmFromDropdown ==
                                                                    'Free Guy')
                                                                ? 'AC_free'
                                                                : (chooseFilmFromDropdown ==
                                                                        'Fast & Furious 9')
                                                                    ? 'AC_f9'
                                                                    : (chooseFilmFromDropdown ==
                                                                            'Conjuring 3')
                                                                        ? 'H_conj'
                                                                        : (chooseFilmFromDropdown ==
                                                                                'Grudge')
                                                                            ? 'H_grud'
                                                                            : '1A_raya')
        .collection('booked_users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set({
      '0-User Name': (userNameAuth != null)
          ? FirebaseAuth.instance.currentUser!.displayName
          : usersCollection
              .doc(firebaseUserId)
              .get()
              .then((value) => value.get(['User Name'])),
      '0-E-Mail': FirebaseAuth.instance.currentUser!.email,
      '0-Id': FirebaseAuth.instance.currentUser!.uid,
      'Payment': 'Done',
      '0-Time': _dateTime,
      '0-FilmName': chooseFilmFromDropdown,
      '0-CinemaName': chooseCinemaFromDropdown,
      'A1': (a1 == 'Booked') ? "Booked" : 'available',
      'A2': (a2 == 'Booked') ? "Booked" : 'available',
      'A3': (a3 == 'Booked') ? "Booked" : 'available',
      'B1': (b1 == 'Booked') ? "Booked" : 'available',
      'B2': (b2 == 'Booked') ? "Booked" : 'available',
      'B3': (b3 == 'Booked') ? "Booked" : 'available',
      'B4': (b4 == 'Booked') ? "Booked" : 'available',
      'B5': (b5 == 'Booked') ? "Booked" : 'available',
      'C1': (c1 == 'Booked') ? "Booked" : 'available',
      'C2': (c2 == 'Booked') ? "Booked" : 'available',
      'C3': (c3 == 'Booked') ? "Booked" : 'available',
      'C4': (c4 == 'Booked') ? "Booked" : 'available',
      'C5': (c5 == 'Booked') ? "Booked" : 'available',
      'D1': (d1 == 'Booked') ? "Booked" : 'available',
      'D2': (d2 == 'Booked') ? "Booked" : 'available',
      'D3': (d3 == 'Booked') ? "Booked" : 'available',
      'D4': (d4 == 'Booked') ? "Booked" : 'available',
      'D5': (d5 == 'Booked') ? "Booked" : 'available',
      'E1': (e1 == 'Booked') ? "Booked" : 'available',
      'E2': (e2 == 'Booked') ? "Booked" : 'available',
      'E3': (e3 == 'Booked') ? "Booked" : 'available',
      'E4': (e4 == 'Booked') ? "Booked" : 'available',
      'E5': (e5 == 'Booked') ? "Booked" : 'available',
    });
  }

  Stream<void> usersTimeWithID() async* {
    await usersTimeWithId.doc(FirebaseAuth.instance.currentUser!.uid).set({
      'userName': (userNameAuth != null)
          ? FirebaseAuth.instance.currentUser!.displayName
          : usersCollection
              .doc(firebaseUserId)
              .get()
              .then((value) => value.get(['User Name'])),
      'E-Mail': FirebaseAuth.instance.currentUser!.email,
      'BookingTime': _dateTime
    });
  }

  Stream<void> fullCompleteCollectionForFilmName() async* {
    await bookedFilmName
        .doc((chooseFilmFromDropdown == 'Antlers')
            ? 'H_ant'
            : (chooseFilmFromDropdown == 'Tom & Jerry')
                ? '1A_t&m'
                : (chooseFilmFromDropdown == 'Boss Baby 2')
                    ? '1A_babyboss'
                    : (chooseFilmFromDropdown == 'Super-Intelligence')
                        ? 'C_super'
                        : (chooseFilmFromDropdown == 'Hubie Halloween')
                            ? 'C_hubie'
                            : (chooseFilmFromDropdown == 'Freaky')
                                ? 'C_freaky'
                                : (chooseFilmFromDropdown == 'All My Life')
                                    ? 'R_all'
                                    : (chooseFilmFromDropdown ==
                                            'Life In A Year')
                                        ? 'R_life'
                                        : (chooseFilmFromDropdown ==
                                                'Stars Fell On Alabama')
                                            ? 'R_star'
                                            : (chooseFilmFromDropdown ==
                                                    'Avatar 2')
                                                ? 'F_avatar'
                                                : (chooseFilmFromDropdown ==
                                                        'Morbius')
                                                    ? 'F_mor'
                                                    : (chooseFilmFromDropdown ==
                                                            'Infinite 2')
                                                        ? 'F_inf'
                                                        : (chooseFilmFromDropdown ==
                                                                'No Time To Die')
                                                            ? 'AC_notime'
                                                            : (chooseFilmFromDropdown ==
                                                                    'Free Guy')
                                                                ? 'AC_free'
                                                                : (chooseFilmFromDropdown ==
                                                                        'Fast & Furious 9')
                                                                    ? 'AC_f9'
                                                                    : (chooseFilmFromDropdown ==
                                                                            'Conjuring 3')
                                                                        ? 'H_conj'
                                                                        : (chooseFilmFromDropdown ==
                                                                                'Grudge')
                                                                            ? 'H_grud'
                                                                            : '1A_raya')
        .update({
      'A1': (a1 == "Booked" || a1 == "Selected") ? "Booked" : 'available',
      'A2': (a2 == "Booked" || a2 == "Selected") ? "Booked" : 'available',
      'A3': (a3 == "Booked" || a3 == "Selected") ? "Booked" : 'available',
      'B1': (b1 == "Booked" || b1 == "Selected") ? "Booked" : 'available',
      'B2': (b2 == "Booked" || b2 == "Selected") ? "Booked" : 'available',
      'B3': (b3 == "Booked" || b3 == "Selected") ? "Booked" : 'available',
      'B4': (b4 == "Booked" || b4 == "Selected") ? "Booked" : 'available',
      'B5': (b5 == "Booked" || b5 == "Selected") ? "Booked" : 'available',
      'C1': (c1 == "Booked" || c1 == "Selected") ? "Booked" : 'available',
      'C2': (c2 == "Booked" || c2 == "Selected") ? "Booked" : 'available',
      'C3': (c3 == "Booked" || c3 == "Selected") ? "Booked" : 'available',
      'C4': (c4 == "Booked" || c4 == "Selected") ? "Booked" : 'available',
      'C5': (c5 == "Booked" || c5 == "Selected") ? "Booked" : 'available',
      'D1': (d1 == "Booked" || d1 == "Selected") ? "Booked" : 'available',
      'D2': (d2 == "Booked" || d2 == "Selected") ? "Booked" : 'available',
      'D3': (d3 == "Booked" || d3 == "Selected") ? "Booked" : 'available',
      'D4': (d4 == "Booked" || d4 == "Selected") ? "Booked" : 'available',
      'D5': (d5 == "Booked" || d5 == "Selected") ? "Booked" : 'available',
      'E1': (e1 == "Booked" || e1 == "Selected") ? "Booked" : 'available',
      'E2': (e2 == "Booked" || e2 == "Selected") ? "Booked" : 'available',
      'E3': (e3 == "Booked" || e3 == "Selected") ? "Booked" : "available",
      'E4': (e4 == "Booked" || e4 == "Selected") ? "Booked" : "available",
      'E5': (e5 == "Booked" || e5 == "Selected") ? "Booked" : "available",
    });
  }

  Stream<void> documentsAlreadyExist() async* {
    await usersTimeCollection
        .where('0-Id', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((snapshot) => {
              snapshot.docs.forEach((f) {
                setState(() {
                  docsId = f.reference.id;
                });
              })
            });
    await usersTimeCollection
        .doc('${(docsId == null) ? _dateTime : docsId}')
        .set({
      '0-User Name': (userNameAuth != null)
          ? FirebaseAuth.instance.currentUser!.displayName
          : usersCollection
              .doc(firebaseUserId)
              .get()
              .then((value) => value.get(['User Name'])),
      '0-E-Mail': FirebaseAuth.instance.currentUser!.email,
      '0-Id': FirebaseAuth.instance.currentUser!.uid,
      'A1': (a1 == 'Booked') ? "Booked" : '',
      'A2': (a2 == 'Booked') ? "Booked" : '',
      'A3': (a3 == 'Booked') ? "Booked" : '',
      'B1': (b1 == 'Booked') ? "Booked" : '',
      'B2': (b2 == 'Booked') ? "Booked" : '',
      'B3': (b3 == 'Booked') ? "Booked" : '',
      'B4': (b4 == 'Booked') ? "Booked" : '',
      'B5': (b5 == 'Booked') ? "Booked" : '',
      'C1': (c1 == 'Booked') ? "Booked" : '',
      'C2': (c2 == 'Booked') ? "Booked" : '',
      'C3': (c3 == 'Booked') ? "Booked" : '',
      'C4': (c4 == 'Booked') ? "Booked" : '',
      'C5': (c5 == 'Booked') ? "Booked" : '',
      'D1': (d1 == 'Booked') ? "Booked" : '',
      'D2': (d2 == 'Booked') ? "Booked" : '',
      'D3': (d3 == 'Booked') ? "Booked" : '',
      'D4': (d4 == 'Booked') ? "Booked" : '',
      'D5': (d5 == 'Booked') ? "Booked" : '',
      'E1': (e1 == 'Booked') ? "Booked" : '',
      'E2': (e2 == 'Booked') ? "Booked" : '',
      'E3': (e3 == 'Booked') ? "Booked" : '',
      'E4': (e4 == 'Booked') ? "Booked" : '',
      'E5': (e5 == 'Booked') ? "Booked" : '',
    });
  }

  Stream<void> userstime() async* {
    await usersTimeCollection.snapshots().forEach((element) {
      element.docs.asMap().forEach((index, data) {
        test = element.docs[index]['0-Id'];
        if (test == FirebaseAuth.instance.currentUser!.uid) {
          usersTimeCollection.doc('$docsId').get().then((onValue) {
            (onValue.exists)
                ? documentsAlreadyExist()
                : bookedUsersWithTimeDocID();
          });
        }
      });
    });
  }

  Stream<void> onTapSeatButton() async* {
    await bookedFilmName
        .doc((chooseFilmFromDropdown == 'Antlers')
            ? 'H_ant'
            : (chooseFilmFromDropdown == 'Tom & Jerry')
                ? '1A_t&m'
                : (chooseFilmFromDropdown == 'Boss Baby 2')
                    ? '1A_babyboss'
                    : (chooseFilmFromDropdown == 'Super-Intelligence')
                        ? 'C_super'
                        : (chooseFilmFromDropdown == 'Hubie Halloween')
                            ? 'C_hubie'
                            : (chooseFilmFromDropdown == 'Freaky')
                                ? 'C_freaky'
                                : (chooseFilmFromDropdown == 'All My Life')
                                    ? 'R_all'
                                    : (chooseFilmFromDropdown ==
                                            'Life In A Year')
                                        ? 'R_life'
                                        : (chooseFilmFromDropdown ==
                                                'Stars Fell On Alabama')
                                            ? 'R_star'
                                            : (chooseFilmFromDropdown ==
                                                    'Avatar 2')
                                                ? 'F_avatar'
                                                : (chooseFilmFromDropdown ==
                                                        'Morbius')
                                                    ? 'F_mor'
                                                    : (chooseFilmFromDropdown ==
                                                            'Infinite 2')
                                                        ? 'F_inf'
                                                        : (chooseFilmFromDropdown ==
                                                                'No Time To Die')
                                                            ? 'AC_notime'
                                                            : (chooseFilmFromDropdown ==
                                                                    'Free Guy')
                                                                ? 'AC_free'
                                                                : (chooseFilmFromDropdown ==
                                                                        'Fast & Furious 9')
                                                                    ? 'AC_f9'
                                                                    : (chooseFilmFromDropdown ==
                                                                            'Conjuring 3')
                                                                        ? 'H_conj'
                                                                        : (chooseFilmFromDropdown ==
                                                                                'Grudge')
                                                                            ? 'H_grud'
                                                                            : '1A_raya')
        .set({
      'A3': (a3 == "Booked") ? "Booked" : 'Selected',
      'A1': (a1 == "Booked") ? "Booked" : 'Selected',
      'A2': (a2 == "Booked") ? "Booked" : "Selected",
      'B1': (b1 == "Booked") ? "Booked" : 'Selected',
      'B2': (b2 == "Booked") ? "Booked" : 'Selected',
      'B3': (b3 == "Booked") ? "Booked" : 'Selected',
      'B4': (b4 == "Booked") ? "Booked" : 'Selected',
      'B5': (b5 == "Booked") ? "Booked" : 'Selected',
      'C1': (c1 == "Booked") ? "Booked" : 'Selected',
      'C2': (c2 == "Booked") ? "Booked" : 'Selected',
      'C3': (c3 == "Booked") ? "Booked" : 'Selected',
      'C4': (c4 == "Booked") ? "Booked" : 'Selected',
      'C5': (c5 == "Booked") ? "Booked" : 'Selected',
      'D1': (d1 == "Booked") ? "Booked" : 'Selected',
      'D2': (d2 == "Booked") ? "Booked" : 'Selected',
      'D3': (d3 == "Booked") ? "Booked" : 'Selected',
      'D4': (d4 == "Booked") ? "Booked" : 'Selected',
      'D5': (d5 == "Booked") ? "Booked" : 'Selected',
      'E1': (e1 == "Booked") ? "Booked" : 'Selected',
      'E2': (e2 == "Booked") ? "Booked" : 'Selected',
      'E3': (e3 == "Booked") ? "Booked" : 'Selected',
      'E4': (e4 == "Booked") ? "Booked" : 'Selected',
      'E5': (e5 == "Booked") ? "Booked" : 'Selected',
    });
  }

  //  <---------------------------- UI & backEnd Together------------------------------

  //  <--------------------------UI Functions -----------------------------------
  // ------------------------------------------------------------------------------------------

  Widget dropDownForFilm() {
    return DropdownButton<String>(
        icon: const Icon(Icons.arrow_drop_down),
        iconSize: 36,
        isExpanded: true,
        menuMaxHeight: 400,
        // Last addition for control the height
        hint: const Text('Selected item :'),
        value: chooseFilmFromDropdown,
        onChanged: (filmName) {
          setState(() {
            chooseFilmFromDropdown = filmName;
          });
        },
        items: filmNamesList.map((itemValue) {
          return DropdownMenuItem<String>(
              value: itemValue, child: Text(itemValue));
        }).toList());
  }

  Widget dropDownForCinema() {
    return DropdownButton<String>(
        icon: const Icon(Icons.arrow_drop_down),
        iconSize: 36,
        isExpanded: true,
        menuMaxHeight: 400,
        // Last addition for control the height
        hint: const Text('Selected Cinema :'),
        value: chooseCinemaFromDropdown,
        onChanged: (filmName) {
          setState(() {
            chooseCinemaFromDropdown = filmName;
          });
        },
        items: cinemaNamesList.map((itemValue) {
          return DropdownMenuItem<String>(
              value: itemValue, child: Text(itemValue));
        }).toList());
  }

  Widget _seats(String seatId, {clickedContainerColor}) {
    return Container(
      width: 50,
      height: 50,
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: clickedContainerColor,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          border: Border.all(
            color: Colors.black.withOpacity(0.3),
          ),
          boxShadow: const [
            BoxShadow(
                color: Colors.black, offset: Offset.infinite, blurRadius: 0.4)
          ]),
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        child: Center(
          child: Text(
            seatId,
            style: TextStyle(
                color: Colors.black.withOpacity(0.3),
                fontSize: 17,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
                shadows: [
                  Shadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 0.5,
                    offset: const Offset(0.5, 0.9),
                  )
                ]),
          ),
        ),
        onTap: () {
          switch (seatId) {
            case "A1":
              {
                bookedFilmName
                    .doc((chooseFilmFromDropdown == 'Antlers')
                        ? 'H_ant'
                        : (chooseFilmFromDropdown == 'Tom & Jerry')
                            ? '1A_t&m'
                            : (chooseFilmFromDropdown == 'Boss Baby 2')
                                ? '1A_babyboss'
                                : (chooseFilmFromDropdown ==
                                        'Super-Intelligence')
                                    ? 'C_super'
                                    : (chooseFilmFromDropdown ==
                                            'Hubie Halloween')
                                        ? 'C_hubie'
                                        : (chooseFilmFromDropdown == 'Freaky')
                                            ? 'C_freaky'
                                            : (chooseFilmFromDropdown ==
                                                    'All My Life')
                                                ? 'R_all'
                                                : (chooseFilmFromDropdown ==
                                                        'Life In A Year')
                                                    ? 'R_life'
                                                    : (chooseFilmFromDropdown ==
                                                            'Stars Fell On Alabama')
                                                        ? 'R_star'
                                                        : (chooseFilmFromDropdown ==
                                                                'Avatar 2')
                                                            ? 'F_avatar'
                                                            : (chooseFilmFromDropdown ==
                                                                    'Morbius')
                                                                ? 'F_mor'
                                                                : (chooseFilmFromDropdown ==
                                                                        'Infinite 2')
                                                                    ? 'F_inf'
                                                                    : (chooseFilmFromDropdown ==
                                                                            'No Time To Die')
                                                                        ? 'AC_notime'
                                                                        : (chooseFilmFromDropdown ==
                                                                                'Free Guy')
                                                                            ? 'AC_free'
                                                                            : (chooseFilmFromDropdown == 'Fast & Furious 9')
                                                                                ? 'AC_f9'
                                                                                : (chooseFilmFromDropdown == 'Conjuring 3')
                                                                                    ? 'H_conj'
                                                                                    : (chooseFilmFromDropdown == 'Grudge')
                                                                                        ? 'H_grud'
                                                                                        : '1A_raya')
                    .update({'A1': (a1 == 'Booked') ? 'Booked' : 'Selected'});
              }
              return;
            case "A2":
              {
                bookedFilmName
                    .doc((chooseFilmFromDropdown == 'Antlers')
                        ? 'H_ant'
                        : (chooseFilmFromDropdown == 'Tom & Jerry')
                            ? '1A_t&m'
                            : (chooseFilmFromDropdown == 'Boss Baby 2')
                                ? '1A_babyboss'
                                : (chooseFilmFromDropdown ==
                                        'Super-Intelligence')
                                    ? 'C_super'
                                    : (chooseFilmFromDropdown ==
                                            'Hubie Halloween')
                                        ? 'C_hubie'
                                        : (chooseFilmFromDropdown == 'Freaky')
                                            ? 'C_freaky'
                                            : (chooseFilmFromDropdown ==
                                                    'All My Life')
                                                ? 'R_all'
                                                : (chooseFilmFromDropdown ==
                                                        'Life In A Year')
                                                    ? 'R_life'
                                                    : (chooseFilmFromDropdown ==
                                                            'Stars Fell On Alabama')
                                                        ? 'R_star'
                                                        : (chooseFilmFromDropdown ==
                                                                'Avatar 2')
                                                            ? 'F_avatar'
                                                            : (chooseFilmFromDropdown ==
                                                                    'Morbius')
                                                                ? 'F_mor'
                                                                : (chooseFilmFromDropdown ==
                                                                        'Infinite 2')
                                                                    ? 'F_inf'
                                                                    : (chooseFilmFromDropdown ==
                                                                            'No Time To Die')
                                                                        ? 'AC_notime'
                                                                        : (chooseFilmFromDropdown ==
                                                                                'Free Guy')
                                                                            ? 'AC_free'
                                                                            : (chooseFilmFromDropdown == 'Fast & Furious 9')
                                                                                ? 'AC_f9'
                                                                                : (chooseFilmFromDropdown == 'Conjuring 3')
                                                                                    ? 'H_conj'
                                                                                    : (chooseFilmFromDropdown == 'Grudge')
                                                                                        ? 'H_grud'
                                                                                        : '1A_raya')
                    .update({'A2': (a2 == 'Booked') ? 'Booked' : 'Selected'});
              }
              return;
            case "A3":
              {
                bookedFilmName
                    .doc((chooseFilmFromDropdown == 'Antlers')
                        ? 'H_ant'
                        : (chooseFilmFromDropdown == 'Tom & Jerry')
                            ? '1A_t&m'
                            : (chooseFilmFromDropdown == 'Boss Baby 2')
                                ? '1A_babyboss'
                                : (chooseFilmFromDropdown ==
                                        'Super-Intelligence')
                                    ? 'C_super'
                                    : (chooseFilmFromDropdown ==
                                            'Hubie Halloween')
                                        ? 'C_hubie'
                                        : (chooseFilmFromDropdown == 'Freaky')
                                            ? 'C_freaky'
                                            : (chooseFilmFromDropdown ==
                                                    'All My Life')
                                                ? 'R_all'
                                                : (chooseFilmFromDropdown ==
                                                        'Life In A Year')
                                                    ? 'R_life'
                                                    : (chooseFilmFromDropdown ==
                                                            'Stars Fell On Alabama')
                                                        ? 'R_star'
                                                        : (chooseFilmFromDropdown ==
                                                                'Avatar 2')
                                                            ? 'F_avatar'
                                                            : (chooseFilmFromDropdown ==
                                                                    'Morbius')
                                                                ? 'F_mor'
                                                                : (chooseFilmFromDropdown ==
                                                                        'Infinite 2')
                                                                    ? 'F_inf'
                                                                    : (chooseFilmFromDropdown ==
                                                                            'No Time To Die')
                                                                        ? 'AC_notime'
                                                                        : (chooseFilmFromDropdown ==
                                                                                'Free Guy')
                                                                            ? 'AC_free'
                                                                            : (chooseFilmFromDropdown == 'Fast & Furious 9')
                                                                                ? 'AC_f9'
                                                                                : (chooseFilmFromDropdown == 'Conjuring 3')
                                                                                    ? 'H_conj'
                                                                                    : (chooseFilmFromDropdown == 'Grudge')
                                                                                        ? 'H_grud'
                                                                                        : '1A_raya')
                    .update({'A3': (a3 == 'Booked') ? 'Booked' : 'Selected'});
              }
              return;
            case "B1":
              {
                bookedFilmName
                    .doc((chooseFilmFromDropdown == 'Antlers')
                        ? 'H_ant'
                        : (chooseFilmFromDropdown == 'Tom & Jerry')
                            ? '1A_t&m'
                            : (chooseFilmFromDropdown == 'Boss Baby 2')
                                ? '1A_babyboss'
                                : (chooseFilmFromDropdown ==
                                        'Super-Intelligence')
                                    ? 'C_super'
                                    : (chooseFilmFromDropdown ==
                                            'Hubie Halloween')
                                        ? 'C_hubie'
                                        : (chooseFilmFromDropdown == 'Freaky')
                                            ? 'C_freaky'
                                            : (chooseFilmFromDropdown ==
                                                    'All My Life')
                                                ? 'R_all'
                                                : (chooseFilmFromDropdown ==
                                                        'Life In A Year')
                                                    ? 'R_life'
                                                    : (chooseFilmFromDropdown ==
                                                            'Stars Fell On Alabama')
                                                        ? 'R_star'
                                                        : (chooseFilmFromDropdown ==
                                                                'Avatar 2')
                                                            ? 'F_avatar'
                                                            : (chooseFilmFromDropdown ==
                                                                    'Morbius')
                                                                ? 'F_mor'
                                                                : (chooseFilmFromDropdown ==
                                                                        'Infinite 2')
                                                                    ? 'F_inf'
                                                                    : (chooseFilmFromDropdown ==
                                                                            'No Time To Die')
                                                                        ? 'AC_notime'
                                                                        : (chooseFilmFromDropdown ==
                                                                                'Free Guy')
                                                                            ? 'AC_free'
                                                                            : (chooseFilmFromDropdown == 'Fast & Furious 9')
                                                                                ? 'AC_f9'
                                                                                : (chooseFilmFromDropdown == 'Conjuring 3')
                                                                                    ? 'H_conj'
                                                                                    : (chooseFilmFromDropdown == 'Grudge')
                                                                                        ? 'H_grud'
                                                                                        : '1A_raya')
                    .update({'B1': (b1 == 'Booked') ? 'Booked' : 'Selected'});
              }
              return;
            case "B2":
              {
                bookedFilmName
                    .doc((chooseFilmFromDropdown == 'Antlers')
                        ? 'H_ant'
                        : (chooseFilmFromDropdown == 'Tom & Jerry')
                            ? '1A_t&m'
                            : (chooseFilmFromDropdown == 'Boss Baby 2')
                                ? '1A_babyboss'
                                : (chooseFilmFromDropdown ==
                                        'Super-Intelligence')
                                    ? 'C_super'
                                    : (chooseFilmFromDropdown ==
                                            'Hubie Halloween')
                                        ? 'C_hubie'
                                        : (chooseFilmFromDropdown == 'Freaky')
                                            ? 'C_freaky'
                                            : (chooseFilmFromDropdown ==
                                                    'All My Life')
                                                ? 'R_all'
                                                : (chooseFilmFromDropdown ==
                                                        'Life In A Year')
                                                    ? 'R_life'
                                                    : (chooseFilmFromDropdown ==
                                                            'Stars Fell On Alabama')
                                                        ? 'R_star'
                                                        : (chooseFilmFromDropdown ==
                                                                'Avatar 2')
                                                            ? 'F_avatar'
                                                            : (chooseFilmFromDropdown ==
                                                                    'Morbius')
                                                                ? 'F_mor'
                                                                : (chooseFilmFromDropdown ==
                                                                        'Infinite 2')
                                                                    ? 'F_inf'
                                                                    : (chooseFilmFromDropdown ==
                                                                            'No Time To Die')
                                                                        ? 'AC_notime'
                                                                        : (chooseFilmFromDropdown ==
                                                                                'Free Guy')
                                                                            ? 'AC_free'
                                                                            : (chooseFilmFromDropdown == 'Fast & Furious 9')
                                                                                ? 'AC_f9'
                                                                                : (chooseFilmFromDropdown == 'Conjuring 3')
                                                                                    ? 'H_conj'
                                                                                    : (chooseFilmFromDropdown == 'Grudge')
                                                                                        ? 'H_grud'
                                                                                        : '1A_raya')
                    .update({'B3': (b3 == 'Booked') ? 'Booked' : 'Selected'});
              }
              return;
            case "B3":
              {
                bookedFilmName
                    .doc((chooseFilmFromDropdown == 'Antlers')
                        ? 'H_ant'
                        : (chooseFilmFromDropdown == 'Tom & Jerry')
                            ? '1A_t&m'
                            : (chooseFilmFromDropdown == 'Boss Baby 2')
                                ? '1A_babyboss'
                                : (chooseFilmFromDropdown ==
                                        'Super-Intelligence')
                                    ? 'C_super'
                                    : (chooseFilmFromDropdown ==
                                            'Hubie Halloween')
                                        ? 'C_hubie'
                                        : (chooseFilmFromDropdown == 'Freaky')
                                            ? 'C_freaky'
                                            : (chooseFilmFromDropdown ==
                                                    'All My Life')
                                                ? 'R_all'
                                                : (chooseFilmFromDropdown ==
                                                        'Life In A Year')
                                                    ? 'R_life'
                                                    : (chooseFilmFromDropdown ==
                                                            'Stars Fell On Alabama')
                                                        ? 'R_star'
                                                        : (chooseFilmFromDropdown ==
                                                                'Avatar 2')
                                                            ? 'F_avatar'
                                                            : (chooseFilmFromDropdown ==
                                                                    'Morbius')
                                                                ? 'F_mor'
                                                                : (chooseFilmFromDropdown ==
                                                                        'Infinite 2')
                                                                    ? 'F_inf'
                                                                    : (chooseFilmFromDropdown ==
                                                                            'No Time To Die')
                                                                        ? 'AC_notime'
                                                                        : (chooseFilmFromDropdown ==
                                                                                'Free Guy')
                                                                            ? 'AC_free'
                                                                            : (chooseFilmFromDropdown == 'Fast & Furious 9')
                                                                                ? 'AC_f9'
                                                                                : (chooseFilmFromDropdown == 'Conjuring 3')
                                                                                    ? 'H_conj'
                                                                                    : (chooseFilmFromDropdown == 'Grudge')
                                                                                        ? 'H_grud'
                                                                                        : '1A_raya')
                    .update({'B3': (b3 == 'Booked') ? 'Booked' : 'Selected'});
              }
              return;
            case "B4":
              {
                bookedFilmName
                    .doc((chooseFilmFromDropdown == 'Antlers')
                        ? 'H_ant'
                        : (chooseFilmFromDropdown == 'Tom & Jerry')
                            ? '1A_t&m'
                            : (chooseFilmFromDropdown == 'Boss Baby 2')
                                ? '1A_babyboss'
                                : (chooseFilmFromDropdown ==
                                        'Super-Intelligence')
                                    ? 'C_super'
                                    : (chooseFilmFromDropdown ==
                                            'Hubie Halloween')
                                        ? 'C_hubie'
                                        : (chooseFilmFromDropdown == 'Freaky')
                                            ? 'C_freaky'
                                            : (chooseFilmFromDropdown ==
                                                    'All My Life')
                                                ? 'R_all'
                                                : (chooseFilmFromDropdown ==
                                                        'Life In A Year')
                                                    ? 'R_life'
                                                    : (chooseFilmFromDropdown ==
                                                            'Stars Fell On Alabama')
                                                        ? 'R_star'
                                                        : (chooseFilmFromDropdown ==
                                                                'Avatar 2')
                                                            ? 'F_avatar'
                                                            : (chooseFilmFromDropdown ==
                                                                    'Morbius')
                                                                ? 'F_mor'
                                                                : (chooseFilmFromDropdown ==
                                                                        'Infinite 2')
                                                                    ? 'F_inf'
                                                                    : (chooseFilmFromDropdown ==
                                                                            'No Time To Die')
                                                                        ? 'AC_notime'
                                                                        : (chooseFilmFromDropdown ==
                                                                                'Free Guy')
                                                                            ? 'AC_free'
                                                                            : (chooseFilmFromDropdown == 'Fast & Furious 9')
                                                                                ? 'AC_f9'
                                                                                : (chooseFilmFromDropdown == 'Conjuring 3')
                                                                                    ? 'H_conj'
                                                                                    : (chooseFilmFromDropdown == 'Grudge')
                                                                                        ? 'H_grud'
                                                                                        : '1A_raya')
                    .update({'B4': (b4 == 'Booked') ? 'Booked' : 'Selected'});
              }
              return;
            case "B5":
              {
                bookedFilmName
                    .doc((chooseFilmFromDropdown == 'Antlers')
                        ? 'H_ant'
                        : (chooseFilmFromDropdown == 'Tom & Jerry')
                            ? '1A_t&m'
                            : (chooseFilmFromDropdown == 'Boss Baby 2')
                                ? '1A_babyboss'
                                : (chooseFilmFromDropdown ==
                                        'Super-Intelligence')
                                    ? 'C_super'
                                    : (chooseFilmFromDropdown ==
                                            'Hubie Halloween')
                                        ? 'C_hubie'
                                        : (chooseFilmFromDropdown == 'Freaky')
                                            ? 'C_freaky'
                                            : (chooseFilmFromDropdown ==
                                                    'All My Life')
                                                ? 'R_all'
                                                : (chooseFilmFromDropdown ==
                                                        'Life In A Year')
                                                    ? 'R_life'
                                                    : (chooseFilmFromDropdown ==
                                                            'Stars Fell On Alabama')
                                                        ? 'R_star'
                                                        : (chooseFilmFromDropdown ==
                                                                'Avatar 2')
                                                            ? 'F_avatar'
                                                            : (chooseFilmFromDropdown ==
                                                                    'Morbius')
                                                                ? 'F_mor'
                                                                : (chooseFilmFromDropdown ==
                                                                        'Infinite 2')
                                                                    ? 'F_inf'
                                                                    : (chooseFilmFromDropdown ==
                                                                            'No Time To Die')
                                                                        ? 'AC_notime'
                                                                        : (chooseFilmFromDropdown ==
                                                                                'Free Guy')
                                                                            ? 'AC_free'
                                                                            : (chooseFilmFromDropdown == 'Fast & Furious 9')
                                                                                ? 'AC_f9'
                                                                                : (chooseFilmFromDropdown == 'Conjuring 3')
                                                                                    ? 'H_conj'
                                                                                    : (chooseFilmFromDropdown == 'Grudge')
                                                                                        ? 'H_grud'
                                                                                        : '1A_raya')
                    .update({'B5': (b5 == 'Booked') ? 'Booked' : 'Selected'});
              }
              return;
            case "C1":
              {
                bookedFilmName
                    .doc((chooseFilmFromDropdown == 'Antlers')
                        ? 'H_ant'
                        : (chooseFilmFromDropdown == 'Tom & Jerry')
                            ? '1A_t&m'
                            : (chooseFilmFromDropdown == 'Boss Baby 2')
                                ? '1A_babyboss'
                                : (chooseFilmFromDropdown ==
                                        'Super-Intelligence')
                                    ? 'C_super'
                                    : (chooseFilmFromDropdown ==
                                            'Hubie Halloween')
                                        ? 'C_hubie'
                                        : (chooseFilmFromDropdown == 'Freaky')
                                            ? 'C_freaky'
                                            : (chooseFilmFromDropdown ==
                                                    'All My Life')
                                                ? 'R_all'
                                                : (chooseFilmFromDropdown ==
                                                        'Life In A Year')
                                                    ? 'R_life'
                                                    : (chooseFilmFromDropdown ==
                                                            'Stars Fell On Alabama')
                                                        ? 'R_star'
                                                        : (chooseFilmFromDropdown ==
                                                                'Avatar 2')
                                                            ? 'F_avatar'
                                                            : (chooseFilmFromDropdown ==
                                                                    'Morbius')
                                                                ? 'F_mor'
                                                                : (chooseFilmFromDropdown ==
                                                                        'Infinite 2')
                                                                    ? 'F_inf'
                                                                    : (chooseFilmFromDropdown ==
                                                                            'No Time To Die')
                                                                        ? 'AC_notime'
                                                                        : (chooseFilmFromDropdown ==
                                                                                'Free Guy')
                                                                            ? 'AC_free'
                                                                            : (chooseFilmFromDropdown == 'Fast & Furious 9')
                                                                                ? 'AC_f9'
                                                                                : (chooseFilmFromDropdown == 'Conjuring 3')
                                                                                    ? 'H_conj'
                                                                                    : (chooseFilmFromDropdown == 'Grudge')
                                                                                        ? 'H_grud'
                                                                                        : '1A_raya')
                    .update({'C1': (c1 == 'Booked') ? 'Booked' : 'Selected'});
              }
              return;
            case "C2":
              {
                bookedFilmName
                    .doc((chooseFilmFromDropdown == 'Antlers')
                        ? 'H_ant'
                        : (chooseFilmFromDropdown == 'Tom & Jerry')
                            ? '1A_t&m'
                            : (chooseFilmFromDropdown == 'Boss Baby 2')
                                ? '1A_babyboss'
                                : (chooseFilmFromDropdown ==
                                        'Super-Intelligence')
                                    ? 'C_super'
                                    : (chooseFilmFromDropdown ==
                                            'Hubie Halloween')
                                        ? 'C_hubie'
                                        : (chooseFilmFromDropdown == 'Freaky')
                                            ? 'C_freaky'
                                            : (chooseFilmFromDropdown ==
                                                    'All My Life')
                                                ? 'R_all'
                                                : (chooseFilmFromDropdown ==
                                                        'Life In A Year')
                                                    ? 'R_life'
                                                    : (chooseFilmFromDropdown ==
                                                            'Stars Fell On Alabama')
                                                        ? 'R_star'
                                                        : (chooseFilmFromDropdown ==
                                                                'Avatar 2')
                                                            ? 'F_avatar'
                                                            : (chooseFilmFromDropdown ==
                                                                    'Morbius')
                                                                ? 'F_mor'
                                                                : (chooseFilmFromDropdown ==
                                                                        'Infinite 2')
                                                                    ? 'F_inf'
                                                                    : (chooseFilmFromDropdown ==
                                                                            'No Time To Die')
                                                                        ? 'AC_notime'
                                                                        : (chooseFilmFromDropdown ==
                                                                                'Free Guy')
                                                                            ? 'AC_free'
                                                                            : (chooseFilmFromDropdown == 'Fast & Furious 9')
                                                                                ? 'AC_f9'
                                                                                : (chooseFilmFromDropdown == 'Conjuring 3')
                                                                                    ? 'H_conj'
                                                                                    : (chooseFilmFromDropdown == 'Grudge')
                                                                                        ? 'H_grud'
                                                                                        : '1A_raya')
                    .update({'C2': (c2 == 'Booked') ? 'Booked' : 'Selected'});
              }
              return;
            case "C3":
              {
                bookedFilmName
                    .doc((chooseFilmFromDropdown == 'Antlers')
                        ? 'H_ant'
                        : (chooseFilmFromDropdown == 'Tom & Jerry')
                            ? '1A_t&m'
                            : (chooseFilmFromDropdown == 'Boss Baby 2')
                                ? '1A_babyboss'
                                : (chooseFilmFromDropdown ==
                                        'Super-Intelligence')
                                    ? 'C_super'
                                    : (chooseFilmFromDropdown ==
                                            'Hubie Halloween')
                                        ? 'C_hubie'
                                        : (chooseFilmFromDropdown == 'Freaky')
                                            ? 'C_freaky'
                                            : (chooseFilmFromDropdown ==
                                                    'All My Life')
                                                ? 'R_all'
                                                : (chooseFilmFromDropdown ==
                                                        'Life In A Year')
                                                    ? 'R_life'
                                                    : (chooseFilmFromDropdown ==
                                                            'Stars Fell On Alabama')
                                                        ? 'R_star'
                                                        : (chooseFilmFromDropdown ==
                                                                'Avatar 2')
                                                            ? 'F_avatar'
                                                            : (chooseFilmFromDropdown ==
                                                                    'Morbius')
                                                                ? 'F_mor'
                                                                : (chooseFilmFromDropdown ==
                                                                        'Infinite 2')
                                                                    ? 'F_inf'
                                                                    : (chooseFilmFromDropdown ==
                                                                            'No Time To Die')
                                                                        ? 'AC_notime'
                                                                        : (chooseFilmFromDropdown ==
                                                                                'Free Guy')
                                                                            ? 'AC_free'
                                                                            : (chooseFilmFromDropdown == 'Fast & Furious 9')
                                                                                ? 'AC_f9'
                                                                                : (chooseFilmFromDropdown == 'Conjuring 3')
                                                                                    ? 'H_conj'
                                                                                    : (chooseFilmFromDropdown == 'Grudge')
                                                                                        ? 'H_grud'
                                                                                        : '1A_raya')
                    .update({'C3': (c3 == 'Booked') ? 'Booked' : 'Selected'});
              }
              return;
            case "C4":
              {
                bookedFilmName
                    .doc((chooseFilmFromDropdown == 'Antlers')
                        ? 'H_ant'
                        : (chooseFilmFromDropdown == 'Tom & Jerry')
                            ? '1A_t&m'
                            : (chooseFilmFromDropdown == 'Boss Baby 2')
                                ? '1A_babyboss'
                                : (chooseFilmFromDropdown ==
                                        'Super-Intelligence')
                                    ? 'C_super'
                                    : (chooseFilmFromDropdown ==
                                            'Hubie Halloween')
                                        ? 'C_hubie'
                                        : (chooseFilmFromDropdown == 'Freaky')
                                            ? 'C_freaky'
                                            : (chooseFilmFromDropdown ==
                                                    'All My Life')
                                                ? 'R_all'
                                                : (chooseFilmFromDropdown ==
                                                        'Life In A Year')
                                                    ? 'R_life'
                                                    : (chooseFilmFromDropdown ==
                                                            'Stars Fell On Alabama')
                                                        ? 'R_star'
                                                        : (chooseFilmFromDropdown ==
                                                                'Avatar 2')
                                                            ? 'F_avatar'
                                                            : (chooseFilmFromDropdown ==
                                                                    'Morbius')
                                                                ? 'F_mor'
                                                                : (chooseFilmFromDropdown ==
                                                                        'Infinite 2')
                                                                    ? 'F_inf'
                                                                    : (chooseFilmFromDropdown ==
                                                                            'No Time To Die')
                                                                        ? 'AC_notime'
                                                                        : (chooseFilmFromDropdown ==
                                                                                'Free Guy')
                                                                            ? 'AC_free'
                                                                            : (chooseFilmFromDropdown == 'Fast & Furious 9')
                                                                                ? 'AC_f9'
                                                                                : (chooseFilmFromDropdown == 'Conjuring 3')
                                                                                    ? 'H_conj'
                                                                                    : (chooseFilmFromDropdown == 'Grudge')
                                                                                        ? 'H_grud'
                                                                                        : '1A_raya')
                    .update({'C4': (c4 == 'Booked') ? 'Booked' : 'Selected'});
              }
              return;
            case "C5":
              {
                bookedFilmName
                    .doc((chooseFilmFromDropdown == 'Antlers')
                        ? 'H_ant'
                        : (chooseFilmFromDropdown == 'Tom & Jerry')
                            ? '1A_t&m'
                            : (chooseFilmFromDropdown == 'Boss Baby 2')
                                ? '1A_babyboss'
                                : (chooseFilmFromDropdown ==
                                        'Super-Intelligence')
                                    ? 'C_super'
                                    : (chooseFilmFromDropdown ==
                                            'Hubie Halloween')
                                        ? 'C_hubie'
                                        : (chooseFilmFromDropdown == 'Freaky')
                                            ? 'C_freaky'
                                            : (chooseFilmFromDropdown ==
                                                    'All My Life')
                                                ? 'R_all'
                                                : (chooseFilmFromDropdown ==
                                                        'Life In A Year')
                                                    ? 'R_life'
                                                    : (chooseFilmFromDropdown ==
                                                            'Stars Fell On Alabama')
                                                        ? 'R_star'
                                                        : (chooseFilmFromDropdown ==
                                                                'Avatar 2')
                                                            ? 'F_avatar'
                                                            : (chooseFilmFromDropdown ==
                                                                    'Morbius')
                                                                ? 'F_mor'
                                                                : (chooseFilmFromDropdown ==
                                                                        'Infinite 2')
                                                                    ? 'F_inf'
                                                                    : (chooseFilmFromDropdown ==
                                                                            'No Time To Die')
                                                                        ? 'AC_notime'
                                                                        : (chooseFilmFromDropdown ==
                                                                                'Free Guy')
                                                                            ? 'AC_free'
                                                                            : (chooseFilmFromDropdown == 'Fast & Furious 9')
                                                                                ? 'AC_f9'
                                                                                : (chooseFilmFromDropdown == 'Conjuring 3')
                                                                                    ? 'H_conj'
                                                                                    : (chooseFilmFromDropdown == 'Grudge')
                                                                                        ? 'H_grud'
                                                                                        : '1A_raya')
                    .update({'C5': (c5 == 'Booked') ? 'Booked' : 'Selected'});
              }
              return;
            case "D1":
              {
                bookedFilmName
                    .doc((chooseFilmFromDropdown == 'Antlers')
                        ? 'H_ant'
                        : (chooseFilmFromDropdown == 'Tom & Jerry')
                            ? '1A_t&m'
                            : (chooseFilmFromDropdown == 'Boss Baby 2')
                                ? '1A_babyboss'
                                : (chooseFilmFromDropdown ==
                                        'Super-Intelligence')
                                    ? 'C_super'
                                    : (chooseFilmFromDropdown ==
                                            'Hubie Halloween')
                                        ? 'C_hubie'
                                        : (chooseFilmFromDropdown == 'Freaky')
                                            ? 'C_freaky'
                                            : (chooseFilmFromDropdown ==
                                                    'All My Life')
                                                ? 'R_all'
                                                : (chooseFilmFromDropdown ==
                                                        'Life In A Year')
                                                    ? 'R_life'
                                                    : (chooseFilmFromDropdown ==
                                                            'Stars Fell On Alabama')
                                                        ? 'R_star'
                                                        : (chooseFilmFromDropdown ==
                                                                'Avatar 2')
                                                            ? 'F_avatar'
                                                            : (chooseFilmFromDropdown ==
                                                                    'Morbius')
                                                                ? 'F_mor'
                                                                : (chooseFilmFromDropdown ==
                                                                        'Infinite 2')
                                                                    ? 'F_inf'
                                                                    : (chooseFilmFromDropdown ==
                                                                            'No Time To Die')
                                                                        ? 'AC_notime'
                                                                        : (chooseFilmFromDropdown ==
                                                                                'Free Guy')
                                                                            ? 'AC_free'
                                                                            : (chooseFilmFromDropdown == 'Fast & Furious 9')
                                                                                ? 'AC_f9'
                                                                                : (chooseFilmFromDropdown == 'Conjuring 3')
                                                                                    ? 'H_conj'
                                                                                    : (chooseFilmFromDropdown == 'Grudge')
                                                                                        ? 'H_grud'
                                                                                        : '1A_raya')
                    .update({'D1': (d1 == 'Booked') ? 'Booked' : 'Selected'});
              }
              return;
            case "D2":
              {
                bookedFilmName
                    .doc((chooseFilmFromDropdown == 'Antlers')
                        ? 'H_ant'
                        : (chooseFilmFromDropdown == 'Tom & Jerry')
                            ? '1A_t&m'
                            : (chooseFilmFromDropdown == 'Boss Baby 2')
                                ? '1A_babyboss'
                                : (chooseFilmFromDropdown ==
                                        'Super-Intelligence')
                                    ? 'C_super'
                                    : (chooseFilmFromDropdown ==
                                            'Hubie Halloween')
                                        ? 'C_hubie'
                                        : (chooseFilmFromDropdown == 'Freaky')
                                            ? 'C_freaky'
                                            : (chooseFilmFromDropdown ==
                                                    'All My Life')
                                                ? 'R_all'
                                                : (chooseFilmFromDropdown ==
                                                        'Life In A Year')
                                                    ? 'R_life'
                                                    : (chooseFilmFromDropdown ==
                                                            'Stars Fell On Alabama')
                                                        ? 'R_star'
                                                        : (chooseFilmFromDropdown ==
                                                                'Avatar 2')
                                                            ? 'F_avatar'
                                                            : (chooseFilmFromDropdown ==
                                                                    'Morbius')
                                                                ? 'F_mor'
                                                                : (chooseFilmFromDropdown ==
                                                                        'Infinite 2')
                                                                    ? 'F_inf'
                                                                    : (chooseFilmFromDropdown ==
                                                                            'No Time To Die')
                                                                        ? 'AC_notime'
                                                                        : (chooseFilmFromDropdown ==
                                                                                'Free Guy')
                                                                            ? 'AC_free'
                                                                            : (chooseFilmFromDropdown == 'Fast & Furious 9')
                                                                                ? 'AC_f9'
                                                                                : (chooseFilmFromDropdown == 'Conjuring 3')
                                                                                    ? 'H_conj'
                                                                                    : (chooseFilmFromDropdown == 'Grudge')
                                                                                        ? 'H_grud'
                                                                                        : '1A_raya')
                    .update({'D2': (d2 == 'Booked') ? 'Booked' : 'Selected'});
              }
              return;
            case "D3":
              {
                bookedFilmName
                    .doc((chooseFilmFromDropdown == 'Antlers')
                        ? 'H_ant'
                        : (chooseFilmFromDropdown == 'Tom & Jerry')
                            ? '1A_t&m'
                            : (chooseFilmFromDropdown == 'Boss Baby 2')
                                ? '1A_babyboss'
                                : (chooseFilmFromDropdown ==
                                        'Super-Intelligence')
                                    ? 'C_super'
                                    : (chooseFilmFromDropdown ==
                                            'Hubie Halloween')
                                        ? 'C_hubie'
                                        : (chooseFilmFromDropdown == 'Freaky')
                                            ? 'C_freaky'
                                            : (chooseFilmFromDropdown ==
                                                    'All My Life')
                                                ? 'R_all'
                                                : (chooseFilmFromDropdown ==
                                                        'Life In A Year')
                                                    ? 'R_life'
                                                    : (chooseFilmFromDropdown ==
                                                            'Stars Fell On Alabama')
                                                        ? 'R_star'
                                                        : (chooseFilmFromDropdown ==
                                                                'Avatar 2')
                                                            ? 'F_avatar'
                                                            : (chooseFilmFromDropdown ==
                                                                    'Morbius')
                                                                ? 'F_mor'
                                                                : (chooseFilmFromDropdown ==
                                                                        'Infinite 2')
                                                                    ? 'F_inf'
                                                                    : (chooseFilmFromDropdown ==
                                                                            'No Time To Die')
                                                                        ? 'AC_notime'
                                                                        : (chooseFilmFromDropdown ==
                                                                                'Free Guy')
                                                                            ? 'AC_free'
                                                                            : (chooseFilmFromDropdown == 'Fast & Furious 9')
                                                                                ? 'AC_f9'
                                                                                : (chooseFilmFromDropdown == 'Conjuring 3')
                                                                                    ? 'H_conj'
                                                                                    : (chooseFilmFromDropdown == 'Grudge')
                                                                                        ? 'H_grud'
                                                                                        : '1A_raya')
                    .update({'D3': (d3 == 'Booked') ? 'Booked' : 'Selected'});
              }
              return;
            case "D4":
              {
                bookedFilmName
                    .doc((chooseFilmFromDropdown == 'Antlers')
                        ? 'H_ant'
                        : (chooseFilmFromDropdown == 'Tom & Jerry')
                            ? '1A_t&m'
                            : (chooseFilmFromDropdown == 'Boss Baby 2')
                                ? '1A_babyboss'
                                : (chooseFilmFromDropdown ==
                                        'Super-Intelligence')
                                    ? 'C_super'
                                    : (chooseFilmFromDropdown ==
                                            'Hubie Halloween')
                                        ? 'C_hubie'
                                        : (chooseFilmFromDropdown == 'Freaky')
                                            ? 'C_freaky'
                                            : (chooseFilmFromDropdown ==
                                                    'All My Life')
                                                ? 'R_all'
                                                : (chooseFilmFromDropdown ==
                                                        'Life In A Year')
                                                    ? 'R_life'
                                                    : (chooseFilmFromDropdown ==
                                                            'Stars Fell On Alabama')
                                                        ? 'R_star'
                                                        : (chooseFilmFromDropdown ==
                                                                'Avatar 2')
                                                            ? 'F_avatar'
                                                            : (chooseFilmFromDropdown ==
                                                                    'Morbius')
                                                                ? 'F_mor'
                                                                : (chooseFilmFromDropdown ==
                                                                        'Infinite 2')
                                                                    ? 'F_inf'
                                                                    : (chooseFilmFromDropdown ==
                                                                            'No Time To Die')
                                                                        ? 'AC_notime'
                                                                        : (chooseFilmFromDropdown ==
                                                                                'Free Guy')
                                                                            ? 'AC_free'
                                                                            : (chooseFilmFromDropdown == 'Fast & Furious 9')
                                                                                ? 'AC_f9'
                                                                                : (chooseFilmFromDropdown == 'Conjuring 3')
                                                                                    ? 'H_conj'
                                                                                    : (chooseFilmFromDropdown == 'Grudge')
                                                                                        ? 'H_grud'
                                                                                        : '1A_raya')
                    .update({'D4': (d4 == 'Booked') ? 'Booked' : 'Selected'});
              }
              return;
            case "D5":
              {
                bookedFilmName
                    .doc((chooseFilmFromDropdown == 'Antlers')
                        ? 'H_ant'
                        : (chooseFilmFromDropdown == 'Tom & Jerry')
                            ? '1A_t&m'
                            : (chooseFilmFromDropdown == 'Boss Baby 2')
                                ? '1A_babyboss'
                                : (chooseFilmFromDropdown ==
                                        'Super-Intelligence')
                                    ? 'C_super'
                                    : (chooseFilmFromDropdown ==
                                            'Hubie Halloween')
                                        ? 'C_hubie'
                                        : (chooseFilmFromDropdown == 'Freaky')
                                            ? 'C_freaky'
                                            : (chooseFilmFromDropdown ==
                                                    'All My Life')
                                                ? 'R_all'
                                                : (chooseFilmFromDropdown ==
                                                        'Life In A Year')
                                                    ? 'R_life'
                                                    : (chooseFilmFromDropdown ==
                                                            'Stars Fell On Alabama')
                                                        ? 'R_star'
                                                        : (chooseFilmFromDropdown ==
                                                                'Avatar 2')
                                                            ? 'F_avatar'
                                                            : (chooseFilmFromDropdown ==
                                                                    'Morbius')
                                                                ? 'F_mor'
                                                                : (chooseFilmFromDropdown ==
                                                                        'Infinite 2')
                                                                    ? 'F_inf'
                                                                    : (chooseFilmFromDropdown ==
                                                                            'No Time To Die')
                                                                        ? 'AC_notime'
                                                                        : (chooseFilmFromDropdown ==
                                                                                'Free Guy')
                                                                            ? 'AC_free'
                                                                            : (chooseFilmFromDropdown == 'Fast & Furious 9')
                                                                                ? 'AC_f9'
                                                                                : (chooseFilmFromDropdown == 'Conjuring 3')
                                                                                    ? 'H_conj'
                                                                                    : (chooseFilmFromDropdown == 'Grudge')
                                                                                        ? 'H_grud'
                                                                                        : '1A_raya')
                    .update({'D5': (d5 == 'Booked') ? 'Booked' : 'Selected'});
              }
              return;
            case "E1":
              {
                bookedFilmName
                    .doc((chooseFilmFromDropdown == 'Antlers')
                        ? 'H_ant'
                        : (chooseFilmFromDropdown == 'Tom & Jerry')
                            ? '1A_t&m'
                            : (chooseFilmFromDropdown == 'Boss Baby 2')
                                ? '1A_babyboss'
                                : (chooseFilmFromDropdown ==
                                        'Super-Intelligence')
                                    ? 'C_super'
                                    : (chooseFilmFromDropdown ==
                                            'Hubie Halloween')
                                        ? 'C_hubie'
                                        : (chooseFilmFromDropdown == 'Freaky')
                                            ? 'C_freaky'
                                            : (chooseFilmFromDropdown ==
                                                    'All My Life')
                                                ? 'R_all'
                                                : (chooseFilmFromDropdown ==
                                                        'Life In A Year')
                                                    ? 'R_life'
                                                    : (chooseFilmFromDropdown ==
                                                            'Stars Fell On Alabama')
                                                        ? 'R_star'
                                                        : (chooseFilmFromDropdown ==
                                                                'Avatar 2')
                                                            ? 'F_avatar'
                                                            : (chooseFilmFromDropdown ==
                                                                    'Morbius')
                                                                ? 'F_mor'
                                                                : (chooseFilmFromDropdown ==
                                                                        'Infinite 2')
                                                                    ? 'F_inf'
                                                                    : (chooseFilmFromDropdown ==
                                                                            'No Time To Die')
                                                                        ? 'AC_notime'
                                                                        : (chooseFilmFromDropdown ==
                                                                                'Free Guy')
                                                                            ? 'AC_free'
                                                                            : (chooseFilmFromDropdown == 'Fast & Furious 9')
                                                                                ? 'AC_f9'
                                                                                : (chooseFilmFromDropdown == 'Conjuring 3')
                                                                                    ? 'H_conj'
                                                                                    : (chooseFilmFromDropdown == 'Grudge')
                                                                                        ? 'H_grud'
                                                                                        : '1A_raya')
                    .update({'E1': (e1 == 'Booked') ? 'Booked' : 'Selected'});
              }
              return;
            case "E2":
              {
                bookedFilmName
                    .doc((chooseFilmFromDropdown == 'Antlers')
                        ? 'H_ant'
                        : (chooseFilmFromDropdown == 'Tom & Jerry')
                            ? '1A_t&m'
                            : (chooseFilmFromDropdown == 'Boss Baby 2')
                                ? '1A_babyboss'
                                : (chooseFilmFromDropdown ==
                                        'Super-Intelligence')
                                    ? 'C_super'
                                    : (chooseFilmFromDropdown ==
                                            'Hubie Halloween')
                                        ? 'C_hubie'
                                        : (chooseFilmFromDropdown == 'Freaky')
                                            ? 'C_freaky'
                                            : (chooseFilmFromDropdown ==
                                                    'All My Life')
                                                ? 'R_all'
                                                : (chooseFilmFromDropdown ==
                                                        'Life In A Year')
                                                    ? 'R_life'
                                                    : (chooseFilmFromDropdown ==
                                                            'Stars Fell On Alabama')
                                                        ? 'R_star'
                                                        : (chooseFilmFromDropdown ==
                                                                'Avatar 2')
                                                            ? 'F_avatar'
                                                            : (chooseFilmFromDropdown ==
                                                                    'Morbius')
                                                                ? 'F_mor'
                                                                : (chooseFilmFromDropdown ==
                                                                        'Infinite 2')
                                                                    ? 'F_inf'
                                                                    : (chooseFilmFromDropdown ==
                                                                            'No Time To Die')
                                                                        ? 'AC_notime'
                                                                        : (chooseFilmFromDropdown ==
                                                                                'Free Guy')
                                                                            ? 'AC_free'
                                                                            : (chooseFilmFromDropdown == 'Fast & Furious 9')
                                                                                ? 'AC_f9'
                                                                                : (chooseFilmFromDropdown == 'Conjuring 3')
                                                                                    ? 'H_conj'
                                                                                    : (chooseFilmFromDropdown == 'Grudge')
                                                                                        ? 'H_grud'
                                                                                        : '1A_raya')
                    .update({'E2': (e2 == 'Booked') ? 'Booked' : 'Selected'});
              }
              return;
            case "E3":
              {
                bookedFilmName
                    .doc((chooseFilmFromDropdown == 'Antlers')
                        ? 'H_ant'
                        : (chooseFilmFromDropdown == 'Tom & Jerry')
                            ? '1A_t&m'
                            : (chooseFilmFromDropdown == 'Boss Baby 2')
                                ? '1A_babyboss'
                                : (chooseFilmFromDropdown ==
                                        'Super-Intelligence')
                                    ? 'C_super'
                                    : (chooseFilmFromDropdown ==
                                            'Hubie Halloween')
                                        ? 'C_hubie'
                                        : (chooseFilmFromDropdown == 'Freaky')
                                            ? 'C_freaky'
                                            : (chooseFilmFromDropdown ==
                                                    'All My Life')
                                                ? 'R_all'
                                                : (chooseFilmFromDropdown ==
                                                        'Life In A Year')
                                                    ? 'R_life'
                                                    : (chooseFilmFromDropdown ==
                                                            'Stars Fell On Alabama')
                                                        ? 'R_star'
                                                        : (chooseFilmFromDropdown ==
                                                                'Avatar 2')
                                                            ? 'F_avatar'
                                                            : (chooseFilmFromDropdown ==
                                                                    'Morbius')
                                                                ? 'F_mor'
                                                                : (chooseFilmFromDropdown ==
                                                                        'Infinite 2')
                                                                    ? 'F_inf'
                                                                    : (chooseFilmFromDropdown ==
                                                                            'No Time To Die')
                                                                        ? 'AC_notime'
                                                                        : (chooseFilmFromDropdown ==
                                                                                'Free Guy')
                                                                            ? 'AC_free'
                                                                            : (chooseFilmFromDropdown == 'Fast & Furious 9')
                                                                                ? 'AC_f9'
                                                                                : (chooseFilmFromDropdown == 'Conjuring 3')
                                                                                    ? 'H_conj'
                                                                                    : (chooseFilmFromDropdown == 'Grudge')
                                                                                        ? 'H_grud'
                                                                                        : '1A_raya')
                    .update({'E3': (e3 == 'Booked') ? 'Booked' : 'Selected'});
              }
              return;
            case "E4":
              {
                bookedFilmName
                    .doc((chooseFilmFromDropdown == 'Antlers')
                        ? 'H_ant'
                        : (chooseFilmFromDropdown == 'Tom & Jerry')
                            ? '1A_t&m'
                            : (chooseFilmFromDropdown == 'Boss Baby 2')
                                ? '1A_babyboss'
                                : (chooseFilmFromDropdown ==
                                        'Super-Intelligence')
                                    ? 'C_super'
                                    : (chooseFilmFromDropdown ==
                                            'Hubie Halloween')
                                        ? 'C_hubie'
                                        : (chooseFilmFromDropdown == 'Freaky')
                                            ? 'C_freaky'
                                            : (chooseFilmFromDropdown ==
                                                    'All My Life')
                                                ? 'R_all'
                                                : (chooseFilmFromDropdown ==
                                                        'Life In A Year')
                                                    ? 'R_life'
                                                    : (chooseFilmFromDropdown ==
                                                            'Stars Fell On Alabama')
                                                        ? 'R_star'
                                                        : (chooseFilmFromDropdown ==
                                                                'Avatar 2')
                                                            ? 'F_avatar'
                                                            : (chooseFilmFromDropdown ==
                                                                    'Morbius')
                                                                ? 'F_mor'
                                                                : (chooseFilmFromDropdown ==
                                                                        'Infinite 2')
                                                                    ? 'F_inf'
                                                                    : (chooseFilmFromDropdown ==
                                                                            'No Time To Die')
                                                                        ? 'AC_notime'
                                                                        : (chooseFilmFromDropdown ==
                                                                                'Free Guy')
                                                                            ? 'AC_free'
                                                                            : (chooseFilmFromDropdown == 'Fast & Furious 9')
                                                                                ? 'AC_f9'
                                                                                : (chooseFilmFromDropdown == 'Conjuring 3')
                                                                                    ? 'H_conj'
                                                                                    : (chooseFilmFromDropdown == 'Grudge')
                                                                                        ? 'H_grud'
                                                                                        : '1A_raya')
                    .update({'E4': (e4 == 'Booked') ? 'Booked' : 'Selected'});
              }
              return;
            case "E5":
              {
                bookedFilmName
                    .doc((chooseFilmFromDropdown == 'Antlers')
                        ? 'H_ant'
                        : (chooseFilmFromDropdown == 'Tom & Jerry')
                            ? '1A_t&m'
                            : (chooseFilmFromDropdown == 'Boss Baby 2')
                                ? '1A_babyboss'
                                : (chooseFilmFromDropdown ==
                                        'Super-Intelligence')
                                    ? 'C_super'
                                    : (chooseFilmFromDropdown ==
                                            'Hubie Halloween')
                                        ? 'C_hubie'
                                        : (chooseFilmFromDropdown == 'Freaky')
                                            ? 'C_freaky'
                                            : (chooseFilmFromDropdown ==
                                                    'All My Life')
                                                ? 'R_all'
                                                : (chooseFilmFromDropdown ==
                                                        'Life In A Year')
                                                    ? 'R_life'
                                                    : (chooseFilmFromDropdown ==
                                                            'Stars Fell On Alabama')
                                                        ? 'R_star'
                                                        : (chooseFilmFromDropdown ==
                                                                'Avatar 2')
                                                            ? 'F_avatar'
                                                            : (chooseFilmFromDropdown ==
                                                                    'Morbius')
                                                                ? 'F_mor'
                                                                : (chooseFilmFromDropdown ==
                                                                        'Infinite 2')
                                                                    ? 'F_inf'
                                                                    : (chooseFilmFromDropdown ==
                                                                            'No Time To Die')
                                                                        ? 'AC_notime'
                                                                        : (chooseFilmFromDropdown ==
                                                                                'Free Guy')
                                                                            ? 'AC_free'
                                                                            : (chooseFilmFromDropdown == 'Fast & Furious 9')
                                                                                ? 'AC_f9'
                                                                                : (chooseFilmFromDropdown == 'Conjuring 3')
                                                                                    ? 'H_conj'
                                                                                    : (chooseFilmFromDropdown == 'Grudge')
                                                                                        ? 'H_grud'
                                                                                        : '1A_raya')
                    .update({'E5': (e5 == 'Booked') ? 'Booked' : 'Selected'});
              }
              return;
          }
        },
        onDoubleTap: () {
          switch (seatId) {
            case "A1":
              {
                bookedFilmName
                    .doc((chooseFilmFromDropdown == 'Antlers')
                        ? 'H_ant'
                        : (chooseFilmFromDropdown == 'Tom & Jerry')
                            ? '1A_t&m'
                            : (chooseFilmFromDropdown == 'Boss Baby 2')
                                ? '1A_babyboss'
                                : (chooseFilmFromDropdown ==
                                        'Super-Intelligence')
                                    ? 'C_super'
                                    : (chooseFilmFromDropdown ==
                                            'Hubie Halloween')
                                        ? 'C_hubie'
                                        : (chooseFilmFromDropdown == 'Freaky')
                                            ? 'C_freaky'
                                            : (chooseFilmFromDropdown ==
                                                    'All My Life')
                                                ? 'R_all'
                                                : (chooseFilmFromDropdown ==
                                                        'Life In A Year')
                                                    ? 'R_life'
                                                    : (chooseFilmFromDropdown ==
                                                            'Stars Fell On Alabama')
                                                        ? 'R_star'
                                                        : (chooseFilmFromDropdown ==
                                                                'Avatar 2')
                                                            ? 'F_avatar'
                                                            : (chooseFilmFromDropdown ==
                                                                    'Morbius')
                                                                ? 'F_mor'
                                                                : (chooseFilmFromDropdown ==
                                                                        'Infinite 2')
                                                                    ? 'F_inf'
                                                                    : (chooseFilmFromDropdown ==
                                                                            'No Time To Die')
                                                                        ? 'AC_notime'
                                                                        : (chooseFilmFromDropdown ==
                                                                                'Free Guy')
                                                                            ? 'AC_free'
                                                                            : (chooseFilmFromDropdown == 'Fast & Furious 9')
                                                                                ? 'AC_f9'
                                                                                : (chooseFilmFromDropdown == 'Conjuring 3')
                                                                                    ? 'H_conj'
                                                                                    : (chooseFilmFromDropdown == 'Grudge')
                                                                                        ? 'H_grud'
                                                                                        : '1A_raya')
                    .update({
                  'A1': (a1 == 'Selected')
                      ? 'available'
                      : (a1 == 'Booked')
                          ? 'Booked'
                          : 'available'
                });
              }
              return;
            case "A2":
              {
                bookedFilmName
                    .doc((chooseFilmFromDropdown == 'Antlers')
                        ? 'H_ant'
                        : (chooseFilmFromDropdown == 'Tom & Jerry')
                            ? '1A_t&m'
                            : (chooseFilmFromDropdown == 'Boss Baby 2')
                                ? '1A_babyboss'
                                : (chooseFilmFromDropdown ==
                                        'Super-Intelligence')
                                    ? 'C_super'
                                    : (chooseFilmFromDropdown ==
                                            'Hubie Halloween')
                                        ? 'C_hubie'
                                        : (chooseFilmFromDropdown == 'Freaky')
                                            ? 'C_freaky'
                                            : (chooseFilmFromDropdown ==
                                                    'All My Life')
                                                ? 'R_all'
                                                : (chooseFilmFromDropdown ==
                                                        'Life In A Year')
                                                    ? 'R_life'
                                                    : (chooseFilmFromDropdown ==
                                                            'Stars Fell On Alabama')
                                                        ? 'R_star'
                                                        : (chooseFilmFromDropdown ==
                                                                'Avatar 2')
                                                            ? 'F_avatar'
                                                            : (chooseFilmFromDropdown ==
                                                                    'Morbius')
                                                                ? 'F_mor'
                                                                : (chooseFilmFromDropdown ==
                                                                        'Infinite 2')
                                                                    ? 'F_inf'
                                                                    : (chooseFilmFromDropdown ==
                                                                            'No Time To Die')
                                                                        ? 'AC_notime'
                                                                        : (chooseFilmFromDropdown ==
                                                                                'Free Guy')
                                                                            ? 'AC_free'
                                                                            : (chooseFilmFromDropdown == 'Fast & Furious 9')
                                                                                ? 'AC_f9'
                                                                                : (chooseFilmFromDropdown == 'Conjuring 3')
                                                                                    ? 'H_conj'
                                                                                    : (chooseFilmFromDropdown == 'Grudge')
                                                                                        ? 'H_grud'
                                                                                        : '1A_raya')
                    .update({
                  'A2': (a2 == 'Selected')
                      ? 'available'
                      : (a2 == 'Booked')
                          ? 'Booked'
                          : 'available'
                });
              }
              return;
            case "A3":
              {
                bookedFilmName
                    .doc((chooseFilmFromDropdown == 'Antlers')
                        ? 'H_ant'
                        : (chooseFilmFromDropdown == 'Tom & Jerry')
                            ? '1A_t&m'
                            : (chooseFilmFromDropdown == 'Boss Baby 2')
                                ? '1A_babyboss'
                                : (chooseFilmFromDropdown ==
                                        'Super-Intelligence')
                                    ? 'C_super'
                                    : (chooseFilmFromDropdown ==
                                            'Hubie Halloween')
                                        ? 'C_hubie'
                                        : (chooseFilmFromDropdown == 'Freaky')
                                            ? 'C_freaky'
                                            : (chooseFilmFromDropdown ==
                                                    'All My Life')
                                                ? 'R_all'
                                                : (chooseFilmFromDropdown ==
                                                        'Life In A Year')
                                                    ? 'R_life'
                                                    : (chooseFilmFromDropdown ==
                                                            'Stars Fell On Alabama')
                                                        ? 'R_star'
                                                        : (chooseFilmFromDropdown ==
                                                                'Avatar 2')
                                                            ? 'F_avatar'
                                                            : (chooseFilmFromDropdown ==
                                                                    'Morbius')
                                                                ? 'F_mor'
                                                                : (chooseFilmFromDropdown ==
                                                                        'Infinite 2')
                                                                    ? 'F_inf'
                                                                    : (chooseFilmFromDropdown ==
                                                                            'No Time To Die')
                                                                        ? 'AC_notime'
                                                                        : (chooseFilmFromDropdown ==
                                                                                'Free Guy')
                                                                            ? 'AC_free'
                                                                            : (chooseFilmFromDropdown == 'Fast & Furious 9')
                                                                                ? 'AC_f9'
                                                                                : (chooseFilmFromDropdown == 'Conjuring 3')
                                                                                    ? 'H_conj'
                                                                                    : (chooseFilmFromDropdown == 'Grudge')
                                                                                        ? 'H_grud'
                                                                                        : '1A_raya')
                    .update({
                  'A3': (a3 == 'Selected')
                      ? 'available'
                      : (a3 == 'Booked')
                          ? 'Booked'
                          : 'available'
                });
              }
              return;
            case "B1":
              {
                bookedFilmName
                    .doc((chooseFilmFromDropdown == 'Antlers')
                        ? 'H_ant'
                        : (chooseFilmFromDropdown == 'Tom & Jerry')
                            ? '1A_t&m'
                            : (chooseFilmFromDropdown == 'Boss Baby 2')
                                ? '1A_babyboss'
                                : (chooseFilmFromDropdown ==
                                        'Super-Intelligence')
                                    ? 'C_super'
                                    : (chooseFilmFromDropdown ==
                                            'Hubie Halloween')
                                        ? 'C_hubie'
                                        : (chooseFilmFromDropdown == 'Freaky')
                                            ? 'C_freaky'
                                            : (chooseFilmFromDropdown ==
                                                    'All My Life')
                                                ? 'R_all'
                                                : (chooseFilmFromDropdown ==
                                                        'Life In A Year')
                                                    ? 'R_life'
                                                    : (chooseFilmFromDropdown ==
                                                            'Stars Fell On Alabama')
                                                        ? 'R_star'
                                                        : (chooseFilmFromDropdown ==
                                                                'Avatar 2')
                                                            ? 'F_avatar'
                                                            : (chooseFilmFromDropdown ==
                                                                    'Morbius')
                                                                ? 'F_mor'
                                                                : (chooseFilmFromDropdown ==
                                                                        'Infinite 2')
                                                                    ? 'F_inf'
                                                                    : (chooseFilmFromDropdown ==
                                                                            'No Time To Die')
                                                                        ? 'AC_notime'
                                                                        : (chooseFilmFromDropdown ==
                                                                                'Free Guy')
                                                                            ? 'AC_free'
                                                                            : (chooseFilmFromDropdown == 'Fast & Furious 9')
                                                                                ? 'AC_f9'
                                                                                : (chooseFilmFromDropdown == 'Conjuring 3')
                                                                                    ? 'H_conj'
                                                                                    : (chooseFilmFromDropdown == 'Grudge')
                                                                                        ? 'H_grud'
                                                                                        : '1A_raya')
                    .update({
                  'B1': (b1 == 'Selected')
                      ? 'available'
                      : (b1 == 'Booked')
                          ? 'Booked'
                          : 'available'
                });
              }
              return;
            case "B2":
              {
                bookedFilmName
                    .doc((chooseFilmFromDropdown == 'Antlers')
                        ? 'H_ant'
                        : (chooseFilmFromDropdown == 'Tom & Jerry')
                            ? '1A_t&m'
                            : (chooseFilmFromDropdown == 'Boss Baby 2')
                                ? '1A_babyboss'
                                : (chooseFilmFromDropdown ==
                                        'Super-Intelligence')
                                    ? 'C_super'
                                    : (chooseFilmFromDropdown ==
                                            'Hubie Halloween')
                                        ? 'C_hubie'
                                        : (chooseFilmFromDropdown == 'Freaky')
                                            ? 'C_freaky'
                                            : (chooseFilmFromDropdown ==
                                                    'All My Life')
                                                ? 'R_all'
                                                : (chooseFilmFromDropdown ==
                                                        'Life In A Year')
                                                    ? 'R_life'
                                                    : (chooseFilmFromDropdown ==
                                                            'Stars Fell On Alabama')
                                                        ? 'R_star'
                                                        : (chooseFilmFromDropdown ==
                                                                'Avatar 2')
                                                            ? 'F_avatar'
                                                            : (chooseFilmFromDropdown ==
                                                                    'Morbius')
                                                                ? 'F_mor'
                                                                : (chooseFilmFromDropdown ==
                                                                        'Infinite 2')
                                                                    ? 'F_inf'
                                                                    : (chooseFilmFromDropdown ==
                                                                            'No Time To Die')
                                                                        ? 'AC_notime'
                                                                        : (chooseFilmFromDropdown ==
                                                                                'Free Guy')
                                                                            ? 'AC_free'
                                                                            : (chooseFilmFromDropdown == 'Fast & Furious 9')
                                                                                ? 'AC_f9'
                                                                                : (chooseFilmFromDropdown == 'Conjuring 3')
                                                                                    ? 'H_conj'
                                                                                    : (chooseFilmFromDropdown == 'Grudge')
                                                                                        ? 'H_grud'
                                                                                        : '1A_raya')
                    .update({
                  'B2': (b2 == 'Selected')
                      ? 'available'
                      : (b2 == 'Booked')
                          ? 'Booked'
                          : 'available'
                });
              }
              return;
            case "B3":
              {
                bookedFilmName
                    .doc((chooseFilmFromDropdown == 'Antlers')
                        ? 'H_ant'
                        : (chooseFilmFromDropdown == 'Tom & Jerry')
                            ? '1A_t&m'
                            : (chooseFilmFromDropdown == 'Boss Baby 2')
                                ? '1A_babyboss'
                                : (chooseFilmFromDropdown ==
                                        'Super-Intelligence')
                                    ? 'C_super'
                                    : (chooseFilmFromDropdown ==
                                            'Hubie Halloween')
                                        ? 'C_hubie'
                                        : (chooseFilmFromDropdown == 'Freaky')
                                            ? 'C_freaky'
                                            : (chooseFilmFromDropdown ==
                                                    'All My Life')
                                                ? 'R_all'
                                                : (chooseFilmFromDropdown ==
                                                        'Life In A Year')
                                                    ? 'R_life'
                                                    : (chooseFilmFromDropdown ==
                                                            'Stars Fell On Alabama')
                                                        ? 'R_star'
                                                        : (chooseFilmFromDropdown ==
                                                                'Avatar 2')
                                                            ? 'F_avatar'
                                                            : (chooseFilmFromDropdown ==
                                                                    'Morbius')
                                                                ? 'F_mor'
                                                                : (chooseFilmFromDropdown ==
                                                                        'Infinite 2')
                                                                    ? 'F_inf'
                                                                    : (chooseFilmFromDropdown ==
                                                                            'No Time To Die')
                                                                        ? 'AC_notime'
                                                                        : (chooseFilmFromDropdown ==
                                                                                'Free Guy')
                                                                            ? 'AC_free'
                                                                            : (chooseFilmFromDropdown == 'Fast & Furious 9')
                                                                                ? 'AC_f9'
                                                                                : (chooseFilmFromDropdown == 'Conjuring 3')
                                                                                    ? 'H_conj'
                                                                                    : (chooseFilmFromDropdown == 'Grudge')
                                                                                        ? 'H_grud'
                                                                                        : '1A_raya')
                    .update({
                  'B3': (b3 == 'Selected')
                      ? 'available'
                      : (b3 == 'Booked')
                          ? 'Booked'
                          : 'available'
                });
              }
              return;
            case "B4":
              {
                bookedFilmName
                    .doc((chooseFilmFromDropdown == 'Antlers')
                        ? 'H_ant'
                        : (chooseFilmFromDropdown == 'Tom & Jerry')
                            ? '1A_t&m'
                            : (chooseFilmFromDropdown == 'Boss Baby 2')
                                ? '1A_babyboss'
                                : (chooseFilmFromDropdown ==
                                        'Super-Intelligence')
                                    ? 'C_super'
                                    : (chooseFilmFromDropdown ==
                                            'Hubie Halloween')
                                        ? 'C_hubie'
                                        : (chooseFilmFromDropdown == 'Freaky')
                                            ? 'C_freaky'
                                            : (chooseFilmFromDropdown ==
                                                    'All My Life')
                                                ? 'R_all'
                                                : (chooseFilmFromDropdown ==
                                                        'Life In A Year')
                                                    ? 'R_life'
                                                    : (chooseFilmFromDropdown ==
                                                            'Stars Fell On Alabama')
                                                        ? 'R_star'
                                                        : (chooseFilmFromDropdown ==
                                                                'Avatar 2')
                                                            ? 'F_avatar'
                                                            : (chooseFilmFromDropdown ==
                                                                    'Morbius')
                                                                ? 'F_mor'
                                                                : (chooseFilmFromDropdown ==
                                                                        'Infinite 2')
                                                                    ? 'F_inf'
                                                                    : (chooseFilmFromDropdown ==
                                                                            'No Time To Die')
                                                                        ? 'AC_notime'
                                                                        : (chooseFilmFromDropdown ==
                                                                                'Free Guy')
                                                                            ? 'AC_free'
                                                                            : (chooseFilmFromDropdown == 'Fast & Furious 9')
                                                                                ? 'AC_f9'
                                                                                : (chooseFilmFromDropdown == 'Conjuring 3')
                                                                                    ? 'H_conj'
                                                                                    : (chooseFilmFromDropdown == 'Grudge')
                                                                                        ? 'H_grud'
                                                                                        : '1A_raya')
                    .update({
                  'B4': (b4 == 'Selected')
                      ? 'available'
                      : (b4 == 'Booked')
                          ? 'Booked'
                          : 'available'
                });
              }
              return;
            case "B5":
              {
                bookedFilmName
                    .doc((chooseFilmFromDropdown == 'Antlers')
                        ? 'H_ant'
                        : (chooseFilmFromDropdown == 'Tom & Jerry')
                            ? '1A_t&m'
                            : (chooseFilmFromDropdown == 'Boss Baby 2')
                                ? '1A_babyboss'
                                : (chooseFilmFromDropdown ==
                                        'Super-Intelligence')
                                    ? 'C_super'
                                    : (chooseFilmFromDropdown ==
                                            'Hubie Halloween')
                                        ? 'C_hubie'
                                        : (chooseFilmFromDropdown == 'Freaky')
                                            ? 'C_freaky'
                                            : (chooseFilmFromDropdown ==
                                                    'All My Life')
                                                ? 'R_all'
                                                : (chooseFilmFromDropdown ==
                                                        'Life In A Year')
                                                    ? 'R_life'
                                                    : (chooseFilmFromDropdown ==
                                                            'Stars Fell On Alabama')
                                                        ? 'R_star'
                                                        : (chooseFilmFromDropdown ==
                                                                'Avatar 2')
                                                            ? 'F_avatar'
                                                            : (chooseFilmFromDropdown ==
                                                                    'Morbius')
                                                                ? 'F_mor'
                                                                : (chooseFilmFromDropdown ==
                                                                        'Infinite 2')
                                                                    ? 'F_inf'
                                                                    : (chooseFilmFromDropdown ==
                                                                            'No Time To Die')
                                                                        ? 'AC_notime'
                                                                        : (chooseFilmFromDropdown ==
                                                                                'Free Guy')
                                                                            ? 'AC_free'
                                                                            : (chooseFilmFromDropdown == 'Fast & Furious 9')
                                                                                ? 'AC_f9'
                                                                                : (chooseFilmFromDropdown == 'Conjuring 3')
                                                                                    ? 'H_conj'
                                                                                    : (chooseFilmFromDropdown == 'Grudge')
                                                                                        ? 'H_grud'
                                                                                        : '1A_raya')
                    .update({
                  'B5': (b5 == 'Selected')
                      ? 'available'
                      : (b5 == 'Booked')
                          ? 'Booked'
                          : 'available'
                });
              }
              return;
            case "C1":
              {
                bookedFilmName
                    .doc((chooseFilmFromDropdown == 'Antlers')
                        ? 'H_ant'
                        : (chooseFilmFromDropdown == 'Tom & Jerry')
                            ? '1A_t&m'
                            : (chooseFilmFromDropdown == 'Boss Baby 2')
                                ? '1A_babyboss'
                                : (chooseFilmFromDropdown ==
                                        'Super-Intelligence')
                                    ? 'C_super'
                                    : (chooseFilmFromDropdown ==
                                            'Hubie Halloween')
                                        ? 'C_hubie'
                                        : (chooseFilmFromDropdown == 'Freaky')
                                            ? 'C_freaky'
                                            : (chooseFilmFromDropdown ==
                                                    'All My Life')
                                                ? 'R_all'
                                                : (chooseFilmFromDropdown ==
                                                        'Life In A Year')
                                                    ? 'R_life'
                                                    : (chooseFilmFromDropdown ==
                                                            'Stars Fell On Alabama')
                                                        ? 'R_star'
                                                        : (chooseFilmFromDropdown ==
                                                                'Avatar 2')
                                                            ? 'F_avatar'
                                                            : (chooseFilmFromDropdown ==
                                                                    'Morbius')
                                                                ? 'F_mor'
                                                                : (chooseFilmFromDropdown ==
                                                                        'Infinite 2')
                                                                    ? 'F_inf'
                                                                    : (chooseFilmFromDropdown ==
                                                                            'No Time To Die')
                                                                        ? 'AC_notime'
                                                                        : (chooseFilmFromDropdown ==
                                                                                'Free Guy')
                                                                            ? 'AC_free'
                                                                            : (chooseFilmFromDropdown == 'Fast & Furious 9')
                                                                                ? 'AC_f9'
                                                                                : (chooseFilmFromDropdown == 'Conjuring 3')
                                                                                    ? 'H_conj'
                                                                                    : (chooseFilmFromDropdown == 'Grudge')
                                                                                        ? 'H_grud'
                                                                                        : '1A_raya')
                    .update({
                  'C1': (c1 == 'Selected')
                      ? 'available'
                      : (c1 == 'Booked')
                          ? 'Booked'
                          : 'available'
                });
              }
              return;
            case "C2":
              {
                bookedFilmName
                    .doc((chooseFilmFromDropdown == 'Antlers')
                        ? 'H_ant'
                        : (chooseFilmFromDropdown == 'Tom & Jerry')
                            ? '1A_t&m'
                            : (chooseFilmFromDropdown == 'Boss Baby 2')
                                ? '1A_babyboss'
                                : (chooseFilmFromDropdown ==
                                        'Super-Intelligence')
                                    ? 'C_super'
                                    : (chooseFilmFromDropdown ==
                                            'Hubie Halloween')
                                        ? 'C_hubie'
                                        : (chooseFilmFromDropdown == 'Freaky')
                                            ? 'C_freaky'
                                            : (chooseFilmFromDropdown ==
                                                    'All My Life')
                                                ? 'R_all'
                                                : (chooseFilmFromDropdown ==
                                                        'Life In A Year')
                                                    ? 'R_life'
                                                    : (chooseFilmFromDropdown ==
                                                            'Stars Fell On Alabama')
                                                        ? 'R_star'
                                                        : (chooseFilmFromDropdown ==
                                                                'Avatar 2')
                                                            ? 'F_avatar'
                                                            : (chooseFilmFromDropdown ==
                                                                    'Morbius')
                                                                ? 'F_mor'
                                                                : (chooseFilmFromDropdown ==
                                                                        'Infinite 2')
                                                                    ? 'F_inf'
                                                                    : (chooseFilmFromDropdown ==
                                                                            'No Time To Die')
                                                                        ? 'AC_notime'
                                                                        : (chooseFilmFromDropdown ==
                                                                                'Free Guy')
                                                                            ? 'AC_free'
                                                                            : (chooseFilmFromDropdown == 'Fast & Furious 9')
                                                                                ? 'AC_f9'
                                                                                : (chooseFilmFromDropdown == 'Conjuring 3')
                                                                                    ? 'H_conj'
                                                                                    : (chooseFilmFromDropdown == 'Grudge')
                                                                                        ? 'H_grud'
                                                                                        : '1A_raya')
                    .update({
                  'C2': (c2 == 'Selected')
                      ? 'available'
                      : (c2 == 'Booked')
                          ? 'Booked'
                          : 'available'
                });
              }
              return;
            case "C3":
              {
                bookedFilmName
                    .doc((chooseFilmFromDropdown == 'Antlers')
                        ? 'H_ant'
                        : (chooseFilmFromDropdown == 'Tom & Jerry')
                            ? '1A_t&m'
                            : (chooseFilmFromDropdown == 'Boss Baby 2')
                                ? '1A_babyboss'
                                : (chooseFilmFromDropdown ==
                                        'Super-Intelligence')
                                    ? 'C_super'
                                    : (chooseFilmFromDropdown ==
                                            'Hubie Halloween')
                                        ? 'C_hubie'
                                        : (chooseFilmFromDropdown == 'Freaky')
                                            ? 'C_freaky'
                                            : (chooseFilmFromDropdown ==
                                                    'All My Life')
                                                ? 'R_all'
                                                : (chooseFilmFromDropdown ==
                                                        'Life In A Year')
                                                    ? 'R_life'
                                                    : (chooseFilmFromDropdown ==
                                                            'Stars Fell On Alabama')
                                                        ? 'R_star'
                                                        : (chooseFilmFromDropdown ==
                                                                'Avatar 2')
                                                            ? 'F_avatar'
                                                            : (chooseFilmFromDropdown ==
                                                                    'Morbius')
                                                                ? 'F_mor'
                                                                : (chooseFilmFromDropdown ==
                                                                        'Infinite 2')
                                                                    ? 'F_inf'
                                                                    : (chooseFilmFromDropdown ==
                                                                            'No Time To Die')
                                                                        ? 'AC_notime'
                                                                        : (chooseFilmFromDropdown ==
                                                                                'Free Guy')
                                                                            ? 'AC_free'
                                                                            : (chooseFilmFromDropdown == 'Fast & Furious 9')
                                                                                ? 'AC_f9'
                                                                                : (chooseFilmFromDropdown == 'Conjuring 3')
                                                                                    ? 'H_conj'
                                                                                    : (chooseFilmFromDropdown == 'Grudge')
                                                                                        ? 'H_grud'
                                                                                        : '1A_raya')
                    .update({
                  'C3': (c3 == 'Selected')
                      ? 'available'
                      : (c3 == 'Booked')
                          ? 'Booked'
                          : 'available'
                });
              }
              return;
            case "C4":
              {
                bookedFilmName
                    .doc((chooseFilmFromDropdown == 'Antlers')
                        ? 'H_ant'
                        : (chooseFilmFromDropdown == 'Tom & Jerry')
                            ? '1A_t&m'
                            : (chooseFilmFromDropdown == 'Boss Baby 2')
                                ? '1A_babyboss'
                                : (chooseFilmFromDropdown ==
                                        'Super-Intelligence')
                                    ? 'C_super'
                                    : (chooseFilmFromDropdown ==
                                            'Hubie Halloween')
                                        ? 'C_hubie'
                                        : (chooseFilmFromDropdown == 'Freaky')
                                            ? 'C_freaky'
                                            : (chooseFilmFromDropdown ==
                                                    'All My Life')
                                                ? 'R_all'
                                                : (chooseFilmFromDropdown ==
                                                        'Life In A Year')
                                                    ? 'R_life'
                                                    : (chooseFilmFromDropdown ==
                                                            'Stars Fell On Alabama')
                                                        ? 'R_star'
                                                        : (chooseFilmFromDropdown ==
                                                                'Avatar 2')
                                                            ? 'F_avatar'
                                                            : (chooseFilmFromDropdown ==
                                                                    'Morbius')
                                                                ? 'F_mor'
                                                                : (chooseFilmFromDropdown ==
                                                                        'Infinite 2')
                                                                    ? 'F_inf'
                                                                    : (chooseFilmFromDropdown ==
                                                                            'No Time To Die')
                                                                        ? 'AC_notime'
                                                                        : (chooseFilmFromDropdown ==
                                                                                'Free Guy')
                                                                            ? 'AC_free'
                                                                            : (chooseFilmFromDropdown == 'Fast & Furious 9')
                                                                                ? 'AC_f9'
                                                                                : (chooseFilmFromDropdown == 'Conjuring 3')
                                                                                    ? 'H_conj'
                                                                                    : (chooseFilmFromDropdown == 'Grudge')
                                                                                        ? 'H_grud'
                                                                                        : '1A_raya')
                    .update({
                  'C4': (c4 == 'Selected')
                      ? 'available'
                      : (c4 == 'Booked')
                          ? 'Booked'
                          : 'available'
                });
              }
              return;
            case "C5":
              {
                bookedFilmName
                    .doc((chooseFilmFromDropdown == 'Antlers')
                        ? 'H_ant'
                        : (chooseFilmFromDropdown == 'Tom & Jerry')
                            ? '1A_t&m'
                            : (chooseFilmFromDropdown == 'Boss Baby 2')
                                ? '1A_babyboss'
                                : (chooseFilmFromDropdown ==
                                        'Super-Intelligence')
                                    ? 'C_super'
                                    : (chooseFilmFromDropdown ==
                                            'Hubie Halloween')
                                        ? 'C_hubie'
                                        : (chooseFilmFromDropdown == 'Freaky')
                                            ? 'C_freaky'
                                            : (chooseFilmFromDropdown ==
                                                    'All My Life')
                                                ? 'R_all'
                                                : (chooseFilmFromDropdown ==
                                                        'Life In A Year')
                                                    ? 'R_life'
                                                    : (chooseFilmFromDropdown ==
                                                            'Stars Fell On Alabama')
                                                        ? 'R_star'
                                                        : (chooseFilmFromDropdown ==
                                                                'Avatar 2')
                                                            ? 'F_avatar'
                                                            : (chooseFilmFromDropdown ==
                                                                    'Morbius')
                                                                ? 'F_mor'
                                                                : (chooseFilmFromDropdown ==
                                                                        'Infinite 2')
                                                                    ? 'F_inf'
                                                                    : (chooseFilmFromDropdown ==
                                                                            'No Time To Die')
                                                                        ? 'AC_notime'
                                                                        : (chooseFilmFromDropdown ==
                                                                                'Free Guy')
                                                                            ? 'AC_free'
                                                                            : (chooseFilmFromDropdown == 'Fast & Furious 9')
                                                                                ? 'AC_f9'
                                                                                : (chooseFilmFromDropdown == 'Conjuring 3')
                                                                                    ? 'H_conj'
                                                                                    : (chooseFilmFromDropdown == 'Grudge')
                                                                                        ? 'H_grud'
                                                                                        : '1A_raya')
                    .update({
                  'C5': (c5 == 'Selected')
                      ? 'available'
                      : (c5 == 'Booked')
                          ? 'Booked'
                          : 'available'
                });
              }
              return;
            case "D1":
              {
                bookedFilmName
                    .doc((chooseFilmFromDropdown == 'Antlers')
                        ? 'H_ant'
                        : (chooseFilmFromDropdown == 'Tom & Jerry')
                            ? '1A_t&m'
                            : (chooseFilmFromDropdown == 'Boss Baby 2')
                                ? '1A_babyboss'
                                : (chooseFilmFromDropdown ==
                                        'Super-Intelligence')
                                    ? 'C_super'
                                    : (chooseFilmFromDropdown ==
                                            'Hubie Halloween')
                                        ? 'C_hubie'
                                        : (chooseFilmFromDropdown == 'Freaky')
                                            ? 'C_freaky'
                                            : (chooseFilmFromDropdown ==
                                                    'All My Life')
                                                ? 'R_all'
                                                : (chooseFilmFromDropdown ==
                                                        'Life In A Year')
                                                    ? 'R_life'
                                                    : (chooseFilmFromDropdown ==
                                                            'Stars Fell On Alabama')
                                                        ? 'R_star'
                                                        : (chooseFilmFromDropdown ==
                                                                'Avatar 2')
                                                            ? 'F_avatar'
                                                            : (chooseFilmFromDropdown ==
                                                                    'Morbius')
                                                                ? 'F_mor'
                                                                : (chooseFilmFromDropdown ==
                                                                        'Infinite 2')
                                                                    ? 'F_inf'
                                                                    : (chooseFilmFromDropdown ==
                                                                            'No Time To Die')
                                                                        ? 'AC_notime'
                                                                        : (chooseFilmFromDropdown ==
                                                                                'Free Guy')
                                                                            ? 'AC_free'
                                                                            : (chooseFilmFromDropdown == 'Fast & Furious 9')
                                                                                ? 'AC_f9'
                                                                                : (chooseFilmFromDropdown == 'Conjuring 3')
                                                                                    ? 'H_conj'
                                                                                    : (chooseFilmFromDropdown == 'Grudge')
                                                                                        ? 'H_grud'
                                                                                        : '1A_raya')
                    .update({
                  'D1': (d1 == 'Selected')
                      ? 'available'
                      : (d1 == 'Booked')
                          ? 'Booked'
                          : 'available'
                });
              }
              return;
            case "D2":
              {
                bookedFilmName
                    .doc((chooseFilmFromDropdown == 'Antlers')
                        ? 'H_ant'
                        : (chooseFilmFromDropdown == 'Tom & Jerry')
                            ? '1A_t&m'
                            : (chooseFilmFromDropdown == 'Boss Baby 2')
                                ? '1A_babyboss'
                                : (chooseFilmFromDropdown ==
                                        'Super-Intelligence')
                                    ? 'C_super'
                                    : (chooseFilmFromDropdown ==
                                            'Hubie Halloween')
                                        ? 'C_hubie'
                                        : (chooseFilmFromDropdown == 'Freaky')
                                            ? 'C_freaky'
                                            : (chooseFilmFromDropdown ==
                                                    'All My Life')
                                                ? 'R_all'
                                                : (chooseFilmFromDropdown ==
                                                        'Life In A Year')
                                                    ? 'R_life'
                                                    : (chooseFilmFromDropdown ==
                                                            'Stars Fell On Alabama')
                                                        ? 'R_star'
                                                        : (chooseFilmFromDropdown ==
                                                                'Avatar 2')
                                                            ? 'F_avatar'
                                                            : (chooseFilmFromDropdown ==
                                                                    'Morbius')
                                                                ? 'F_mor'
                                                                : (chooseFilmFromDropdown ==
                                                                        'Infinite 2')
                                                                    ? 'F_inf'
                                                                    : (chooseFilmFromDropdown ==
                                                                            'No Time To Die')
                                                                        ? 'AC_notime'
                                                                        : (chooseFilmFromDropdown ==
                                                                                'Free Guy')
                                                                            ? 'AC_free'
                                                                            : (chooseFilmFromDropdown == 'Fast & Furious 9')
                                                                                ? 'AC_f9'
                                                                                : (chooseFilmFromDropdown == 'Conjuring 3')
                                                                                    ? 'H_conj'
                                                                                    : (chooseFilmFromDropdown == 'Grudge')
                                                                                        ? 'H_grud'
                                                                                        : '1A_raya')
                    .update({
                  'D2': (d2 == 'Selected')
                      ? 'available'
                      : (d2 == 'Booked')
                          ? 'Booked'
                          : 'available'
                });
              }
              return;
            case "D3":
              {
                bookedFilmName
                    .doc((chooseFilmFromDropdown == 'Antlers')
                        ? 'H_ant'
                        : (chooseFilmFromDropdown == 'Tom & Jerry')
                            ? '1A_t&m'
                            : (chooseFilmFromDropdown == 'Boss Baby 2')
                                ? '1A_babyboss'
                                : (chooseFilmFromDropdown ==
                                        'Super-Intelligence')
                                    ? 'C_super'
                                    : (chooseFilmFromDropdown ==
                                            'Hubie Halloween')
                                        ? 'C_hubie'
                                        : (chooseFilmFromDropdown == 'Freaky')
                                            ? 'C_freaky'
                                            : (chooseFilmFromDropdown ==
                                                    'All My Life')
                                                ? 'R_all'
                                                : (chooseFilmFromDropdown ==
                                                        'Life In A Year')
                                                    ? 'R_life'
                                                    : (chooseFilmFromDropdown ==
                                                            'Stars Fell On Alabama')
                                                        ? 'R_star'
                                                        : (chooseFilmFromDropdown ==
                                                                'Avatar 2')
                                                            ? 'F_avatar'
                                                            : (chooseFilmFromDropdown ==
                                                                    'Morbius')
                                                                ? 'F_mor'
                                                                : (chooseFilmFromDropdown ==
                                                                        'Infinite 2')
                                                                    ? 'F_inf'
                                                                    : (chooseFilmFromDropdown ==
                                                                            'No Time To Die')
                                                                        ? 'AC_notime'
                                                                        : (chooseFilmFromDropdown ==
                                                                                'Free Guy')
                                                                            ? 'AC_free'
                                                                            : (chooseFilmFromDropdown == 'Fast & Furious 9')
                                                                                ? 'AC_f9'
                                                                                : (chooseFilmFromDropdown == 'Conjuring 3')
                                                                                    ? 'H_conj'
                                                                                    : (chooseFilmFromDropdown == 'Grudge')
                                                                                        ? 'H_grud'
                                                                                        : '1A_raya')
                    .update({
                  'D3': (d3 == 'Selected')
                      ? 'available'
                      : (d3 == 'Booked')
                          ? 'Booked'
                          : 'available'
                });
              }
              return;
            case "D4":
              {
                bookedFilmName
                    .doc((chooseFilmFromDropdown == 'Antlers')
                        ? 'H_ant'
                        : (chooseFilmFromDropdown == 'Tom & Jerry')
                            ? '1A_t&m'
                            : (chooseFilmFromDropdown == 'Boss Baby 2')
                                ? '1A_babyboss'
                                : (chooseFilmFromDropdown ==
                                        'Super-Intelligence')
                                    ? 'C_super'
                                    : (chooseFilmFromDropdown ==
                                            'Hubie Halloween')
                                        ? 'C_hubie'
                                        : (chooseFilmFromDropdown == 'Freaky')
                                            ? 'C_freaky'
                                            : (chooseFilmFromDropdown ==
                                                    'All My Life')
                                                ? 'R_all'
                                                : (chooseFilmFromDropdown ==
                                                        'Life In A Year')
                                                    ? 'R_life'
                                                    : (chooseFilmFromDropdown ==
                                                            'Stars Fell On Alabama')
                                                        ? 'R_star'
                                                        : (chooseFilmFromDropdown ==
                                                                'Avatar 2')
                                                            ? 'F_avatar'
                                                            : (chooseFilmFromDropdown ==
                                                                    'Morbius')
                                                                ? 'F_mor'
                                                                : (chooseFilmFromDropdown ==
                                                                        'Infinite 2')
                                                                    ? 'F_inf'
                                                                    : (chooseFilmFromDropdown ==
                                                                            'No Time To Die')
                                                                        ? 'AC_notime'
                                                                        : (chooseFilmFromDropdown ==
                                                                                'Free Guy')
                                                                            ? 'AC_free'
                                                                            : (chooseFilmFromDropdown == 'Fast & Furious 9')
                                                                                ? 'AC_f9'
                                                                                : (chooseFilmFromDropdown == 'Conjuring 3')
                                                                                    ? 'H_conj'
                                                                                    : (chooseFilmFromDropdown == 'Grudge')
                                                                                        ? 'H_grud'
                                                                                        : '1A_raya')
                    .update({
                  'D4': (d4 == 'Selected')
                      ? 'available'
                      : (d4 == 'Booked')
                          ? 'Booked'
                          : 'available'
                });
              }
              return;
            case "D5":
              {
                bookedFilmName
                    .doc((chooseFilmFromDropdown == 'Antlers')
                        ? 'H_ant'
                        : (chooseFilmFromDropdown == 'Tom & Jerry')
                            ? '1A_t&m'
                            : (chooseFilmFromDropdown == 'Boss Baby 2')
                                ? '1A_babyboss'
                                : (chooseFilmFromDropdown ==
                                        'Super-Intelligence')
                                    ? 'C_super'
                                    : (chooseFilmFromDropdown ==
                                            'Hubie Halloween')
                                        ? 'C_hubie'
                                        : (chooseFilmFromDropdown == 'Freaky')
                                            ? 'C_freaky'
                                            : (chooseFilmFromDropdown ==
                                                    'All My Life')
                                                ? 'R_all'
                                                : (chooseFilmFromDropdown ==
                                                        'Life In A Year')
                                                    ? 'R_life'
                                                    : (chooseFilmFromDropdown ==
                                                            'Stars Fell On Alabama')
                                                        ? 'R_star'
                                                        : (chooseFilmFromDropdown ==
                                                                'Avatar 2')
                                                            ? 'F_avatar'
                                                            : (chooseFilmFromDropdown ==
                                                                    'Morbius')
                                                                ? 'F_mor'
                                                                : (chooseFilmFromDropdown ==
                                                                        'Infinite 2')
                                                                    ? 'F_inf'
                                                                    : (chooseFilmFromDropdown ==
                                                                            'No Time To Die')
                                                                        ? 'AC_notime'
                                                                        : (chooseFilmFromDropdown ==
                                                                                'Free Guy')
                                                                            ? 'AC_free'
                                                                            : (chooseFilmFromDropdown == 'Fast & Furious 9')
                                                                                ? 'AC_f9'
                                                                                : (chooseFilmFromDropdown == 'Conjuring 3')
                                                                                    ? 'H_conj'
                                                                                    : (chooseFilmFromDropdown == 'Grudge')
                                                                                        ? 'H_grud'
                                                                                        : '1A_raya')
                    .update({
                  'D5': (d5 == 'Selected')
                      ? 'available'
                      : (d5 == 'Booked')
                          ? 'Booked'
                          : 'available'
                });
              }
              return;
            case "E1":
              {
                bookedFilmName
                    .doc((chooseFilmFromDropdown == 'Antlers')
                        ? 'H_ant'
                        : (chooseFilmFromDropdown == 'Tom & Jerry')
                            ? '1A_t&m'
                            : (chooseFilmFromDropdown == 'Boss Baby 2')
                                ? '1A_babyboss'
                                : (chooseFilmFromDropdown ==
                                        'Super-Intelligence')
                                    ? 'C_super'
                                    : (chooseFilmFromDropdown ==
                                            'Hubie Halloween')
                                        ? 'C_hubie'
                                        : (chooseFilmFromDropdown == 'Freaky')
                                            ? 'C_freaky'
                                            : (chooseFilmFromDropdown ==
                                                    'All My Life')
                                                ? 'R_all'
                                                : (chooseFilmFromDropdown ==
                                                        'Life In A Year')
                                                    ? 'R_life'
                                                    : (chooseFilmFromDropdown ==
                                                            'Stars Fell On Alabama')
                                                        ? 'R_star'
                                                        : (chooseFilmFromDropdown ==
                                                                'Avatar 2')
                                                            ? 'F_avatar'
                                                            : (chooseFilmFromDropdown ==
                                                                    'Morbius')
                                                                ? 'F_mor'
                                                                : (chooseFilmFromDropdown ==
                                                                        'Infinite 2')
                                                                    ? 'F_inf'
                                                                    : (chooseFilmFromDropdown ==
                                                                            'No Time To Die')
                                                                        ? 'AC_notime'
                                                                        : (chooseFilmFromDropdown ==
                                                                                'Free Guy')
                                                                            ? 'AC_free'
                                                                            : (chooseFilmFromDropdown == 'Fast & Furious 9')
                                                                                ? 'AC_f9'
                                                                                : (chooseFilmFromDropdown == 'Conjuring 3')
                                                                                    ? 'H_conj'
                                                                                    : (chooseFilmFromDropdown == 'Grudge')
                                                                                        ? 'H_grud'
                                                                                        : '1A_raya')
                    .update({
                  'E1': (e1 == 'Selected')
                      ? 'available'
                      : (e1 == 'Booked')
                          ? 'Booked'
                          : 'available'
                });
              }
              return;
            case "E2":
              {
                bookedFilmName
                    .doc((chooseFilmFromDropdown == 'Antlers')
                        ? 'H_ant'
                        : (chooseFilmFromDropdown == 'Tom & Jerry')
                            ? '1A_t&m'
                            : (chooseFilmFromDropdown == 'Boss Baby 2')
                                ? '1A_babyboss'
                                : (chooseFilmFromDropdown ==
                                        'Super-Intelligence')
                                    ? 'C_super'
                                    : (chooseFilmFromDropdown ==
                                            'Hubie Halloween')
                                        ? 'C_hubie'
                                        : (chooseFilmFromDropdown == 'Freaky')
                                            ? 'C_freaky'
                                            : (chooseFilmFromDropdown ==
                                                    'All My Life')
                                                ? 'R_all'
                                                : (chooseFilmFromDropdown ==
                                                        'Life In A Year')
                                                    ? 'R_life'
                                                    : (chooseFilmFromDropdown ==
                                                            'Stars Fell On Alabama')
                                                        ? 'R_star'
                                                        : (chooseFilmFromDropdown ==
                                                                'Avatar 2')
                                                            ? 'F_avatar'
                                                            : (chooseFilmFromDropdown ==
                                                                    'Morbius')
                                                                ? 'F_mor'
                                                                : (chooseFilmFromDropdown ==
                                                                        'Infinite 2')
                                                                    ? 'F_inf'
                                                                    : (chooseFilmFromDropdown ==
                                                                            'No Time To Die')
                                                                        ? 'AC_notime'
                                                                        : (chooseFilmFromDropdown ==
                                                                                'Free Guy')
                                                                            ? 'AC_free'
                                                                            : (chooseFilmFromDropdown == 'Fast & Furious 9')
                                                                                ? 'AC_f9'
                                                                                : (chooseFilmFromDropdown == 'Conjuring 3')
                                                                                    ? 'H_conj'
                                                                                    : (chooseFilmFromDropdown == 'Grudge')
                                                                                        ? 'H_grud'
                                                                                        : '1A_raya')
                    .update({
                  'E2': (e2 == 'Selected')
                      ? 'available'
                      : (e2 == 'Booked')
                          ? 'Booked'
                          : 'available'
                });
              }
              return;
            case "E3":
              {
                bookedFilmName
                    .doc((chooseFilmFromDropdown == 'Antlers')
                        ? 'H_ant'
                        : (chooseFilmFromDropdown == 'Tom & Jerry')
                            ? '1A_t&m'
                            : (chooseFilmFromDropdown == 'Boss Baby 2')
                                ? '1A_babyboss'
                                : (chooseFilmFromDropdown ==
                                        'Super-Intelligence')
                                    ? 'C_super'
                                    : (chooseFilmFromDropdown ==
                                            'Hubie Halloween')
                                        ? 'C_hubie'
                                        : (chooseFilmFromDropdown == 'Freaky')
                                            ? 'C_freaky'
                                            : (chooseFilmFromDropdown ==
                                                    'All My Life')
                                                ? 'R_all'
                                                : (chooseFilmFromDropdown ==
                                                        'Life In A Year')
                                                    ? 'R_life'
                                                    : (chooseFilmFromDropdown ==
                                                            'Stars Fell On Alabama')
                                                        ? 'R_star'
                                                        : (chooseFilmFromDropdown ==
                                                                'Avatar 2')
                                                            ? 'F_avatar'
                                                            : (chooseFilmFromDropdown ==
                                                                    'Morbius')
                                                                ? 'F_mor'
                                                                : (chooseFilmFromDropdown ==
                                                                        'Infinite 2')
                                                                    ? 'F_inf'
                                                                    : (chooseFilmFromDropdown ==
                                                                            'No Time To Die')
                                                                        ? 'AC_notime'
                                                                        : (chooseFilmFromDropdown ==
                                                                                'Free Guy')
                                                                            ? 'AC_free'
                                                                            : (chooseFilmFromDropdown == 'Fast & Furious 9')
                                                                                ? 'AC_f9'
                                                                                : (chooseFilmFromDropdown == 'Conjuring 3')
                                                                                    ? 'H_conj'
                                                                                    : (chooseFilmFromDropdown == 'Grudge')
                                                                                        ? 'H_grud'
                                                                                        : '1A_raya')
                    .update({
                  'E3': (e3 == 'Selected')
                      ? 'available'
                      : (e3 == 'Booked')
                          ? 'Booked'
                          : 'available'
                });
              }
              return;
            case "E4":
              {
                bookedFilmName
                    .doc((chooseFilmFromDropdown == 'Antlers')
                        ? 'H_ant'
                        : (chooseFilmFromDropdown == 'Tom & Jerry')
                            ? '1A_t&m'
                            : (chooseFilmFromDropdown == 'Boss Baby 2')
                                ? '1A_babyboss'
                                : (chooseFilmFromDropdown ==
                                        'Super-Intelligence')
                                    ? 'C_super'
                                    : (chooseFilmFromDropdown ==
                                            'Hubie Halloween')
                                        ? 'C_hubie'
                                        : (chooseFilmFromDropdown == 'Freaky')
                                            ? 'C_freaky'
                                            : (chooseFilmFromDropdown ==
                                                    'All My Life')
                                                ? 'R_all'
                                                : (chooseFilmFromDropdown ==
                                                        'Life In A Year')
                                                    ? 'R_life'
                                                    : (chooseFilmFromDropdown ==
                                                            'Stars Fell On Alabama')
                                                        ? 'R_star'
                                                        : (chooseFilmFromDropdown ==
                                                                'Avatar 2')
                                                            ? 'F_avatar'
                                                            : (chooseFilmFromDropdown ==
                                                                    'Morbius')
                                                                ? 'F_mor'
                                                                : (chooseFilmFromDropdown ==
                                                                        'Infinite 2')
                                                                    ? 'F_inf'
                                                                    : (chooseFilmFromDropdown ==
                                                                            'No Time To Die')
                                                                        ? 'AC_notime'
                                                                        : (chooseFilmFromDropdown ==
                                                                                'Free Guy')
                                                                            ? 'AC_free'
                                                                            : (chooseFilmFromDropdown == 'Fast & Furious 9')
                                                                                ? 'AC_f9'
                                                                                : (chooseFilmFromDropdown == 'Conjuring 3')
                                                                                    ? 'H_conj'
                                                                                    : (chooseFilmFromDropdown == 'Grudge')
                                                                                        ? 'H_grud'
                                                                                        : '1A_raya')
                    .update({
                  'E4': (e4 == 'Selected')
                      ? 'available'
                      : (e4 == 'Booked')
                          ? 'Booked'
                          : 'available'
                });
              }
              return;
            case "E5":
              {
                bookedFilmName
                    .doc((chooseFilmFromDropdown == 'Antlers')
                        ? 'H_ant'
                        : (chooseFilmFromDropdown == 'Tom & Jerry')
                            ? '1A_t&m'
                            : (chooseFilmFromDropdown == 'Boss Baby 2')
                                ? '1A_babyboss'
                                : (chooseFilmFromDropdown ==
                                        'Super-Intelligence')
                                    ? 'C_super'
                                    : (chooseFilmFromDropdown ==
                                            'Hubie Halloween')
                                        ? 'C_hubie'
                                        : (chooseFilmFromDropdown == 'Freaky')
                                            ? 'C_freaky'
                                            : (chooseFilmFromDropdown ==
                                                    'All My Life')
                                                ? 'R_all'
                                                : (chooseFilmFromDropdown ==
                                                        'Life In A Year')
                                                    ? 'R_life'
                                                    : (chooseFilmFromDropdown ==
                                                            'Stars Fell On Alabama')
                                                        ? 'R_star'
                                                        : (chooseFilmFromDropdown ==
                                                                'Avatar 2')
                                                            ? 'F_avatar'
                                                            : (chooseFilmFromDropdown ==
                                                                    'Morbius')
                                                                ? 'F_mor'
                                                                : (chooseFilmFromDropdown ==
                                                                        'Infinite 2')
                                                                    ? 'F_inf'
                                                                    : (chooseFilmFromDropdown ==
                                                                            'No Time To Die')
                                                                        ? 'AC_notime'
                                                                        : (chooseFilmFromDropdown ==
                                                                                'Free Guy')
                                                                            ? 'AC_free'
                                                                            : (chooseFilmFromDropdown == 'Fast & Furious 9')
                                                                                ? 'AC_f9'
                                                                                : (chooseFilmFromDropdown == 'Conjuring 3')
                                                                                    ? 'H_conj'
                                                                                    : (chooseFilmFromDropdown == 'Grudge')
                                                                                        ? 'H_grud'
                                                                                        : '1A_raya')
                    .update({
                  'E5': (e5 == 'Selected')
                      ? 'available'
                      : (e5 == 'Booked')
                          ? 'Booked'
                          : 'available'
                });
              }
              return;
          }
        },
      ),
    );
  }

  Widget _exampleSeats({containerColor, seatsData}) {
    return Row(
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
              color: containerColor,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.black45)),
          margin: const EdgeInsets.all(2),
        ),
        Text(
          "$seatsData",
          style: TextStyle(
            color: Colors.black.withOpacity(0.5),
            letterSpacing: 0.5,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.italic,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _bookingButton() {
    return MaterialButton(
      padding: const EdgeInsets.all(0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      splashColor: Colors.black.withOpacity(0.4),
      onPressed: () {
        showDialog(
            context: context,
            builder: checkOutPayment,
            barrierDismissible: false);
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.deepOrange.withOpacity(0.7),
          borderRadius: const BorderRadius.all(Radius.circular(25)),
        ),
        child: Text(
          "CheckOut !",
          style: TextStyle(
            color: Colors.white.withOpacity(0.8),
            letterSpacing: 0.5,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            fontSize: 19,
          ),
        ),
      ),
    );
  }

  Text _hintFunction(String hint) {
    return Text(
      hint,
      style: TextStyle(
        color: Colors.black.withOpacity(0.5),
        letterSpacing: 0.5,
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.italic,
        fontSize: 12,
      ),
    );
  }

  AlertDialog checkOutPayment(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.all(12),
      title: const Text(
        "- Payment !",
        style: TextStyle(fontSize: 17),
      ),
      content: Form(
        key: _formkey_3,
        child: TextFormField(
          controller: creditCardController,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          decoration: InputDecoration(
            prefixIcon: const Icon(
              Icons.credit_card,
              size: 25,
            ),
            labelText: "Credit Card",
            hintText: "Enter Your Credit-Card : ",
            hintStyle: TextStyle(color: Colors.black.withOpacity(0.4)),
            contentPadding: const EdgeInsets.all(10),
            labelStyle: const TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 18,
              letterSpacing: 1,
              fontFamily: "XanhMono",
            ),
          ),
          validator: (creditCardValue) {
            if (creditCardValue!.length > 14 || creditCardValue.length < 14) {
              return "Your Credit Card Number Must be 14 digits.";
            }
            return null;
          },
        ),
      ),
      actions: [
        // ignore: deprecated_member_use
        MaterialButton(
            onPressed: () {
              if (creditCardController.text.isNotEmpty &&
                  creditCardController.text.length == 14) {
                bookedFilmName
                    .doc((chooseFilmFromDropdown == 'Antlers')
                        ? 'H_ant'
                        : (chooseFilmFromDropdown == 'Tom & Jerry')
                            ? '1A_t&m'
                            : (chooseFilmFromDropdown == 'Boss Baby 2')
                                ? '1A_babyboss'
                                : (chooseFilmFromDropdown ==
                                        'Super-Intelligence')
                                    ? 'C_super'
                                    : (chooseFilmFromDropdown ==
                                            'Hubie Halloween')
                                        ? 'C_hubie'
                                        : (chooseFilmFromDropdown == 'Freaky')
                                            ? 'C_freaky'
                                            : (chooseFilmFromDropdown ==
                                                    'All My Life')
                                                ? 'R_all'
                                                : (chooseFilmFromDropdown ==
                                                        'Life In A Year')
                                                    ? 'R_life'
                                                    : (chooseFilmFromDropdown ==
                                                            'Stars Fell On Alabama')
                                                        ? 'R_star'
                                                        : (chooseFilmFromDropdown ==
                                                                'Avatar 2')
                                                            ? 'F_avatar'
                                                            : (chooseFilmFromDropdown ==
                                                                    'Morbius')
                                                                ? 'F_mor'
                                                                : (chooseFilmFromDropdown ==
                                                                        'Infinite 2')
                                                                    ? 'F_inf'
                                                                    : (chooseFilmFromDropdown ==
                                                                            'No Time To Die')
                                                                        ? 'AC_notime'
                                                                        : (chooseFilmFromDropdown ==
                                                                                'Free Guy')
                                                                            ? 'AC_free'
                                                                            : (chooseFilmFromDropdown == 'Fast & Furious 9')
                                                                                ? 'AC_f9'
                                                                                : (chooseFilmFromDropdown == 'Conjuring 3')
                                                                                    ? 'H_conj'
                                                                                    : (chooseFilmFromDropdown == 'Grudge')
                                                                                        ? 'H_grud'
                                                                                        : '1A_raya')
                    .update({
                  'A1': (a1 == "Selected" || a1 == "Booked")
                      ? "Booked"
                      : "available",
                  'A2': (a2 == "Selected" || a2 == "Booked")
                      ? "Booked"
                      : "available",
                  'A3': (a3 == "Selected" || a3 == "Booked")
                      ? "Booked"
                      : "available",
                  'B1': (b1 == "Selected" || b1 == "Booked")
                      ? "Booked"
                      : "available",
                  'B2': (b2 == "Selected" || b2 == "Booked")
                      ? "Booked"
                      : "available",
                  'B3': (b3 == "Selected" || b3 == "Booked")
                      ? "Booked"
                      : "available",
                  'B4': (b4 == "Selected" || b4 == "Booked")
                      ? "Booked"
                      : "available",
                  'B5': (b5 == "Selected" || b5 == "Booked")
                      ? "Booked"
                      : "available",
                  'C1': (c1 == "Selected" || c1 == "Booked")
                      ? "Booked"
                      : "available",
                  'C2': (c2 == "Selected" || c2 == "Booked")
                      ? "Booked"
                      : "available",
                  'C3': (c3 == "Selected" || c3 == "Booked")
                      ? "Booked"
                      : "available",
                  'C4': (c4 == "Selected" || c4 == "Booked")
                      ? "Booked"
                      : "available",
                  'C5': (c5 == "Selected" || c5 == "Booked")
                      ? "Booked"
                      : "available",
                  'D1': (d1 == "Selected" || d1 == "Booked")
                      ? "Booked"
                      : "available",
                  'D2': (d2 == "Selected" || d2 == "Booked")
                      ? "Booked"
                      : "available",
                  'D3': (d3 == "Selected" || d3 == "Booked")
                      ? "Booked"
                      : "available",
                  'D4': (d4 == "Selected" || d4 == "Booked")
                      ? "Booked"
                      : "available",
                  'D5': (d5 == "Selected" || d5 == "Booked")
                      ? "Booked"
                      : "available",
                  'E1': (e1 == "Selected" || e1 == "Booked")
                      ? "Booked"
                      : "available",
                  'E2': (e2 == "Selected" || e2 == "Booked")
                      ? "Booked"
                      : "available",
                  'E3': (e3 == "Selected" || e3 == "Booked")
                      ? "Booked"
                      : "available",
                  'E4': (e4 == "Selected" || e4 == "Booked")
                      ? "Booked"
                      : "available",
                  'E5': (e5 == "Selected" || e5 == "Booked")
                      ? "Booked"
                      : "available",
                });
                Navigator.of(context).pop();
                userstime();
                documentsAlreadyExist();
                bookedUsersWithFilmName();
                bookedUsersWithTimeDocID();
                fullCompleteCollectionForFilmName();
                usersTimeWithID();
              }
            },
            child:
                const Text("Pay", style: TextStyle(color: Colors.deepOrangeAccent))),
        MaterialButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("Cancel",
                style: TextStyle(color: Colors.deepOrangeAccent))),
      ],
    );
  }

  //   <-----------------------------Build--------------------------------------------------


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.deepOrangeAccent,
          leading: Container(),
          title: Text(
            "Booking Seats",
            style: TextStyle(
                color: Colors.black.withOpacity(0.5),
                fontSize: 18,
                fontStyle: FontStyle.italic,
                letterSpacing: 1,
                fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
          width: width,
          height: height,
          margin: const EdgeInsets.all(1),
          alignment: Alignment.topCenter,
          child: ListView(
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.topCenter,
                width: 120,
                padding:
                    const EdgeInsets.only(left: 30, right: 70, bottom: 30, top: 10),
                child: dropDownForCinema(),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.topCenter,
                width: 120,
                padding:
                    const EdgeInsets.only(left: 30, right: 70, bottom: 30, top: 10),
                child: dropDownForFilm(),
              ),
              Container(
                alignment: Alignment.topCenter,
                child: Text(
                  "Cinema Screen",
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.4),
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                    fontStyle: FontStyle.italic,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _exampleSeats(
                      containerColor: Colors.transparent,
                      seatsData: "Available"),
                  _exampleSeats(
                      containerColor: Colors.blueAccent, seatsData: "Selected"),
                  _exampleSeats(
                      containerColor: Colors.deepOrange, seatsData: "Booked"),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Center(
                child: _hintFunction("Hint !"),
              ),
              Center(
                child: _hintFunction("Double Tap To Cancel Selected Seats..."),
              ),
              const SizedBox(
                height: 20,
              ),
              (chooseFilmFromDropdown != null &&
                      chooseCinemaFromDropdown != null)
                  ? StreamBuilder<DocumentSnapshot>(
                      stream: bookedFilmName
                          .doc((chooseFilmFromDropdown == 'Antlers')
                              ? 'H_ant'
                              : (chooseFilmFromDropdown == 'Tom & Jerry')
                                  ? '1A_t&m'
                                  : (chooseFilmFromDropdown == 'Boss Baby 2')
                                      ? '1A_babyboss'
                                      : (chooseFilmFromDropdown ==
                                              'Super-Intelligence')
                                          ? 'C_super'
                                          : (chooseFilmFromDropdown ==
                                                  'Hubie Halloween')
                                              ? 'C_hubie'
                                              : (chooseFilmFromDropdown ==
                                                      'Freaky')
                                                  ? 'C_freaky'
                                                  : (chooseFilmFromDropdown ==
                                                          'All My Life')
                                                      ? 'R_all'
                                                      : (chooseFilmFromDropdown ==
                                                              'Life In A Year')
                                                          ? 'R_life'
                                                          : (chooseFilmFromDropdown ==
                                                                  'Stars Fell On Alabama')
                                                              ? 'R_star'
                                                              : (chooseFilmFromDropdown ==
                                                                      'Avatar 2')
                                                                  ? 'F_avatar'
                                                                  : (chooseFilmFromDropdown ==
                                                                          'Morbius')
                                                                      ? 'F_mor'
                                                                      : (chooseFilmFromDropdown ==
                                                                              'Infinite 2')
                                                                          ? 'F_inf'
                                                                          : (chooseFilmFromDropdown == 'No Time To Die')
                                                                              ? 'AC_notime'
                                                                              : (chooseFilmFromDropdown == 'Free Guy')
                                                                                  ? 'AC_free'
                                                                                  : (chooseFilmFromDropdown == 'Fast & Furious 9')
                                                                                      ? 'AC_f9'
                                                                                      : (chooseFilmFromDropdown == 'Conjuring 3')
                                                                                          ? 'H_conj'
                                                                                          : (chooseFilmFromDropdown == 'Grudge')
                                                                                              ? 'H_grud'
                                                                                              : '1A_raya')
                          .snapshots(),
                      builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                        if (snapshot.hasError) {
                          return const Text("Error while Loading try again...");
                        }
                        if (snapshot.connectionState == ConnectionState.done ||
                            snapshot.hasData) {
                          a1 = snapshot.data!['A1'];
                          a2 = snapshot.data!['A2'];
                          a3 = snapshot.data!['A3'];
                          b1 = snapshot.data!['B1'];
                          b2 = snapshot.data!['B2'];
                          b3 = snapshot.data!['B3'];
                          b4 = snapshot.data!['B4'];
                          b5 = snapshot.data!['B5'];
                          c1 = snapshot.data!['C1'];
                          c2 = snapshot.data!['C2'];
                          c3 = snapshot.data!['C3'];
                          c4 = snapshot.data!['C4'];
                          c5 = snapshot.data!['C5'];
                          d1 = snapshot.data!['D1'];
                          d2 = snapshot.data!['D2'];
                          d3 = snapshot.data!['D3'];
                          d4 = snapshot.data!['D4'];
                          d5 = snapshot.data!['D5'];
                          e1 = snapshot.data!['E1'];
                          e2 = snapshot.data!['E2'];
                          e3 = snapshot.data!['E3'];
                          e4 = snapshot.data!['E4'];
                          e5 = snapshot.data!['E5'];

                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  _seats("A1",
                                      clickedContainerColor: (a1 == 'Booked')
                                          ? bookedColor
                                          : (a1 == 'Selected')
                                              ? Colors.blue
                                              : Colors.transparent),
                                  _seats("A2",
                                      clickedContainerColor: (a2 == 'Booked')
                                          ? bookedColor
                                          : (a2 == 'Selected')
                                              ? Colors.blue
                                              : Colors.transparent),
                                  _seats("A3",
                                      clickedContainerColor: (a3 == 'Booked')
                                          ? bookedColor
                                          : (a3 == 'Selected')
                                              ? Colors.blue
                                              : Colors.transparent),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  _seats("B1",
                                      clickedContainerColor: (b1 == 'Booked')
                                          ? bookedColor
                                          : (b1 == 'Selected')
                                              ? Colors.blue
                                              : Colors.transparent),
                                  _seats("B2",
                                      clickedContainerColor: (b2 == 'Booked')
                                          ? bookedColor
                                          : (b2 == 'Selected')
                                              ? Colors.blue
                                              : Colors.transparent),
                                  _seats("B3",
                                      clickedContainerColor: (b3 == 'Booked')
                                          ? bookedColor
                                          : (b3 == 'Selected')
                                              ? Colors.blue
                                              : Colors.transparent),
                                  _seats("B4",
                                      clickedContainerColor: (b4 == 'Booked')
                                          ? bookedColor
                                          : (b4 == 'Selected')
                                              ? Colors.blue
                                              : Colors.transparent),
                                  _seats("B5",
                                      clickedContainerColor: (b5 == 'Booked')
                                          ? bookedColor
                                          : (b5 == 'Selected')
                                              ? Colors.blue
                                              : Colors.transparent)
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  _seats("C1",
                                      clickedContainerColor: (c1 == 'Booked')
                                          ? bookedColor
                                          : (c1 == 'Selected')
                                              ? Colors.blue
                                              : Colors.transparent),
                                  _seats("C2",
                                      clickedContainerColor: (c2 == 'Booked')
                                          ? bookedColor
                                          : (c2 == 'Selected')
                                              ? Colors.blue
                                              : Colors.transparent),
                                  _seats("C3",
                                      clickedContainerColor: (c3 == 'Booked')
                                          ? bookedColor
                                          : (c3 == 'Selected')
                                              ? Colors.blue
                                              : Colors.transparent),
                                  _seats("C4",
                                      clickedContainerColor: (c4 == 'Booked')
                                          ? bookedColor
                                          : (c4 == 'Selected')
                                              ? Colors.blue
                                              : Colors.transparent),
                                  _seats("C5",
                                      clickedContainerColor: (c5 == 'Booked')
                                          ? bookedColor
                                          : (c5 == 'Selected')
                                              ? Colors.blue
                                              : Colors.transparent)
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  _seats("D1",
                                      clickedContainerColor: (d1 == 'Booked')
                                          ? bookedColor
                                          : (d1 == 'Selected')
                                              ? Colors.blue
                                              : Colors.transparent),
                                  _seats("D2",
                                      clickedContainerColor: (d2 == 'Booked')
                                          ? bookedColor
                                          : (d2 == 'Selected')
                                              ? Colors.blue
                                              : Colors.transparent),
                                  _seats("D3",
                                      clickedContainerColor: (d3 == 'Booked')
                                          ? bookedColor
                                          : (d3 == 'Selected')
                                              ? Colors.blue
                                              : Colors.transparent),
                                  _seats("D4",
                                      clickedContainerColor: (d4 == 'Booked')
                                          ? bookedColor
                                          : (d4 == 'Selected')
                                              ? Colors.blue
                                              : Colors.transparent),
                                  _seats("D5",
                                      clickedContainerColor: (d5 == 'Booked')
                                          ? bookedColor
                                          : (d5 == 'Selected')
                                              ? Colors.blue
                                              : Colors.transparent)
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  _seats("E1",
                                      clickedContainerColor: (e1 == 'Booked')
                                          ? bookedColor
                                          : (e1 == 'Selected')
                                              ? Colors.blue
                                              : Colors.transparent),
                                  _seats("E2",
                                      clickedContainerColor: (e2 == 'Booked')
                                          ? bookedColor
                                          : (e2 == 'Selected')
                                              ? Colors.blue
                                              : Colors.transparent),
                                  _seats("E3",
                                      clickedContainerColor: (e3 == 'Booked')
                                          ? bookedColor
                                          : (e3 == 'Selected')
                                              ? Colors.blue
                                              : Colors.transparent),
                                  _seats("E4",
                                      clickedContainerColor: (e4 == 'Booked')
                                          ? bookedColor
                                          : (e4 == 'Selected')
                                              ? Colors.blue
                                              : Colors.transparent),
                                  _seats("E5",
                                      clickedContainerColor: (e5 == 'Booked')
                                          ? bookedColor
                                          : (e5 == 'Selected')
                                              ? Colors.blue
                                              : Colors.transparent)
                                ],
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                              _bookingButton(),
                            ],
                          );
                        }
                        return Container();
                      })
                  : const Center(child: Text("Select Film Name & Cinema Name..."))
            ],
          ),
        ),
      ),
    );
  }
}
