import 'package:destined_app/screens/interests_screen/interests_screen_controller.dart';
import 'package:destined_app/screens/widgets/button_widget.dart';
import 'package:destined_app/screens/widgets/primary_gradient.dart';
import 'package:destined_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../services/app_functions.dart';
import '../../utils/app_images.dart';
import '../../utils/app_strings.dart';
import '../../utils/app_text_style.dart';

class InterestsScreen extends StatelessWidget {
  InterestsScreen({super.key});

  final InterestsScreenController controller = Get.put(
    InterestsScreenController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PrimaryGradient(
        firstColor: AppColors.gradientSecondryFirst,
        secondColor: AppColors.gradientSecondrySec,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: GetBuilder<InterestsScreenController>(
              builder: (context) {
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: GestureDetector(
                          onTap: () => Get.back(),
                          child: Image.asset(AppImages.backIcon, height: 20),
                        ),
                      ),
                      AppFunctions.height(30),
                      Text(
                        AppStrings.likes.tr,
                        style: AppTextStyle.whiteBold.copyWith(
                          fontSize: 36,
                          color: AppColors.darkBlueColor,
                        ),
                      ),
                      AppFunctions.height(12),
                      Text(
                        AppStrings.shareYourLikes.tr,
                        style: AppTextStyle.whiteMedium.copyWith(
                          fontSize: 16,
                          color: AppColors.lightPurpleSec,
                        ),
                      ),
                      AppFunctions.height(36),
                      GridView.builder(
                        itemCount: controller.interestList.length,
                        shrinkWrap: true,
                        primary: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 17,
                          childAspectRatio: 2.5,
                        ),
                        itemBuilder: (context, index) {
                          final data = controller.interestList[index];
                          return GestureDetector(
                            onTap: () {
                              controller.addInterestToList(index);
                              controller.selectList(index);
                            },
                            child: Container(
                              // decoration: BoxDecoration(
                              //   gradient:
                              //       controller.selectedItems.contains(data)
                              //           ? LinearGradient(
                              //             colors: [
                              //               AppColors.lightRedColor,
                              //               AppColors.purpleColor,
                              //             ],
                              //             begin: Alignment.centerLeft,
                              //             end: Alignment.centerRight,
                              //             stops: [0, 1.0],
                              //           )
                              //           : null,
                              //   color:
                              //       controller.selectedItems.contains(data)
                              //           ? null
                              //           : AppColors.transparentColor,
                              //   borderRadius: BorderRadius.all(
                              //     Radius.circular(50),
                              //   ),
                              // ),
                              padding: EdgeInsets.all(3),
                              child: Container(
                                padding: EdgeInsets.only(left: 12),
                                decoration: BoxDecoration(
                                  color: AppColors.whiteColor,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(50),
                                  ),
                                  border: Border.all(
                                    color:
                                        controller.selectedItems.contains(data)
                                            ? AppColors.blueColor
                                            : AppColors.whiteColor,
                                    width: 3,
                                  ),
                                ),
                                child: Row(
                                  // mainAxisAlignment: MainAxisAlignment.center,
                                  spacing: 8,
                                  children: [
                                    Image.asset(
                                      height: 20,
                                      data.image,
                                      fit: BoxFit.cover,
                                    ),
                                    Text(
                                      data.interest,
                                      style: AppTextStyle.whiteMedium.copyWith(
                                        color:
                                            controller.selectedItems.contains(
                                                  data,
                                                )
                                                ? AppColors.darkBlueColor
                                                : AppColors.lightPurpleThird,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      AppFunctions.height(40),
                      ButtonWidget(
                        isLoading: controller.isLoading,
                        buttonText: AppStrings.continu.tr,
                        onTap: () {
                          controller.updateUserInFirebase();
                        },
                      ),
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
