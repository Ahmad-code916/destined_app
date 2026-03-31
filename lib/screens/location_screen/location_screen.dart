import 'package:destined_app/screens/location_screen/location_screen_controller.dart';
import 'package:destined_app/screens/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../services/app_functions.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';
import '../../utils/app_strings.dart';
import '../../utils/app_text_style.dart';
import '../widgets/primary_gradient.dart';

class LocationScreen extends StatelessWidget {
  LocationScreen({super.key});

  final LocationScreenController controller = Get.put(
    LocationScreenController(),
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
            child: GetBuilder<LocationScreenController>(
              builder: (context) {
                return Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                        onTap: () => Get.back(),
                        child: Image.asset(AppImages.backIcon, height: 20),
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            maxHeight: Get.height - 100,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                AppStrings.location.tr,
                                style: AppTextStyle.whiteBold.copyWith(
                                  fontSize: 36,
                                  color: AppColors.darkBlueColor,
                                ),
                              ),

                              AppFunctions.height(12),
                              Text(
                                textAlign: TextAlign.center,
                                AppStrings.locationSubString.tr,
                                style: AppTextStyle.whiteMedium.copyWith(
                                  fontSize: 16,
                                  color: AppColors.lightPurpleSec,
                                ),
                              ),
                              AppFunctions.height(36),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  AppStrings.currentLocation.tr,
                                  style: AppTextStyle.pinkMedium,
                                ),
                              ),
                              AppFunctions.height(10),
                              GestureDetector(
                                onTap: () {
                                  controller.getPosition();
                                },
                                child: Container(
                                  padding: EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: AppColors.whiteColor,
                                    borderRadius: AppFunctions.borderRadius(50),
                                    border: Border.all(
                                      color: AppColors.blueColor,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          controller.currentUserData == null
                                              ? AppStrings.select.tr
                                              : '${controller.currentUserData!.subLocality},${controller.currentUserData!.locality},${controller.currentUserData!.country}',
                                          style: AppTextStyle.whiteMedium
                                              .copyWith(
                                                color: AppColors.darkBlueColor,
                                              ),
                                        ),
                                      ),
                                      Icon(
                                        Icons.location_searching_outlined,
                                        color: AppColors.darkBlueColor,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              AppFunctions.height(40),
                              ButtonWidget(
                                isLoading: controller.isUpdatingData,
                                buttonText: AppStrings.continu.tr,
                                onTap: () {
                                  controller.updateUserInFirebase();
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
