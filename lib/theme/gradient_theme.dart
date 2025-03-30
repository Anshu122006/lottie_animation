import 'package:flutter/material.dart';

class GradientTheme extends ThemeExtension<GradientTheme> {
  final Gradient? primaryGradient;
  final Gradient? secondaryGradient;
  final Gradient? surfaceGradient;
  final Gradient? appBarGradient;

  GradientTheme({
    this.primaryGradient,
    this.secondaryGradient,
    this.surfaceGradient,
    this.appBarGradient,
  });

  @override
  GradientTheme copyWith({
    Gradient? primaryGradient,
    Gradient? secondaryGradient,
    Gradient? surfaceGradient,
    Gradient? appBarGradient,
  }) {
    return GradientTheme(
      primaryGradient: primaryGradient ?? this.primaryGradient,
      secondaryGradient: secondaryGradient ?? this.secondaryGradient,
      surfaceGradient: surfaceGradient ?? this.surfaceGradient,
      appBarGradient: appBarGradient ?? this.appBarGradient,
    );
  }

  @override
  GradientTheme lerp(GradientTheme? other, double t) {
    if (other is! GradientTheme) return this;
    return GradientTheme(
      primaryGradient: LinearGradient(
        colors: List.generate(
          primaryGradient?.colors.length ?? 0,
          (i) =>
              Color.lerp(
                primaryGradient!.colors[i],
                other.primaryGradient!.colors[i],
                t,
              )!,
        ),
      ),
      secondaryGradient: LinearGradient(
        colors: List.generate(
          primaryGradient?.colors.length ?? 0,
          (i) =>
              Color.lerp(
                primaryGradient!.colors[i],
                other.primaryGradient!.colors[i],
                t,
              )!,
        ),
      ),
      surfaceGradient: LinearGradient(
        colors: List.generate(
          primaryGradient?.colors.length ?? 0,
          (i) =>
              Color.lerp(
                primaryGradient!.colors[i],
                other.primaryGradient!.colors[i],
                t,
              )!,
        ),
      ),
      appBarGradient: LinearGradient(
        colors: List.generate(
          primaryGradient?.colors.length ?? 0,
          (i) =>
              Color.lerp(
                primaryGradient!.colors[i],
                other.primaryGradient!.colors[i],
                t,
              )!,
        ),
      ),
    );
  }
}
