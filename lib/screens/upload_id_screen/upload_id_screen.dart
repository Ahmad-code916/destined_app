import 'package:destined_app/screens/location_screen/location_screen.dart';
import 'package:destined_app/screens/upload_id_screen/upload_id_screen_controller.dart';
import 'package:destined_app/screens/widgets/button_widget.dart';
import 'package:destined_app/screens/widgets/gradient_container.dart';
import 'package:destined_app/screens/widgets/primary_gradient.dart';
import 'package:destined_app/utils/app_colors.dart';
import 'package:destined_app/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../services/app_functions.dart';
import '../../utils/app_images.dart';
import '../../utils/app_strings.dart';

class UploadIdScreen extends StatelessWidget {
  UploadIdScreen({super.key});

  final UploadIdScreenController controller = Get.put(
    UploadIdScreenController(),
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
            child: GetBuilder<UploadIdScreenController>(
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
                        AppStrings.uploadId,
                        style: AppTextStyle.whiteBold.copyWith(fontSize: 36),
                      ),
                      AppFunctions.height(12),
                      Text(
                        textAlign: TextAlign.center,
                        AppStrings.uploadIdSubString,
                        style: AppTextStyle.whiteMedium.copyWith(fontSize: 16),
                      ),
                      AppFunctions.height(36),
                      GestureDetector(
                        onTap: () {
                          controller.toggleImage();
                        },
                        child: GradientContainer(
                          child: Container(
                            padding: EdgeInsets.only(left: 16, right: 16),
                            decoration: BoxDecoration(
                              color: AppColors.darkBlackColor,
                              borderRadius: AppFunctions.borderRadius(50),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  AppStrings.idProof,
                                  style: AppTextStyle.whiteMedium.copyWith(
                                    color: AppColors.purpleColor,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_drop_down,
                                  color: AppColors.whiteColor,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      AppFunctions.height(30),
                      if (controller.showUploadImage == true)
                        Image.asset(AppImages.uploadDocImage),
                      AppFunctions.height(46),
                      ButtonWidget(
                        buttonText: AppStrings.continu,
                        onTap: () => Get.to(() => LocationScreen()),
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
