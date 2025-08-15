import 'package:get/get.dart';

import '../models/user_model.dart';

class UserBaseController extends GetxController {
  var userModel = UserModel();

  static void updateUserModel(UserModel adminModel) {
    final controller = Get.put(UserBaseController(), permanent: true);
    controller.userModel = adminModel;
    controller.update();
  }

  static UserModel get userData {
    return Get.put(UserBaseController(), permanent: true).userModel;
  }
}
