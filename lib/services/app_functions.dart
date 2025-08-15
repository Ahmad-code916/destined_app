import 'package:destined_app/utils/app_colors.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

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

  static SnackbarController showSnakBar(String title, String message) {
    return Get.snackbar(title, message, backgroundColor: AppColors.whiteColor);
  }
}
