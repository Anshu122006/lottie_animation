import 'package:flutter/widgets.dart';

class HDimensions {
  static double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double statusHeight(BuildContext context) {
    return MediaQuery.of(context).padding.top;
  }
}
