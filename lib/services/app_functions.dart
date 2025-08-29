import 'dart:math' as math;
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

  static int calculateAge(DateTime dateOfBirth) {
    DateTime today = DateTime.now();
    int age = today.year - dateOfBirth.year;

    if (today.month < dateOfBirth.month ||
        (today.month == dateOfBirth.month && today.day < dateOfBirth.day)) {
      age--;
    }

    return age;
  }

  static String generatedThreadId(String currentUserId, String otherUserId) {
    return currentUserId.compareTo(otherUserId) >= 0
        ? "${currentUserId}__$otherUserId"
        : "${otherUserId}__$currentUserId";
  }

  static String generateRandomId() {
    /// MODIFY CODE ONLY BELOW THIS LINE

    const String chars =
        'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    final math.Random random =
        math.Random(); // Use math.Random() instead of Random()
    return List.generate(
      15,
      (index) => chars[random.nextInt(chars.length)],
    ).join();

    /// MODIFY CODE ONLY ABOVE THIS LINE
  }
}
