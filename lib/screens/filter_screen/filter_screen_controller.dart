import 'package:get/get_state_manager/get_state_manager.dart';

class FilterScreenController extends GetxController {
  String? selectedHereToValue;
  String? wantToMeetSelectedValue;
  String? selectedPreferredLanguage;
  String? selectedPreferredaAgeRange;
  String? selectedLocation = 'First';
  String? selectedDistanceRange = 'First';
  double sliderValue = 10;
  List<String> hereToFilterList = ['Make New Friends', 'Get Married', 'Dating'];
  List<String> wantToMeetFilterList = ['Man', 'Woman', 'Other'];
  List<String> ageRangeFilterList = ['18-25', '26-35', '36-45', '46-55', '56+'];
  List<String> languagesFilterList = ['English', 'Urdu', 'French', 'Hindi'];
  List<String> selectedLanguages = [];
  bool showLanguages = false;

  toggleShowLanguagesValue() {
    showLanguages = !showLanguages;
    update();
  }

  void addLanguageToList(int index) {
    if (selectedLanguages.contains(languagesFilterList[index])) {
      selectedLanguages.remove(languagesFilterList[index]);
    } else {
      selectedLanguages.add(languagesFilterList[index]);
    }
    update();
  }

  void onChangeHEreToFilterValue(String? value) {
    selectedHereToValue = value;
    update();
  }

  void onChangeWantToMeetFilterValue(String? value) {
    wantToMeetSelectedValue = value;
    update();
  }

  void onChangeAgeRangeFilterValue(String? value) {
    selectedPreferredaAgeRange = value;
    update();
  }

  void onChangeLangaugeFilterValue(String? value) {
    selectedPreferredLanguage = value;
    update();
  }

  void onChangeSliderValue(double value) {
    sliderValue = value;
    update();
  }

  void resetFilterValue() {
    selectedHereToValue = hereToFilterList.first;
    update();
  }
}
