import 'package:destined_app/screens/splash_screen/splash_screen_controller.dart';
import 'package:destined_app/screens/widgets/primary_gradient.dart';
import 'package:destined_app/utils/app_colors.dart';
import 'package:destined_app/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final SplashScreenController controller = Get.put(SplashScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PrimaryGradient(
        firstColor: AppColors.gradientPrimaryFirst,
        secondColor: AppColors.gradientPrimarySecond,
        child: Center(
          child: Image.asset(
            AppImages.logoIMage,
            fit: BoxFit.cover,
            height: 95,
          ),
        ),
      ),
    );
  }
}
