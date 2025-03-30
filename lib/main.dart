// import 'package:animations/screen/animation_collage.dart';
import 'package:animations/screen/animation_collage.dart';
// import 'package:animations/screen/input_screen.dart';
import 'package:animations/theme/theme_data.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Animations',
      theme: AppThemes.light,
      home: AnimationCollage(),
    );
  }
}
