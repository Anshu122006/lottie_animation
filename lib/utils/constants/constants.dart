import 'package:flutter/material.dart';

class CNumbers {
  static const double headingSize = 40;
}

class CAnimations {
  static const List<String> animationList = [
    animation1,
    animation2,
    animation3,
    animation4,
    animation5,
    animation6,
    animation7,
    animation8,
    animation9,
  ];

  static const String animation1 = "assets/animations/animation_1.json";
  static const String animation2 = "assets/animations/animation_2.json";
  static const String animation3 = "assets/animations/animation_3.json";
  static const String animation4 = "assets/animations/animation_4.json";
  static const String animation5 = "assets/animations/animation_5.json";
  static const String animation6 = "assets/animations/animation_6.json";
  static const String animation7 = "assets/animations/animation_7.json";
  static const String animation8 = "assets/animations/animation_8.json";
  static const String animation9 = "assets/animations/animation_9.json";
}

class CColors {
  static const Color surfaceColor = Colors.white;
  static const Color primaryColor = Colors.grey;
  static const Color shadowColor = Color.fromARGB(255, 92, 92, 92);
  static const Color errorColor = Colors.redAccent;
  static const Color headingColor = Colors.white;
}

class CGradients {
  static final LinearGradient surfaceGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color.fromARGB(255, 144, 144, 144),
      Color.fromARGB(255, 68, 68, 68),
      Color.fromARGB(255, 68, 68, 68),
      Color.fromARGB(255, 144, 144, 144),
    ],
  );
  static final LinearGradient appBarGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [Color.fromARGB(255, 43, 43, 43), Color.fromARGB(255, 52, 52, 52)],
  );

  static final RadialGradient primaryGradient = RadialGradient(
    center: Alignment.center,
    colors: [
      Color.fromARGB(255, 118, 118, 118),
      Color.fromARGB(255, 60, 60, 60),
      Color.fromARGB(255, 37, 37, 37),
    ],
  );
}
