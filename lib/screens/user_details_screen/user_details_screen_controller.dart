import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:destined_app/models/user_model.dart';
import 'package:get/get.dart';

class UserDetailsScreenController extends GetxController {
  String selectedChoice = 'Pictures';
  List<String> choiceList = ['Pictures', 'Videos'];
  List<String> interestList = ['Music', 'Gaming'];
  late String uid;
  UserModel? userData;
  bool isLoading = false;

  void selectChoiceListOption(int index) {
    selectedChoice = choiceList[index];
    update();
  }

  Future getUserData() async {
    try {
      isLoading = true;
      update();
      final user =
          await FirebaseFirestore.instance
              .collection(UserModel.tableName)
              .doc(uid)
              .get();
      if (user.exists) {
        userData = UserModel.fromMap(user.data()!);
        print('^^^^^^^^^^^^^^^^^^^^^^^^^^^^${userData?.name ?? ""}');
        isLoading = false;
        update();
      } else {
        isLoading = false;
        update();
        showOkAlertDialog(
          context: Get.context!,
          title: 'Error',
          message: 'User not found.',
        );
      }
    } catch (e) {
      isLoading = false;
      update();
      showOkAlertDialog(
        context: Get.context!,
        title: 'Error',
        message: e.toString(),
      );
    }
  }

  @override
  void onInit() {
    uid = Get.arguments['uid'];
    print('^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^$uid');
    getUserData();
    super.onInit();
  }
}
