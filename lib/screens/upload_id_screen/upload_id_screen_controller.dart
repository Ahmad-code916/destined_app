import 'package:get/get.dart';

class UploadIdScreenController extends GetxController {
  bool showUploadImage = false;

  void toggleImage() {
    showUploadImage = !showUploadImage;
    update();
  }
}
