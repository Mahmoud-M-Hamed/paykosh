import '../../helper/Colors.dart';
import 'Package:flutter/material.dart';
import 'loginScreen.dart';
import 'signUpScreen.dart';

class LoginOrSignup extends StatefulWidget {
  const LoginOrSignup({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoginOrSignupState();
  }
}

class _LoginOrSignupState extends State<LoginOrSignup> {
  Color2 colors = Color2();

  Widget _goToLogin(BuildContext context) {
    return const LoginPg();
  }

  Widget _goToSignUp(BuildContext context) {
    return const SignUpPage();

  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: ExactAssetImage("assets/images/image-5.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black.withOpacity(0.1),
                Colors.black.withOpacity(0.3)
              ],
              begin: AlignmentDirectional.topCenter,
              end: AlignmentDirectional.bottomCenter,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(
                  top: 120,
                ),
                child: Image.asset(
                  "assets/images/logo.png",
                  height: 90,
                  width: 90,
                  fit: BoxFit.cover,
                  color: Colors.white.withOpacity(0.7),
                ),
              ),
              MaterialButton(
                onPressed: null,
                child: Text(
                  "Paykosh",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontStyle: FontStyle.italic,
                    fontSize: 35,
                    letterSpacing: 5,
                    fontFamily: "Pacifico",
                  ),
                ),
              ),
              MaterialButton(
                onPressed: null,
                child: Text(
                  "Let's get Started ?",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.6),
                    fontStyle: FontStyle.italic,
                    fontSize: 18,
                    letterSpacing: 1,
                    fontFamily: "Redressed",
                  ),
                ),
              ),
              const SizedBox(
                height: 200,
              ),
              Container(
                alignment: Alignment.topCenter,
                child: MaterialButton(
                  padding: const EdgeInsets.all(0),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: _goToLogin));
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  splashColor: colors.gamaly.withOpacity(0.3),
                  highlightColor: Colors.deepOrange.withOpacity(0.4),
                  child: Container(
                    padding: const EdgeInsets.only(
                      left: 100,
                      right: 110,
                      top: 13,
                      bottom: 13,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.white70),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Text(
                      "SignIn",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontStyle: FontStyle.italic,
                        fontSize: 20,
                        letterSpacing: 1,
                        fontFamily: "XanhMono",
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topCenter,
                margin: const EdgeInsets.only(top: 15),
                // ignore: deprecated_member_use
                child: MaterialButton(
                  padding: const EdgeInsets.all(0),
                  color: Colors.white.withOpacity(0.6),
                  onPressed: () {
                //    ShowToast("Let's SignUp !");
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: _goToSignUp),
                    );
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  splashColor: colors.gamaly.withOpacity(0.3),
                  highlightColor: Colors.deepOrange.withOpacity(0.4),
                  child: Container(
                    padding: const EdgeInsets.only(
                      left: 100,
                      right: 100,
                      top: 13,
                      bottom: 13,
                    ),
                    child: Text(
                      "SignUp",
                      style: TextStyle(
                        color: Colors.black.withOpacity(1),
                        fontStyle: FontStyle.italic,
                        fontSize: 20,
                        letterSpacing: 1,
                        fontFamily: "XanhMono",
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
