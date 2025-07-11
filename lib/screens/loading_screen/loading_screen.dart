import 'package:destined_app/screens/intro_screen/intro_screen.dart';
import 'package:destined_app/screens/widgets/primary_gradient.dart';
import 'package:destined_app/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_colors.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PrimaryGradient(
        firstColor: AppColors.gradientPrimaryFirst,
        secondColor: AppColors.gradientPrimarySecond,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Center(
              child: Image.asset(
                AppImages.logoIMage,
                fit: BoxFit.cover,
                height: 95,
              ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: GestureDetector(
                  onTap: () => Get.to(() => IntroScreen()),
                  child: Image.asset(
                    AppImages.splashText,
                    fit: BoxFit.cover,
                    height: 30,
                    width: 200,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
