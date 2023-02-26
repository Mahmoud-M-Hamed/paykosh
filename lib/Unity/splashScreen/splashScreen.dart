import 'Package:flutter/material.dart';
import 'package:paykosh/Unity/Login_SignUp/login_or_signup.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SplashScreenPageState();
  }
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 8),() => Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const LoginOrSignup())
    ),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: ExactAssetImage('assets/images/image_12.jpg',),
              ),
            ),
          ),
           Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/logo.png",
                  height: 90,
                  width: 90,
                  fit: BoxFit.cover,
                  color: Colors.white.withOpacity(0.7),
                ),
                const Text(
                  "PayKosh",
                  style: TextStyle(
                    color: Colors.white60,
                    fontStyle: FontStyle.italic,
                    fontSize: 35,
                    letterSpacing: 5,
                    fontFamily: "Pacifico",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
