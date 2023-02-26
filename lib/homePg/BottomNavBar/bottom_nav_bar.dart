import "package:flutter/material.dart";
import 'package:paykosh/GoogleMaps/GoogleMapsLocation.dart';
import 'package:paykosh/Unity/ProfilePg/profile_pg.dart';
import 'package:paykosh/booking/bookingSys.dart';
import 'package:paykosh/homePg/home.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class BotNavBar extends StatefulWidget {
  const BotNavBar({super.key});
  @override
  _BotNavBarState createState() => _BotNavBarState();
}

class _BotNavBarState extends State<BotNavBar> {

  int _activeIndexBottomNavBar=0;

  void _onTapBottomNavBar(int index){
    setState(() {
      _activeIndexBottomNavBar = index;
    });
  }

  final List<Widget> _bottomNavItems = [
    const Icon(Icons.home_outlined,color: Colors.deepOrangeAccent,semanticLabel: "Home Icon.",),
    const Icon(Icons.person_outline,color: Colors.deepOrangeAccent,semanticLabel: "Profile Icon",),
    const Icon(Icons.place_outlined,color: Colors.deepOrangeAccent,),
    const Icon(Icons.airplane_ticket_outlined,color: Colors.deepOrangeAccent,),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          IndexedStack(
            index: _activeIndexBottomNavBar,
            children: [
              HomePage(initialPage: 0.0,),
              ProfilePage(),
              const GoogleMapsLocation(),
              BookingSysPg()
            ],
          )
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        items: _bottomNavItems,
        index: _activeIndexBottomNavBar,
        buttonBackgroundColor: Colors.white,
        color: Colors.white,
        backgroundColor: Colors.deepOrangeAccent,
        height: 50,
        animationDuration: const Duration(milliseconds: 800),
        onTap: _onTapBottomNavBar,
      ),
    );
  }
}
