import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:destined_app/models/user_model.dart';
import 'package:destined_app/screens/home_screen/home_screen.dart';
import 'package:destined_app/screens/interests_screen/interests_screen.dart';
import 'package:destined_app/screens/location_screen/location_screen.dart';
import 'package:destined_app/screens/personal_details_screen/personal_details_screen.dart';
import 'package:destined_app/screens/upload_id_screen/upload_id_screen.dart';
import 'package:destined_app/services/app_functions.dart';
import 'package:destined_app/services/user_base_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    Future.delayed(Duration(seconds: 3), () async {
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) {
        AppFunctions.showSnakBar('Error', 'User not found!');
        Get.offAll(() => PersonalDetailsScreen());
      } else {
        final user =
            await FirebaseFirestore.instance
                .collection(UserModel.tableName)
                .doc(currentUser.uid)
                .get();
        if (user.exists) {
          AppFunctions.showSnakBar('Yes', 'User Exists');
          UserBaseController.updateUserModel(UserModel.fromMap(user.data()!));
          if (UserBaseController.userData.page1 == false) {
            Get.offAll(() => PersonalDetailsScreen());
          } else if (UserBaseController.userData.page2 == false) {
            Get.offAll(
              () => InterestsScreen(),
              arguments: {'userModel': UserBaseController.userData},
            );
          } else if (UserBaseController.userData.page3 == false) {
            Get.offAll(
              () => UploadIdScreen(),
              arguments: {'userModel': UserBaseController.userData},
            );
          } else if (UserBaseController.userData.page4 == false) {
            Get.offAll(
              () => LocationScreen(),
              arguments: {'userModel': UserBaseController.userData},
            );
          } else {
            Get.offAll(() => HomeScreen());
          }
        } else {
          AppFunctions.showSnakBar('Error!', 'User not found');
          Get.offAll(() => PersonalDetailsScreen());
        }
      }
    });
    super.onInit();
  }
}
