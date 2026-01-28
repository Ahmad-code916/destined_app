import 'dart:io';
import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:destined_app/models/user_model.dart';
import 'package:destined_app/services/user_base_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class EditScreenController extends GetxController {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  UserModel? userData;
  bool isLoading = false;
  File? image;
  final supabase = Supabase.instance.client;
  List<String> genderList = ['Male', 'Female', 'Other'];
  String? selectedDropDownValue;
  DateTime? selectedDate;

  void onChange(String? value) {
    selectedDropDownValue = value;
    update();
  }

  // void getUserData() async {
  //   try {
  //     isLoading = true;
  //     update();
  //     final user =
  //         await FirebaseFirestore.instance
  //             .collection(UserModel.tableName)
  //             .doc(UserBaseController.userData.uid)
  //             .get();
  //     if (user.exists) {
  //       userData = UserModel.fromMap(user.data()!);
  //       print('^^^^^^^^^^^^^^${userData?.name ?? ""}');
  //     }
  //     isLoading = false;
  //     update();
  //   } catch (e) {
  //     isLoading = false;
  //     update();
  //     showOkAlertDialog(
  //       context: Get.context!,
  //       title: 'Error',
  //       message: 'Please select your image.',
  //     );
  //   }
  // }

  void pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      image = File(pickedImage.path);
      print('^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^selected');
      update();
    } else {
      Get.dialog(
        AlertDialog(title: Text('Error!'), content: Text('No Image Selected.')),
      );
    }
  }

  Future<String> uploadImage() async {
    if (image == null) {
      return "";
    } else {
      try {
        final fileName =
            '${DateTime.now().millisecondsSinceEpoch.toString()}.jpg';
        await supabase.storage
            .from('chatting_app_images')
            .upload(fileName, image!);
        String imageUrl = supabase.storage
            .from('chatting_app_images')
            .getPublicUrl(fileName);
        print('-------------------------->>>>>>>>>>>>>>>>>>>>>>>>>$imageUrl');
        return imageUrl;
      } catch (e) {
        Get.dialog(
          AlertDialog(title: Text('Error!'), content: Text(e.toString())),
        );
        return "";
      }
    }
  }

  void selectDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: Get.context!,
      firstDate: DateTime(1990),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      selectedDate = pickedDate;
      update();
    }
  }

  void updateProfile() async {
    try {
      isLoading = true;
      update();
      if (image == null) {
        await FirebaseFirestore.instance
            .collection(UserModel.tableName)
            .doc(UserBaseController.userData.uid)
            .update({
              'name': firstNameController.text.trim(),
              'lastName': lastNameController.text.trim(),
              'dateOfBirth': selectedDate,
              'gender': selectedDropDownValue,
            });
      } else {
        isLoading = true;
        update();
        String imageUrl = await uploadImage();
        await FirebaseFirestore.instance
            .collection(UserModel.tableName)
            .doc(UserBaseController.userData.uid)
            .update({
              'name': firstNameController.text.trim(),
              'lastName': lastNameController.text.trim(),
              'dateOfBirth': selectedDate,
              'gender': selectedDropDownValue,
              'imageUrl': imageUrl,
            });
      }
      final user =
          await FirebaseFirestore.instance
              .collection(UserModel.tableName)
              .doc(UserBaseController.userData.uid)
              .get();
      if (user.exists) {
        UserBaseController.updateUserModel(UserModel.fromMap(user.data()!));
        print('^^^^^^^^^^^^^^^^^^^^^^^^^^^${UserBaseController.userData.name}');
        update();
      }
      isLoading = false;
      update();
      Get.back();
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

  @override
  void onInit() {
    // getUserData();
    firstNameController.text = UserBaseController.userData.name ?? "";
    lastNameController.text = UserBaseController.userData.lastName ?? "";
    selectedDropDownValue = UserBaseController.userData.gender ?? "";
    selectedDate = UserBaseController.userData.dateOfBirth;
    super.onInit();
  }
}
