import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:destined_app/models/local_list_model.dart';
import 'package:destined_app/models/user_model.dart';
import 'package:destined_app/screens/upload_id_screen/upload_id_screen.dart';
import 'package:destined_app/services/app_functions.dart';
import 'package:destined_app/utils/app_images.dart';
import 'package:destined_app/utils/app_strings.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class InterestsScreenController extends GetxController {
  late UserModel userModel;
  List<LocalListModel> selectedItems = [];
  List<String> selectedInterestList = [];
  List<LocalListModel> interestList = [
    LocalListModel(
      interest: AppStrings.photography,
      image: AppImages.cameraImage,
    ),
    LocalListModel(interest: AppStrings.cooking, image: AppImages.cookingImage),
    LocalListModel(
      interest: AppStrings.videoGames,
      image: AppImages.videoGameImage,
    ),
    LocalListModel(interest: AppStrings.music, image: AppImages.musicImage),
    LocalListModel(
      interest: AppStrings.travelling,
      image: AppImages.travellingImage,
    ),
    LocalListModel(
      interest: AppStrings.shopping,
      image: AppImages.shoppingImage,
    ),
    LocalListModel(
      interest: AppStrings.speeches,
      image: AppImages.speecheImage,
    ),
    LocalListModel(
      interest: AppStrings.artCrafts,
      image: AppImages.artCreaftImage,
    ),
    LocalListModel(
      interest: AppStrings.swimming,
      image: AppImages.swimmingImage,
    ),
    LocalListModel(
      interest: AppStrings.drinking,
      image: AppImages.drinkingImage,
    ),
    LocalListModel(
      interest: AppStrings.extremeSports,
      image: AppImages.sportsImage,
    ),
    LocalListModel(interest: AppStrings.fitness, image: AppImages.fitnessImage),
  ];

  void addInterestToList(int index) {
    if (selectedItems.contains(interestList[index])) {
      selectedItems.remove(interestList[index]);
    } else {
      selectedItems.add(interestList[index]);
    }
    update();
  }

  void selectList(int index) {
    if (selectedInterestList.contains(interestList[index].interest)) {
      selectedInterestList.remove(interestList[index].interest);
    } else {
      selectedInterestList.add(interestList[index].interest);
    }
    update();
  }

  void updateUserInFirebase() {
    if (selectedInterestList.isEmpty) {
      showOkAlertDialog(
        context: Get.context!,
        title: 'Error',
        message: 'Please select your list',
      );
    } else {
      FirebaseFirestore.instance
          .collection(UserModel.tableName)
          .doc(userModel.uid)
          .set(
            userModel
                .copyWith(interestList: selectedInterestList, page2: true)
                .toMap(),
            SetOptions(merge: true),
          );
      AppFunctions.showSnakBar('Updaed!', 'List added to your data.');
      Get.to(() => UploadIdScreen());
    }
  }

  @override
  void onInit() {
    userModel = Get.arguments['userModel'];
    AppFunctions.showSnakBar('User Data', userModel.page1.toString());
    super.onInit();
  }
}
