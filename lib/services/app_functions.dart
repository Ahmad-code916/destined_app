import 'package:flutter/widgets.dart';

class AppFunctions {
  static Widget height(double height) {
    return SizedBox(height: height);
  }

  static BorderRadius borderRadius(double radius) {
    return BorderRadius.all(Radius.circular(radius));
  }
}
