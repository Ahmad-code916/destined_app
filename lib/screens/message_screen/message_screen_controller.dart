import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:destined_app/models/thread_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'dart:async';
import '../../models/user_model.dart';
import '../../services/user_base_controller.dart';

class MessageScreenController extends GetxController {
  final TextEditingController searchController = TextEditingController();
  List<UserModel> userList = [];
  List<ThreadModel> threadList = [];
  List<String> participientUsers = [];
  UserModel? userData;
  // List<UserModel> filteredList = [];
  List<ThreadModel> filteredUserList = [];
  StreamSubscription<QuerySnapshot<Map<String, dynamic>>>? subscription;
  StreamSubscription<QuerySnapshot<Map<String, dynamic>>>? threadSubscription;
  bool isLoading = false;

  Future getUsers() async {
    try {
      isLoading = true;
      update();
      subscription = FirebaseFirestore.instance
          .collection(UserModel.tableName)
          .snapshots()
          .listen((event) {
            if (event.docs.isNotEmpty) {
              userList =
                  event.docs
                      .map((e) {
                        return UserModel.fromMap(e.data());
                      })
                      .where((element) {
                        return UserBaseController.userData.matches!.contains(
                          element.uid ?? "",
                        );
                      })
                      .toList();
              // filteredList = otherUsersList;
              isLoading = false;
              update();
            }
            isLoading = false;
            update();
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
                threadList.add(model);
              }
              threadList.sort(
                (a, b) => (b.lastMessageTime ?? DateTime.now()).compareTo(
                  a.lastMessageTime ?? DateTime.now(),
                ),
              );
              filteredUserList = threadList;
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

  void onChange(String value) {
    filteredUserList =
        threadList.where((element) {
          return element.userDetails!.name!.toLowerCase().contains(
            value.toLowerCase(),
          );
        }).toList();
    update();
  }

  // void onChnage(String value) {
  //   filteredList =
  //       otherUsersList.where((element) {
  //         return element.name!.toLowerCase().contains(value.toLowerCase());
  //       }).toList();
  //   update();
  // }

  @override
  void onInit() {
    getUsers();
    getThreads();
    super.onInit();
  }

  @override
  void onClose() async {
    await subscription?.cancel();
    await threadSubscription?.cancel();
    super.onClose();
  }
}
