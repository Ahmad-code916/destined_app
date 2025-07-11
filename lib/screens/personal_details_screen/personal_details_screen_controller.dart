import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class PersonalDetailsScreenController extends GetxController {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  List<String> genderList = ['Male', 'Female', 'Other'];
  String? selectedGender = 'Male';
  void onChange(String? value) {
    selectedGender = value;
    update();
  }
}
