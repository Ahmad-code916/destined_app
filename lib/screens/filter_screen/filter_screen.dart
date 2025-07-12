import 'package:destined_app/screens/filter_screen/filter_screen_controller.dart';
import 'package:destined_app/screens/widgets/drop_down_widget.dart';
import 'package:destined_app/screens/widgets/filter_screen_gradient_container.dart';
import 'package:destined_app/screens/widgets/gradient_container.dart';
import 'package:destined_app/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../services/app_functions.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_strings.dart';
import '../../utils/app_text_style.dart';
import '../widgets/primary_gradient.dart';

class FilterScreen extends StatelessWidget {
  FilterScreen({super.key});

  final FilterScreenController controller = Get.put(FilterScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PrimaryGradient(
        firstColor: AppColors.gradientSecondryFirst,
        secondColor: AppColors.gradientSecondrySec,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: GetBuilder<FilterScreenController>(
              builder: (context) {
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppFunctions.height(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () => Get.back(),
                            child: Image.asset(AppImages.backIcon, height: 20),
                          ),
                          GestureDetector(
                            onTap: () {
                              controller.resetFilterValue();
                            },
                            child: Image.asset(AppImages.resetIcon, height: 20),
                          ),
                        ],
                      ),
                      AppFunctions.height(30),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          AppStrings.filterOptions,
                          style: AppTextStyle.whiteBold.copyWith(fontSize: 36),
                        ),
                      ),
                      AppFunctions.height(12),
                      Text(
                        textAlign: TextAlign.center,
                        AppStrings.filterOptionsSubString,
                        style: AppTextStyle.whiteMedium.copyWith(fontSize: 16),
                      ),
                      AppFunctions.height(26),
                      Text(AppStrings.hereTo, style: AppTextStyle.pinkMedium),
                      AppFunctions.height(10),
                      DropDownWidget(
                        selectedValue:
                            controller.selectedHereToValue == null
                                ? null
                                : controller.selectedHereToValue ?? "",
                        items: controller.hereToFilterList,
                        onChange: controller.onChangeHEreToFilterValue,
                      ),
                      AppFunctions.height(30),
                      Text(
                        AppStrings.wantToMeet,
                        style: AppTextStyle.pinkMedium,
                      ),
                      AppFunctions.height(10),
                      DropDownWidget(
                        selectedValue:
                            controller.wantToMeetSelectedValue == null
                                ? null
                                : controller.wantToMeetSelectedValue ?? "",
                        items: controller.wantToMeetFilterList,
                        onChange: controller.onChangeWantToMeetFilterValue,
                      ),
                      AppFunctions.height(30),
                      Text(
                        AppStrings.preferredAgeRange,
                        style: AppTextStyle.pinkMedium,
                      ),
                      AppFunctions.height(10),
                      DropDownWidget(
                        selectedValue:
                            controller.selectedPreferredaAgeRange == null
                                ? null
                                : controller.selectedPreferredaAgeRange ?? "",
                        items: controller.ageRangeFilterList,
                        onChange: controller.onChangeAgeRangeFilterValue,
                      ),
                      AppFunctions.height(30),
                      Text(
                        AppStrings.preferredLanguages,
                        style: AppTextStyle.pinkMedium,
                      ),
                      AppFunctions.height(10),
                      FilterScreenGradientContainer(
                        onTap: () {
                          controller.toggleShowLanguagesValue();
                        },
                        widget:
                            controller.selectedLanguages.isEmpty
                                ? Text(
                                  AppStrings.select,
                                  style: AppTextStyle.whiteMedium,
                                )
                                : ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  primary: true,
                                  itemCount:
                                      controller.selectedLanguages.length,
                                  itemBuilder: (context, index) {
                                    final data =
                                        controller.selectedLanguages[index];
                                    return Center(
                                      child: Text(
                                        '$data,',
                                        style: AppTextStyle.whiteRegular,
                                      ),
                                    );
                                  },
                                ),
                        icon: Icon(
                          Icons.arrow_drop_down_outlined,
                          color: AppColors.whiteColor,
                        ),
                      ),
                      if (controller.showLanguages == true)
                        AppFunctions.height(20),
                      if (controller.showLanguages == true)
                        GradientContainer(
                          child: Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: AppColors.darkBlackColor,
                              borderRadius: AppFunctions.borderRadius(50),
                            ),
                            height: 200,
                            child: ListView.builder(
                              itemCount: controller.languagesFilterList.length,
                              primary: true,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                final data =
                                    controller.languagesFilterList[index];
                                return Padding(
                                  padding: const EdgeInsets.only(
                                    left: 20,
                                    right: 20,
                                  ),
                                  child: GestureDetector(
                                    behavior: HitTestBehavior.opaque,
                                    onTap: () {
                                      controller.addLanguageToList(index);
                                    },
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          data,
                                          style: AppTextStyle.whiteMedium,
                                        ),
                                        Divider(),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      AppFunctions.height(30),
                      Text(AppStrings.location, style: AppTextStyle.pinkMedium),
                      AppFunctions.height(10),
                      FilterScreenGradientContainer(
                        onTap: () {},
                        widget: Text(
                          'Florida , US',
                          style: AppTextStyle.whiteMedium,
                        ),
                        icon: Icon(
                          Icons.location_on,
                          color: AppColors.whiteColor,
                        ),
                      ),
                      AppFunctions.height(30),
                      Text(
                        AppStrings.distanceRange,
                        style: AppTextStyle.pinkMedium,
                      ),
                      AppFunctions.height(10),
                      RichText(
                        text: TextSpan(
                          text: '0 - ',
                          children: [
                            TextSpan(
                              text: controller.sliderValue.toStringAsFixed(0),
                            ),
                            TextSpan(text: ' km'),
                          ],
                          style: AppTextStyle.whiteRegular,
                        ),
                      ),
                      Slider(
                        activeColor: AppColors.pinkColorSecondry,
                        inactiveColor: AppColors.lightBlueSecColor,
                        min: 0,
                        max: 100,
                        value: controller.sliderValue,
                        onChanged: (value) {
                          controller.onChangeSliderValue(value);
                        },
                      ),
                      AppFunctions.height(20),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
