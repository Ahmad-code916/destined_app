import 'dart:async';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:destined_app/models/chat_model.dart';
import 'package:destined_app/models/thread_model.dart';
import 'package:destined_app/models/user_model.dart';
import 'package:destined_app/services/app_functions.dart';
import 'package:destined_app/services/user_base_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatScreenController extends GetxController {
  late String threadId;
  late UserModel user;
  List<ChatModel> messages = [];
  TextEditingController messageController = TextEditingController();
  StreamSubscription<QuerySnapshot<Map<String, dynamic>>>? subscription;

  Future createChat() async {
    if (messageController.text.trim().isEmpty) {
      showOkAlertDialog(
        context: Get.context!,
        title: 'Error',
        message: 'Please enter your message',
      );
    } else {
      String currentUserId = UserBaseController.userData.uid ?? "";
      String docId = AppFunctions.generateRandomId();
      FirebaseFirestore.instance
          .collection(ThreadModel.tableName)
          .doc(threadId)
          .collection(ChatModel.tableName)
          .doc(docId)
          .set(
            ChatModel(
              id: docId,
              isSeen: false,
              message: messageController.text,
              messageType: 'text',
              receiverId: user.uid,
              senderId: currentUserId,
              timestamp: DateTime.now(),
            ).toMap(),
          );
      AppFunctions.showSnakBar('Sent!', 'Message has been sent');
    }
  }

  Future getMessages() async {
    try {
      subscription = FirebaseFirestore.instance
          .collection(ThreadModel.tableName)
          .doc(threadId)
          .collection(ChatModel.tableName)
          .orderBy('timestamp', descending: false)
          .snapshots()
          .listen((event) {
            if (event.docs.isNotEmpty) {
              messages =
                  event.docs.map((e) {
                    return ChatModel.fromMap(e.data());
                  }).toList();
              print('^^^^^^^^^^^^^^^^^^^^^${messages.length}');
              update();
            }
          });
    } catch (e) {
      showOkAlertDialog(
        context: Get.context!,
        title: 'Error',
        message: e.toString(),
      );
    }
  }

  @override
  void onInit() {
    threadId = Get.arguments['threadId'];
    user = Get.arguments['user'];
    getMessages();
    super.onInit();
  }
}
