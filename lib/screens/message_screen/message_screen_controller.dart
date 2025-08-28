import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'dart:async';

import '../../models/user_model.dart';
import '../../services/user_base_controller.dart';

class MessageScreenController extends GetxController {
  final TextEditingController searchController = TextEditingController();
  List<UserModel> userList = [];
  StreamSubscription<QuerySnapshot<Map<String, dynamic>>>? subscription;

  void getUsers() async {
    try {
      final user =
          await FirebaseFirestore.instance
              .collection(UserModel.tableName)
              .where('uid', isNotEqualTo: UserBaseController.userData.uid)
              .get();
      if (user.docs.isNotEmpty) {
        userList =
            user.docs
                .map((e) {
                  return UserModel.fromMap(e.data());
                })
                .where((element) {
                  return element.matches!.contains(
                    UserBaseController.userData.uid,
                  );
                })
                .toList();
      }
      update();
      print('---------------->>>>>>>>>>>>>>>>>>>>>${userList.length}');
    } catch (e) {
      showOkAlertDialog(
        context: Get.context!,
        title: 'Error',
        message: 'Please select your image.',
      );
    }
  }

  @override
  void onInit() {
    getUsers();
    super.onInit();
  }
}
