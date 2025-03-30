import 'package:animations/utils/constants/constants.dart';
import 'package:animations/theme/gradient_theme.dart';
import 'package:flutter/material.dart';

class AppThemes {
  static ThemeData light = ThemeData(
    brightness: Brightness.light,
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        color: CColors.headingColor,
        fontSize: CNumbers.headingSize,
        fontWeight: FontWeight.bold,
      ),
    ),
    extensions: <ThemeExtension>[
      GradientTheme(
        surfaceGradient: CGradients.surfaceGradient,
        primaryGradient: CGradients.primaryGradient,
        appBarGradient: CGradients.appBarGradient,
      ),
    ],
    colorScheme: ColorScheme.light(
      surface: CColors.surfaceColor,
      primary: CColors.primaryColor,
      shadow: CColors.shadowColor,
      error: CColors.errorColor,
    ),
  );
}
