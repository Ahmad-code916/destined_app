import 'package:destined_app/screens/widgets/primary_gradient.dart';
import 'package:destined_app/services/app_functions.dart';
import 'package:destined_app/utils/app_colors.dart';
import 'package:destined_app/utils/app_images.dart';
import 'package:destined_app/utils/app_strings.dart';
import 'package:destined_app/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MatchSceen extends StatelessWidget {
  const MatchSceen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PrimaryGradient(
        firstColor: AppColors.gradientSecondryFirst,
        secondColor: AppColors.gradientSecondrySec,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Image.asset(AppImages.matchBigCirle),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 30,
                        right: 30,
                        top: 155,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 38,
                        children: [
                          Image.asset(AppImages.matchDot1Image, height: 53),
                          Image.asset(AppImages.matchLikeImage, height: 61),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        margin: EdgeInsets.only(top: 190, right: 50),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.pinkColorThird,
                          border: Border.all(
                            color: AppColors.whiteColor,
                            width: 2,
                          ),
                        ),
                        height: 140,
                        width: 140,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        margin: EdgeInsets.only(top: 240, left: 30),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.purpleColor,
                          border: Border.all(
                            color: AppColors.whiteColor,
                            width: 2,
                          ),
                        ),
                        height: 140,
                        width: 140,
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 330),
                        child: Image.asset(
                          AppImages.matchHeartImage,
                          height: 80,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 380, right: 30),
                        child: Image.asset(
                          AppImages.matchDot2Image,
                          height: 80,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 460),
                      child: SizedBox(
                        width: double.infinity,
                        child: Column(
                          children: [
                            Text(
                              AppStrings.congrats.tr,
                              style: AppTextStyle.whiteBold.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              textAlign: TextAlign.center,
                              AppStrings.congratsSubStr.tr,
                              style: AppTextStyle.whiteRegular,
                            ),
                            AppFunctions.height(20),
                            Icon(
                              Icons.message_outlined,
                              size: 25,
                              color: AppColors.whiteColor,
                            ),
                            AppFunctions.height(6),
                            Text(
                              textAlign: TextAlign.center,
                              AppStrings.startConversation.tr,
                              style: AppTextStyle.whiteMedium.copyWith(
                                color: AppColors.yellowColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            AppFunctions.height(45),
                            GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: Image.asset(
                                AppImages.keepDatingText,
                                height: 30,
                              ),
                            ),
                            AppFunctions.height(20),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
