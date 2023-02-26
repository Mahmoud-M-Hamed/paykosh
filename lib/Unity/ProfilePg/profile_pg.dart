import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

// ignore: must_be_immutable
class ProfilePage extends StatelessWidget {
  double? height, width;

  ProfilePage({super.key});


  Divider divider() {
    return Divider(
      indent: 50,
      endIndent: 50,
      height: 2,
      thickness: 2,
      color: Colors.black.withOpacity(0.2),
    );
  }

  AlertDialog contactUs(BuildContext context) {
    return AlertDialog(
        contentPadding: const EdgeInsets.all(12),
        title: const Text("- Contact US !"),
        content: SizedBox(
          height: 190,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text("Malak : 01096784073"),
              const SizedBox(
                height: 10,
              ),
              divider(),
              const SizedBox(
                height: 20,
              ),
              const Text("Alaa : 01120055168"),
              const SizedBox(
                height: 10,
              ),
              divider(),
              const SizedBox(
                height: 20,
              ),
              const Text("Mahmoud : 01225554005")
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    var firebaseUserId = FirebaseAuth.instance.currentUser!.uid;
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection("users");

    Widget userInfo(IconData iconData, {name, phoneNumber, email}) {
      return StreamBuilder<DocumentSnapshot>(
        stream: collectionReference.doc(firebaseUserId).snapshots(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text("Error while Loading...");
          }
          if (snapshot.connectionState == ConnectionState.done ||
              snapshot.hasData) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  iconData,
                  color: Colors.deepOrange,
                  size: 28,
                ),
                const SizedBox(
                  width: 12,
                ),
                Text(
                  (name == snapshot.data!['User Name'])
                      ? ("User Name: $name")
                      : (email == snapshot.data!['E-Mail'])
                      ? ("E-mail: $email")
                      : (phoneNumber == snapshot.data!['Phone Number'])
                      ? ("Phone Number: $phoneNumber")
                      : '',
                  style: TextStyle(
                    letterSpacing: 1,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Colors.black.withOpacity(0.8),
                  ),
                  maxLines: 3,
                )
              ],
            );
          }
          return Container();
        },
      );
    }

    Widget documentDataFirestore(
        String dataFromFireStoreData, IconData iconData) {
      return StreamBuilder<DocumentSnapshot>(
          stream: collectionReference.doc(firebaseUserId).snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text("Error while Loading...");
            }
            if (snapshot.connectionState == ConnectionState.done ||
                snapshot.hasData) {
              if (dataFromFireStoreData == 'User Name') {
                return userInfo(iconData,
                    name: "${snapshot.data![dataFromFireStoreData]}");
              }
              if (dataFromFireStoreData == 'E-Mail') {
                return userInfo(Icons.email_sharp,
                    email: "${snapshot.data![dataFromFireStoreData]}");
              }
              if (dataFromFireStoreData == 'Phone Number') {
                return userInfo(Icons.phone,
                    phoneNumber: "${snapshot.data![dataFromFireStoreData]}");
              }
            }
            return Container();
          });
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          leading: Icon(Icons.person_pin,
              color: Colors.black.withOpacity(0.7), size: 35),
          elevation: 0,
          title: Text(
            "Profile",
            style: TextStyle(
              color: Colors.black.withOpacity(0.6),
              fontSize: 18,
              fontStyle: FontStyle.italic,
              letterSpacing: 2,
            ),
          ),
        ),
        body: Container(
          width: width,
          height: height,
          margin: const EdgeInsets.only(right: 15, left: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 90),
              (FirebaseAuth.instance.currentUser!.photoURL != null)
              ? CircleAvatar(
                radius: 60,
                backgroundImage:
                        NetworkImage(
                            "${FirebaseAuth.instance.currentUser!.photoURL}"),
                backgroundColor: Colors.transparent,
              )
              : const CircleAvatar(
                radius: 60,
                backgroundImage:
                ExactAssetImage("images/logo.png"),
                backgroundColor: Colors.transparent,
              ),

              // <--------------------------------------- ^^ Image if user local login set defult avatar-------------------------
              const SizedBox(
                height: 50,
              ),
              documentDataFirestore('User Name', Icons.person),
              const SizedBox(
                height: 10,
              ),
              divider(),
              const SizedBox(
                height: 30,
              ),
              documentDataFirestore('E-Mail', Icons.email_sharp),
              const SizedBox(
                height: 10,
              ),
              divider(),
              const SizedBox(
                height: 30,
              ),
              documentDataFirestore('Phone Number', Icons.phone),
              const SizedBox(
                height: 10,
              ),
              divider(),
              const SizedBox(
                height: 50,
              ),
              Container(
                alignment: Alignment.topCenter,
                width: 190,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                ),
                child: ListTile(
                  selected: true,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  title: const Text(
                    "Contact US",
                    style: TextStyle(color: Colors.lightBlueAccent),
                  ),
                  minLeadingWidth: 0,
                  leading: const Icon(
                    Icons.auto_awesome,
                    size: 25,
                    color: Colors.lightBlueAccent,
                  ),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: contactUs,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
