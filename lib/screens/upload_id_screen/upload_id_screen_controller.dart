import 'dart:io';
import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:destined_app/models/user_model.dart';
import 'package:destined_app/services/app_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UploadIdScreenController extends GetxController {
  late UserModel userModel;
  bool showUploadImage = false;
  File? image;
  String? imageUrl;
  final supabase = Supabase.instance.client;

  void toggleImage() {
    showUploadImage = !showUploadImage;
    update();
  }

  void pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      image = File(pickedImage.path);
      update();
    } else {
      Get.dialog(
        AlertDialog(title: Text('Error!'), content: Text('No Image Selected.')),
      );
    }
  }

  void uploadImage() async {
    if (image == null) {
      return;
    } else {
      try {
        final fileName =
            '${DateTime.now().millisecondsSinceEpoch.toString()}.jpg';
        await supabase.storage.from('users_images').upload(fileName, image!);
        imageUrl = supabase.storage.from('users_images').getPublicUrl(fileName);
        print('-------------------------->>>>>>>>>>>>>>>>>>>>>>>>>$imageUrl');
      } catch (e) {
        Get.dialog(
          AlertDialog(title: Text('Error!'), content: Text(e.toString())),
        );
      }
    }
  }

  void updateUserInFirebase() async {
    if (image == null) {
      showOkAlertDialog(
        context: Get.context!,
        title: 'Error',
        message: 'Please select your image.',
      );
    } else {
      uploadImage();
      AppFunctions.showSnakBar('Url', imageUrl ?? "");
      await FirebaseFirestore.instance
          .collection(UserModel.tableName)
          .doc(userModel.uid)
          .set(
            userModel.copyWith(uploadedId: imageUrl, page3: true).toMap(),
            SetOptions(merge: true),
          );
      AppFunctions.showSnakBar('Updaed!', 'List added to your data.');
    }
  }

  @override
  void onInit() {
    userModel = Get.arguments['userModel'];
    super.onInit();
  }
}
