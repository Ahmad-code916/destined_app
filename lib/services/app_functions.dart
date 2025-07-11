import 'package:flutter/widgets.dart';

class AppFunctions {
  static Widget height(double height) {
    return SizedBox(height: height);
  }

  static Widget width(double width) {
    return SizedBox(width: width);
  }

  static BorderRadius borderRadius(double radius) {
    return BorderRadius.all(Radius.circular(radius));
  }
}
