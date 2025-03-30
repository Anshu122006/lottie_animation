import 'package:animations/theme/gradient_theme.dart';
import 'package:flutter/material.dart';

class AddBlock extends StatelessWidget {
  const AddBlock({super.key, required this.ontap});

  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    GradientTheme? gradientTheme = Theme.of(context).extension<GradientTheme>();

    return GestureDetector(
      onTap: ontap,
      child: Opacity(
        opacity: 0.4,
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            gradient: gradientTheme?.primaryGradient,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                blurRadius: 2,
                spreadRadius: 2,
                offset: Offset(3, 3),
                color: Theme.of(context).colorScheme.shadow,
              ),
            ],
          ),
          child: Center(
            child: Transform.scale(
              scale: 3,
              child: Icon(Icons.add, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
