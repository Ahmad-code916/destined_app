import 'package:destined_app/screens/home_screen/home_screen.dart';
import 'package:destined_app/screens/home_swipe_screen/home_swipre_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../services/app_functions.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';
import '../../utils/app_strings.dart';
import '../../utils/app_text_style.dart';
import '../widgets/primary_gradient.dart';

class UnmatchScreen extends StatelessWidget {
  const UnmatchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PrimaryGradient(
        firstColor: AppColors.gradientSecondryFirst,
        secondColor: AppColors.gradientSecondrySec,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SingleChildScrollView(
                child: Expanded(
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
                            child: Image.asset(
                              AppImages.matchDot1Image,
                              height: 53,
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 245),
                              child: Image.asset(
                                AppImages.unmatchHeartImage,
                                height: 130,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 380,
                                right: 30,
                              ),
                              child: Image.asset(
                                AppImages.matchDot2Image,
                                height: 80,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 480),
                            child: SizedBox(
                              width: double.infinity,
                              child: Column(
                                children: [
                                  Text(
                                    AppStrings.bePatient,
                                    style: AppTextStyle.whiteBold.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    textAlign: TextAlign.center,
                                    AppStrings.bePatientSubStr,
                                    style: AppTextStyle.whiteRegular,
                                  ),
                                  AppFunctions.height(45),
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
              GestureDetector(
                onTap: () => Get.to(() => HomeScreen()),
                child: Image.asset(AppImages.startSwiipingText, height: 30),
              ),
              AppFunctions.height(20),
            ],
          ),
        ),
      ),
    );
  }
}
