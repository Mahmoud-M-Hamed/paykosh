import 'dart:ui' show ImageFilter;

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BackgroundPg extends StatelessWidget {
  String? backgroundName;
  BackgroundPg({super.key, required this.backgroundName});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: ExactAssetImage("$backgroundName"),
          fit: BoxFit.cover,
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaY: 4,sigmaX: 4
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
          ),
        ),
      ),
    );
  }
}
