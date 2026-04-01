import 'dart:async';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:destined_app/models/thread_model.dart';
import 'package:destined_app/models/user_model.dart';
import 'package:destined_app/services/user_base_controller.dart';
import 'package:get/get.dart';

class ArchivedScreenController extends GetxController {
  bool isLoading = false;
  StreamSubscription<QuerySnapshot<Map<String, dynamic>>>? threadSubscription;
  List<ThreadModel> threadList = [];
  UserModel? userData;

  Future getThreads() async {
    try {
      isLoading = true;
      update();
      threadSubscription = FirebaseFirestore.instance
          .collection(ThreadModel.tableName)
          .where(
            'participantsList',
            arrayContains: UserBaseController.userData.uid ?? "",
          )
          .snapshots()
          .listen((event) async {
            if (event.docs.isNotEmpty) {
              threadList.clear();
              update();
              for (final e in event.docs) {
                final model = ThreadModel.fromMap(e.data());
                String otherUserid = fetchOtherUserId(
                  model.participantsList ?? [],
                );
                model.userDetails = await getOtherUserData(otherUserid);
                if (model.archivedUsersList!.contains(
                  UserBaseController.userData.uid,
                )) {
                  threadList.add(model);
                }
              }
              threadList.sort(
                (a, b) => (b.lastMessageTime ?? DateTime.now()).compareTo(
                  a.lastMessageTime ?? DateTime.now(),
                ),
              );
              isLoading = false;
              update();
            } else {
              isLoading = false;
              update();
            }
          });
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

  String fetchOtherUserId(List<String> participients) {
    if (participients.length != 2) return '';
    String currentUserId = UserBaseController.userData.uid ?? "";
    String otherUserId =
        currentUserId == participients.first
            ? participients.last
            : participients.first;
    return otherUserId;
  }

  Future<UserModel?> getOtherUserData(String otherUserId) async {
    final user =
        await FirebaseFirestore.instance
            .collection(UserModel.tableName)
            .doc(otherUserId)
            .get();
    if (user.exists) {
      userData = UserModel.fromMap(user.data()!);
      return userData;
    }
    return null;
  }

  @override
  void onClose() async {
    threadSubscription?.cancel();
    super.onClose();
  }

  @override
  void onInit() {
    getThreads();
    super.onInit();
  }
}
