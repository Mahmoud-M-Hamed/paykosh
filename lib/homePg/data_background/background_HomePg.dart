import 'dart:ui';
import 'package:flutter/material.dart';

class backgroundHomePage extends StatelessWidget {

  final String? backgroundImage;
  const backgroundHomePage({super.key, this.backgroundImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: ExactAssetImage(backgroundImage!), fit: BoxFit.cover),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
          ),
        ),
      ),
    );
  }
}
