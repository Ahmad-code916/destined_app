import 'dart:async';
import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:destined_app/models/chat_model.dart';
import 'package:destined_app/models/thread_model.dart';
import 'package:destined_app/models/user_model.dart';
import 'package:destined_app/services/app_functions.dart';
import 'package:destined_app/services/user_base_controller.dart';
import 'package:destined_app/utils/app_colors.dart';
import 'package:destined_app/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatScreenController extends GetxController {
  late String threadId;
  late UserModel user;
  late ThreadModel threadModel;
  List<ChatModel> messages = [];
  String? message;
  TextEditingController messageController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  StreamSubscription<QuerySnapshot<Map<String, dynamic>>>? subscription;

  @override
  updateValue(String? value) {
    message = value;
    update();
  }

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
      message = messageController.text;
      await FirebaseFirestore.instance
          .collection(ThreadModel.tableName)
          .doc(threadId)
          .collection(ChatModel.tableName)
          .doc(docId)
          .set(
            ChatModel(
              id: docId,
              isSeen: false,
              message: message,
              messageType: 'text',
              receiverId: user.uid,
              senderId: currentUserId,
              timestamp: DateTime.now(),
            ).toMap(),
          );
      messageController.clear();
      await FirebaseFirestore.instance
          .collection(ThreadModel.tableName)
          .doc(threadId)
          .set(
            threadModel
                .copyWith(lastMessage: message, lastMessageTime: DateTime.now())
                .toMap(),
            SetOptions(merge: true),
          );
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
              Future.delayed(const Duration(milliseconds: 100), () {
                if (scrollController.hasClients) {
                  scrollController.animateTo(
                    scrollController.position.maxScrollExtent,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                  );
                }
              });
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

  Future deleteMessage(int index) async {
    String messageId = messages[index].id ?? "";
    await Get.defaultDialog(
      textCancel: 'Cancel',
      textConfirm: 'Ok',
      title: 'Delete!',
      middleText: 'Do you want to delete this message?',
      titleStyle: AppTextStyle.whiteBold.copyWith(
        color: AppColors.blackColor,
        fontSize: 22,
      ),
      middleTextStyle: AppTextStyle.whiteRegular.copyWith(
        color: AppColors.blackColor,
      ),
      cancelTextColor: AppColors.blackColor,
      confirmTextColor: AppColors.whiteColor,
      onCancel: () {},
      onConfirm: () async {
        await FirebaseFirestore.instance
            .collection(ThreadModel.tableName)
            .doc(threadId)
            .collection(ChatModel.tableName)
            .doc(messageId)
            .delete();
        await FirebaseFirestore.instance
            .collection(ThreadModel.tableName)
            .doc(threadId)
            .update({'lastMessage': 'Message Deleted!'});
        Get.back();
        AppFunctions.showSnakBar('Deleted', 'This message has deleted.');
        update();
      },
    );
  }

  @override
  void onInit() {
    threadId = Get.arguments['threadId'];
    user = Get.arguments['user'];
    threadModel = Get.arguments['threadModel'];
    getMessages();
    super.onInit();
  }
}
