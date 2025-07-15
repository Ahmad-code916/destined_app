import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class UsersScreenController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  int selectedIndex = 0;

  @override
  void onInit() {
    tabController = TabController(length: 4, vsync: this);
    tabController.addListener(() {
      selectedIndex = tabController.index;
      update();
    });
    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
