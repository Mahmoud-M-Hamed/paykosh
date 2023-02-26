import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'backgroundPg.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'loginScreen.dart';
import 'login_or_signup.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  final GlobalKey<FormState> _formKey_2 = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();


  final String _email = "E-Mail: ",
      _password = "Password: ",
      _confirmPassword = "Confirm Password...",
      _userName = "User-Name:";

  DateTime timeNow = DateTime.now();

  Widget _backToLoginOrSignup(BuildContext context) {
    return const LoginOrSignup();
  }

  Widget _backToLogin(BuildContext context) {
    return const LoginPg();
  }


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundPg(backgroundName: "assets/images/image_35.jpg"),
        SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              leading: IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: _backToLoginOrSignup));
                  }),
              elevation: 0,
            ),
            body: ListView(
              children: [
                Container(
                  alignment: Alignment.topCenter,
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
                  margin: const EdgeInsets.only(top: 20),
                  child: Form(
                    key: _formKey_2,
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 27, right: 27),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(22),
                            color: Colors.white.withOpacity(0.2),
                          ),
                          child: TextFormField(
                            controller: _usernameController,
                            validator: (userName) {
                              if (userName!.isEmpty) {
                                return "InValid User-Name";
                              }
                              if (userName.length <= 4) {
                                return "Your User-Name Must be at least 5 characters";
                              }
                              return null;
                            },
                            style: const TextStyle(
                                color: Colors.white70,
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.italic),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: const EdgeInsets.all(10),
                              prefixIcon: const Icon(
                                Icons.person,
                                size: 30,
                              ),
                              labelText: _userName,
                              labelStyle: const TextStyle(
                                fontStyle: FontStyle.italic,
                                fontSize: 18,
                                letterSpacing: 1,
                                fontFamily: "XanhMono",
                                fontWeight: FontWeight.bold,
                              ),
                              hintText: "Enter Your Name:",
                              hintStyle: TextStyle(
                                  color: Colors.white.withOpacity(0.4)),
                            ),
                            keyboardType: TextInputType.name,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 17, left: 27, right: 27),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(22),
                            color: Colors.white.withOpacity(0.2),
                          ),
                          child: TextFormField(
                            controller: _phoneNumberController,
                            validator: (phoneNumber) {
                              if (phoneNumber!.isEmpty) {
                                return "Invalid Number";
                              }
                              if ((phoneNumber.length < 11) ||
                                  (phoneNumber.length > 11)) {
                                return "Your Number Must be 11 digits";
                              }
                              return null;
                            },
                            style: const TextStyle(
                                color: Colors.white70,
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.italic),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: const EdgeInsets.all(10),
                              prefixIcon: const Icon(
                                Icons.phone,
                                size: 30,
                              ),
                              labelText: "Phone-Number:",
                              labelStyle: const TextStyle(
                                fontStyle: FontStyle.italic,
                                fontSize: 18,
                                letterSpacing: 1,
                                fontFamily: "XanhMono",
                                fontWeight: FontWeight.bold,
                              ),
                              hintText: "Enter Your Number:",
                              hintStyle: TextStyle(
                                  color: Colors.white.withOpacity(0.4)),
                            ),
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 17, left: 27, right: 27),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(22),
                          ),
                          child: TextFormField(
                            controller: _emailController,
                            validator: (emailValue) {
                              if (emailValue!.isEmpty) {
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
                          margin: const EdgeInsets.only(top: 17, right: 27, left: 27),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(22),
                          ),
                          child: TextFormField(
                            validator: (passwordValue) {
                              if (passwordValue!.isEmpty) {
                                return "Invalid Password";
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
                          margin: const EdgeInsets.only(top: 17, right: 27, left: 27),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(22),
                          ),
                          child: TextFormField(
                            controller: _confirmPasswordController,
                            validator: (confirmPassword) {
                              if ((confirmPassword!.isEmpty) ||
                                  (_passwordController.text !=
                                      _confirmPasswordController.text)) {
                                return "Passwords Not Same";
                              }
                              return null;
                            },
                            keyboardType: TextInputType.emailAddress,
                            obscureText: true,
                            style: const TextStyle(
                                color: Colors.white70,
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.italic),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              labelText: _confirmPassword,
                              labelStyle: const TextStyle(
                                fontStyle: FontStyle.italic,
                                fontSize: 18,
                                letterSpacing: 1,
                                fontFamily: "XanhMono",
                              ),
                              hintText: "Enter Your Password Again: ",
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
                              top: 70, bottom: 20, left: 20, right: 20),
                          // ignore: deprecated_member_use
                          child: MaterialButton(
                            padding: const EdgeInsets.all(0),
                            color: Colors.white.withOpacity(0.8),
                            onPressed: () async {
                              if (_formKey_2.currentState!.validate()) {
                                 await FirebaseAuth.instance
                                    .createUserWithEmailAndPassword(
                                    email: _emailController.text,
                                    password: _passwordController.text).whenComplete(()
                                async => await FirebaseFirestore.instance.collection(
                                    'users')
                                    .doc(FirebaseAuth.instance.currentUser!.uid).set({
                                  'User Name': _usernameController.text,
                                  'Phone Number': _phoneNumberController.text,
                                  'E-Mail': _emailController.text,
                                  'Password': _passwordController.text,
                                }).whenComplete(() => Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(builder: _backToLogin)))
                                );
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
                                "SignUp...",
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
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
