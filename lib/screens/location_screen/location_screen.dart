import 'package:destined_app/screens/home_screen/home_screen.dart';
import 'package:destined_app/screens/location_screen/location_screen_controller.dart';
import 'package:destined_app/screens/widgets/button_widget.dart';
import 'package:destined_app/screens/widgets/gradient_container.dart';
import 'package:destined_app/screens/widgets/text_form_field_widget.dart';
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
                                AppStrings.location,
                                style: AppTextStyle.whiteBold.copyWith(
                                  fontSize: 36,
                                ),
                              ),

                              AppFunctions.height(12),
                              Text(
                                textAlign: TextAlign.center,
                                AppStrings.locationSubString,
                                style: AppTextStyle.whiteMedium.copyWith(
                                  fontSize: 16,
                                ),
                              ),
                              AppFunctions.height(36),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  AppStrings.currentLocation,
                                  style: AppTextStyle.pinkMedium,
                                ),
                              ),
                              AppFunctions.height(10),
                              GestureDetector(
                                onTap: () {
                                  controller.getPosition();
                                },
                                child: GradientContainer(
                                  height: 60,
                                  child: Container(
                                    padding: EdgeInsets.only(
                                      left: 16,
                                      right: 16,
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppColors.darkBlackColor,
                                      borderRadius: AppFunctions.borderRadius(
                                        50,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            controller.currentUserData == null
                                                ? 'Select'
                                                : '${controller.currentUserData!.subLocality},${controller.currentUserData!.locality},${controller.currentUserData!.country}',
                                            style: AppTextStyle.whiteMedium,
                                          ),
                                        ),
                                        Icon(
                                          Icons.location_searching_outlined,
                                          color: AppColors.whiteColor,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              // AppFunctions.height(30),
                              // TextFormFieldWidget(
                              //   controller: controller.locationController,
                              //   icon: Icon(
                              //     Icons.search,
                              //     color: AppColors.purpleColor,
                              //   ),
                              //   hintText: AppStrings.searchLocation,
                              // ),
                              AppFunctions.height(40),
                              ButtonWidget(
                                buttonText: AppStrings.continu,
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
