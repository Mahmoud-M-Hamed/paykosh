import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:paykosh/homePg/BottomNavBar/bottom_nav_bar.dart';
import 'backgroundPg.dart';
import 'login_or_signup.dart';

class LoginPg extends StatefulWidget {
  const LoginPg({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginPgState createState() => _LoginPgState();
}

class _LoginPgState extends State<LoginPg> {
  final _formkey_1 = GlobalKey<FormState>();
  final _formkey_2 = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  final String _email = "E-Mail: ", _password = "Password: ";

  Widget _goToHomePage(BuildContext context) {
    return BotNavBar();
  }

  Widget _goToLoginOrSignup(BuildContext context) {
    return const LoginOrSignup();
  }

  AlertDialog showAlertDialog2(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.all(12),
      title: const Text(
        "Phone Number to contact !",
        style: TextStyle(fontSize: 17),
      ),
      content: Form(
        key: _formkey_2,
        child: TextFormField(
          controller: _phoneNumberController,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          decoration: InputDecoration(
            prefixIcon: const Icon(
              Icons.phone,
              size: 25,
            ),
            labelText: "Phone-Number",
            hintText: "Enter Your Phone-Number : ",
            hintStyle: TextStyle(color: Colors.white.withOpacity(0.4)),
            contentPadding: const EdgeInsets.all(10),
            labelStyle: const TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 18,
              letterSpacing: 1,
              fontFamily: "XanhMono",
            ),
          ),
          validator: (phoneValue) {
            if (phoneValue!.isEmpty) {
              return "Invalid phone Number : Please Enter phone Number.";
            }
            if (phoneValue.length > 11 || phoneValue.length < 11) {
              return "Your phone Number Must be 11 digits.";
            }
            return null;
          },
        ),
      ),
      actions: [
        // ignore: deprecated_member_use
        MaterialButton(
          onPressed: () async {
            if (FirebaseAuth.instance.currentUser!.uid.isNotEmpty &&
                _phoneNumberController.text.isNotEmpty &&
                _phoneNumberController.text.length == 11) {
              await FirebaseFirestore.instance
                  .collection("users")
                  .doc(FirebaseAuth.instance.currentUser!.uid)
                  .set({
                'User Name': FirebaseAuth.instance.currentUser!.displayName,
                'E-Mail': FirebaseAuth.instance.currentUser!.email,
                'Phone Number': _phoneNumberController.text,
                'Id': FirebaseAuth.instance.currentUser!.uid,
                'PhotoURL': FirebaseAuth.instance.currentUser!.photoURL,
              }).whenComplete(() => Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: _goToHomePage)));
            }
          },
          child: const Text(
            "ok",
            style: TextStyle(
              color: Colors.deepOrangeAccent,
            ),
          ),
        ),
      ],
    );
  }

  // ignore: non_constant_identifier_names
  Future<void> SignInWithGoogle(BuildContext context) async {
    GoogleSignInAccount? googleSignInAccount = await GoogleSignIn().signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount!.authentication;

    AuthCredential authCredential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);
    await FirebaseAuth.instance.signInWithCredential(authCredential);
  }

  Future<void> signOut(BuildContext context) async {
    await GoogleSignIn().signOut().whenComplete(
          () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: _goToLoginOrSignup),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundPg(
          backgroundName: "assets/images/image_56.jpg",
        ),
        SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              leading: IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: _goToLoginOrSignup));
                  }),
              elevation: 0,
            ),
            body: ListView(
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  margin: const EdgeInsets.only(top: 50),
                  child: Image.asset(
                    "assets/images/logo.png",
                    height: 80,
                    width: 90,
                    fit: BoxFit.cover,
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
                Container(
                  alignment: Alignment.topCenter,
                  margin: const EdgeInsets.only(top: 2),
                  child: Text(
                    "Paykosh",
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.6),
                      fontStyle: FontStyle.italic,
                      fontSize: 30,
                      letterSpacing: 5,
                      fontFamily: "Pacifico",
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.topCenter,
                  margin: const EdgeInsets.only(top: 70),
                  child: Form(
                    key: _formkey_1,
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 27, right: 27),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(22),
                          ),
                          child: TextFormField(
                            controller: _emailController,
                            validator: (emailValue) {
                              if (emailValue!.isEmpty ||
                                  FirebaseAuth
                                      .instance.currentUser!.uid.isEmpty) {
                                return "Invaild E-Mail.";
                              }
                              if (emailValue.length <= 16) {
                                return "Your E-Mail Must be at least 16 characters";
                              }
                              if (emailValue.contains("@") != true ||
                                  emailValue.contains("paykosh") != true ||
                                  emailValue.contains(".") != true) {
                                return "Must Have @paykosh.com";
                              }
                              return null;
                            },
                            style: const TextStyle(
                                color: Colors.white70,
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.italic),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: const Icon(
                                Icons.email_sharp,
                                size: 25,
                              ),
                              labelText: _email,
                              hintText: "Enter Your E-Mail : ",
                              hintStyle: TextStyle(
                                  color: Colors.white.withOpacity(0.4)),
                              contentPadding: const EdgeInsets.all(10),
                              labelStyle: const TextStyle(
                                fontStyle: FontStyle.italic,
                                fontSize: 18,
                                letterSpacing: 1,
                                fontFamily: "XanhMono",
                              ),
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              top: 17, left: 27, right: 27),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(22),
                          ),
                          child: TextFormField(
                            validator: (passwordValue) {
                              if (passwordValue!.isEmpty) {
                                return "Invalid Password : Please Enter Password.";
                              }
                              if (passwordValue.length <= 6) {
                                return "Your Password Must be at least 7 digits or Characters.";
                              }
                              return null;
                            },
                            controller: _passwordController,
                            keyboardType: TextInputType.emailAddress,
                            obscureText: true,
                            style: const TextStyle(
                                color: Colors.white70,
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.italic),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              labelText: _password,
                              labelStyle: const TextStyle(
                                fontStyle: FontStyle.italic,
                                fontSize: 18,
                                letterSpacing: 1,
                                fontFamily: "XanhMono",
                              ),
                              hintText: "Enter Your Password : ",
                              hintStyle: TextStyle(
                                  color: Colors.white.withOpacity(0.4)),
                              prefixIcon: const Icon(
                                Icons.vpn_key_outlined,
                                size: 25,
                              ),
                              contentPadding: const EdgeInsets.all(10),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              top: 90, left: 20, right: 20),
                          child: MaterialButton(
                            // ignore: deprecated_member_use
                            padding: const EdgeInsets.all(0),
                            color: Colors.white.withOpacity(0.8),
                            onPressed: () async {
                              var formData = _formkey_1.currentState;
                              if (formData!.validate()) {
                                await FirebaseAuth.instance
                                    .signInWithEmailAndPassword(
                                        email: _emailController.text,
                                        password: _passwordController.text)
                                    .whenComplete(() => Navigator.of(context)
                                        .pushReplacement(MaterialPageRoute(
                                            builder: _goToHomePage)));
                              }
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                            splashColor: Colors.deepOrange.withOpacity(0.3),
                            child: Container(
                              padding: const EdgeInsets.only(
                                left: 100,
                                right: 100,
                                top: 13,
                                bottom: 13,
                              ),
                              child: const Text(
                                "SignIn...",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontStyle: FontStyle.italic,
                                  fontSize: 20,
                                  fontFamily: "XanhMono",
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Or SignIn With  ",
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.7),
                                    letterSpacing: 1,
                                    fontStyle: FontStyle.italic),
                              ),
                              InkWell(
                                borderRadius: BorderRadius.circular(35),
                                child: Image.asset(
                                  "assets/images/google.png",
                                  width: 50,
                                  height: 50,
                                ),
                                onTap: () async {
                                  await SignInWithGoogle(context).then(
                                    (value) => showDialog(
                                      context: context,
                                      builder: showAlertDialog2,
                                      barrierDismissible: false,
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
