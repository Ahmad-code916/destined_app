import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:destined_app/services/app_functions.dart';
import 'package:destined_app/services/user_base_controller.dart';
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
              .where('uid', isNotEqualTo: UserBaseController.userData.uid)
              .get();
      if (user.docs.isNotEmpty) {
        userList =
            user.docs
                .map((e) {
                  return UserModel.fromMap(e.data());
                })
                .where((ele) {
                  return !(ele.likedBy!.contains(
                    UserBaseController.userData.uid,
                  ));
                })
                .toList();
      }
      isLoading = false;
      update();
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

  Future onSwipeRight(int index) async {
    final currentUserId = UserBaseController.userData.uid ?? "";
    final updatedLikedBy = userList[index].likedBy;
    updatedLikedBy!.add(currentUserId);
    final updatedMyLikes = UserBaseController.userData.myLikes;
    updatedMyLikes!.add(userList[index].uid!);
    if (userList[index].myLikes!.contains(UserBaseController.userData.uid)) {
      final updateMyMatches = UserBaseController.userData.matches;
      updateMyMatches!.add(userList[index].uid!);
      final updateOtherMatches = userList[index].matches;
      updateOtherMatches!.add(currentUserId);
      await FirebaseFirestore.instance
          .collection(UserModel.tableName)
          .doc(userList[index].uid ?? "")
          .set(
            userList[index]
                .copyWith(likedBy: updatedLikedBy, matches: updateOtherMatches)
                .toMap(),
            SetOptions(merge: true),
          );
      await FirebaseFirestore.instance
          .collection(UserModel.tableName)
          .doc(currentUserId)
          .set(
            UserBaseController.userData
                .copyWith(myLikes: updatedMyLikes, matches: updateMyMatches)
                .toMap(),
            SetOptions(merge: true),
          );
      AppFunctions.showSnakBar('Congratulations', 'Your match created');
    } else {
      await FirebaseFirestore.instance
          .collection(UserModel.tableName)
          .doc(userList[index].uid ?? "")
          .set(
            userList[index].copyWith(likedBy: updatedLikedBy).toMap(),
            SetOptions(merge: true),
          );
      await FirebaseFirestore.instance
          .collection(UserModel.tableName)
          .doc(currentUserId)
          .set(
            UserBaseController.userData
                .copyWith(myLikes: updatedMyLikes)
                .toMap(),
            SetOptions(merge: true),
          );
      AppFunctions.showSnakBar('Added', 'You liked this profile');
    }
  }

  @override
  void onInit() {
    getUsers();
    super.onInit();
  }
}
