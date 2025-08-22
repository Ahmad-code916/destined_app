import 'package:destined_app/screens/login_screen/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ProfileScreenController extends GetxController {
  String selectedChoice = 'Pictures';
  List<String> choiceList = ['Pictures', 'Videos'];
  List<String> interestList = ['Music', 'Gaming'];
  bool isLoading = false;

  void logOut() {
    isLoading = true;
    update();
    FirebaseAuth.instance.signOut();
    Get.offAll(() => LoginScreen());
    isLoading = false;
    update();
  }

  void selectChoiceListOption(int index) {
    selectedChoice = choiceList[index];
    update();
  }
}
