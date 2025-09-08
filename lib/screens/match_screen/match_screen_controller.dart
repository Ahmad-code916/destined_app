import 'package:destined_app/screens/message_screen/message_screen.dart';
import 'package:get/get.dart';

class MatchScreenController extends GetxController {
  @override
  void onInit() {
    Future.delayed(Duration(seconds: 3), () {
      Get.to(() => MessageScreen());
    });
    super.onInit();
  }
}
