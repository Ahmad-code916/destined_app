import 'package:get/get.dart';

class UserDetailsScreenController extends GetxController {
  String selectedChoice = 'Pictures';
  List<String> choiceList = ['Pictures', 'Videos'];
  List<String> interestList = ['Music', 'Gaming'];

  void selectChoiceListOption(int index) {
    selectedChoice = choiceList[index];
    update();
  }
}
