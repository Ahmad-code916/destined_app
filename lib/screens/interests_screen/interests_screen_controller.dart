import 'package:destined_app/models/local_list_model.dart';
import 'package:destined_app/utils/app_images.dart';
import 'package:destined_app/utils/app_strings.dart';
import 'package:get/get.dart';

class InterestsScreenController extends GetxController {
  List<LocalListModel> selectedItems = [];
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
}
