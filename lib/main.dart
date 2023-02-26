import 'package:flutter/services.dart';
import 'package:paykosh/Unity/splashScreen/splashScreen.dart';
import 'Package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Paykosh",
          home: const SplashScreenPage(),
          theme: ThemeData(
            primaryColor: Colors.deepOrangeAccent,
            primarySwatch: Colors.deepOrange,
          ),
        );
  }
}
