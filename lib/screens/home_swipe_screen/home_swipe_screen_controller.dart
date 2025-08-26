import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:get/get.dart';
import 'dart:async';
import '../../models/user_model.dart';

class HomeSwipeScreenController extends GetxController {
  int currentIndex = 0;
  bool isLoading = false;
  final CardSwiperController swiperController = CardSwiperController();
  List<String> cards2 = ['One', 'Two', 'Three', 'Four'];
  updateIndexOnSwipe(int index) {
    if (index < cards2.length) {
      currentIndex = index;
    }
  }

  List<UserModel> userList = [];
  StreamSubscription<QuerySnapshot<Map<String, dynamic>>>? subscription;

  void getUsers() async {
    try {
      isLoading = true;
      update();
      final user =
          await FirebaseFirestore.instance
              .collection(UserModel.tableName)
              .get();
      if (user.docs.isNotEmpty) {
        userList =
            user.docs.map((e) {
              return UserModel.fromMap(e.data());
            }).toList();
        isLoading = false;
        update();
      }
    } catch (e) {
      isLoading = false;
      update();
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
