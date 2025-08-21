import 'package:destined_app/screens/login_screen/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ProfileScreenController extends GetxController {
  String selectedChoice = 'Pictures';
  List<String> choiceList = ['Pictures', 'Videos'];
  List<String> interestList = ['Music', 'Gaming'];

  void logOut() {
    FirebaseAuth.instance.signOut();
    Get.offAll(() => LoginScreen());
  }

  void selectChoiceListOption(int index) {
    selectedChoice = choiceList[index];
    update();
  }
}
