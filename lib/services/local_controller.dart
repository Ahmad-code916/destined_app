import 'package:get/get.dart';
import 'package:flutter/material.dart';

class LocalController extends GetxController {
  Locale currentLocale = Locale('en', 'US');

  void showDialoge() {
    Get.dialog(
      AlertDialog(
        title: Text('Update Language'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
              onPressed: () {
                Get.updateLocale(Locale('en', 'US'));
                currentLocale = Locale('en', 'US');
                Get.back();
                update();
              },
              child: Text('English'),
            ),
            TextButton(
              onPressed: () {
                Get.updateLocale(Locale('ur', 'PK'));
                currentLocale = Locale('ur', 'PK');
                Get.back();
                update();
              },
              child: Text('Urdu'),
            ),
          ],
        ),
      ),
    );
  }
}
