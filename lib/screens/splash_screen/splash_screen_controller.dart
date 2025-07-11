import 'package:destined_app/screens/loading_screen/loading_screen.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    Future.delayed(Duration(seconds: 3), () {
      Get.offAll(() => LoadingScreen());
    });
    super.onInit();
  }
}
