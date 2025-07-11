import 'package:destined_app/screens/personal_details_screen/personal_details_screen.dart';
import 'package:destined_app/screens/widgets/button_widget.dart';
import 'package:destined_app/screens/widgets/primary_gradient.dart';
import 'package:destined_app/services/app_functions.dart';
import 'package:destined_app/utils/app_colors.dart';
import 'package:destined_app/utils/app_images.dart';
import 'package:destined_app/utils/app_strings.dart';
import 'package:destined_app/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PrimaryGradient(
        firstColor: AppColors.gradientPrimaryFirst,
        secondColor: AppColors.gradientPrimarySecond,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppFunctions.height(30),
                Text(AppStrings.onlineDatingApp, style: AppTextStyle.redMedium),
                AppFunctions.height(12),
                Text(
                  textAlign: TextAlign.center,
                  AppStrings.findYourMatch,
                  style: AppTextStyle.whiteBold,
                ),
                AppFunctions.height(12),
                Text(
                  AppStrings.wanaKnowBestWork,
                  style: AppTextStyle.whiteMedium,
                ),
                Text(
                  AppStrings.playVideo,
                  style: AppTextStyle.whiteMedium.copyWith(
                    color: AppColors.yellowColor,
                  ),
                ),
                Image.asset(AppImages.introSecondImage, fit: BoxFit.cover),
                ButtonWidget(
                  buttonText: AppStrings.startDating,
                  onTap: () => Get.to(() => PersonalDetailsScreen()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
