import 'package:destined_app/models/user_model.dart';
import 'package:get/get.dart';

class UploadIdScreenController extends GetxController {
  late UserModel userModel;
  bool showUploadImage = false;

  void toggleImage() {
    showUploadImage = !showUploadImage;
    update();
  }

  @override
  void onInit() {
    userModel = Get.arguments['userModel'];
    super.onInit();
  }
}
