import 'package:get/get.dart';

class ProfileScreenController extends GetxController {
  String selectedChoice = 'Pictures';
  List<String> choiceList = ['Pictures', 'Videos'];
  List<String> interestList = ['Music', 'Gaming'];

  void selectChoiceListOption(int index) {
    selectedChoice = choiceList[index];
    update();
  }
}
