import 'dart:async';
import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:destined_app/models/user_model.dart';
import 'package:destined_app/services/user_base_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UsersScreenController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  int selectedIndex = 0;
  List<UserModel> userList = [];
  StreamSubscription<QuerySnapshot<Map<String, dynamic>>>? subscription;

  void getUsers() async {
    try {
      subscription = FirebaseFirestore.instance
          .collection(UserModel.tableName)
          .where('uid', isNotEqualTo: UserBaseController.userData.uid)
          .snapshots()
          .listen((event) {
            if (event.docs.isNotEmpty) {
              userList =
                  event.docs.map((e) {
                    return UserModel.fromMap(e.data());
                  }).toList();
              update();
            }
          });
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
    tabController = TabController(length: 4, vsync: this);
    tabController.addListener(() {
      selectedIndex = tabController.index;
      update();
    });
    getUsers();
    super.onInit();
  }

  @override
  void onClose() async {
    tabController.dispose();
    await subscription?.cancel();
    super.onClose();
  }
}
