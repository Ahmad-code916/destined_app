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
  List<UserModel> otherUsersList = [];
  List<UserModel> filteredList = [];
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
              filteredList = otherUsersList;
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
          .listen((event) {
            if (event.docs.isNotEmpty) {
              threadList =
                  event.docs.map((e) {
                    return ThreadModel.fromMap(e.data());
                  }).toList();
              threadList.sort((a, b) {
                return b.lastMessageTime!.compareTo(a.lastMessageTime!);
              });
              otherUsersList.clear();
              for (var thread in threadList) {
                String otherUserid = fetchOtherUserId(
                  thread.participantsList ?? [],
                );
                getOtherUserData(otherUserid);
                update();
              }
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

  Future getOtherUserData(String otherUserId) async {
    final user =
        await FirebaseFirestore.instance
            .collection(UserModel.tableName)
            .doc(otherUserId)
            .get();
    if (user.exists) {
      userData = UserModel.fromMap(user.data()!);
      otherUsersList.add(userData!);
      update();
    }
    update();
  }

  void onChnage(String value) {
    filteredList =
        otherUsersList.where((element) {
          return element.name!.toLowerCase().contains(value.toLowerCase());
        }).toList();
    update();
  }

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
