import 'package:destined_app/screens/splash_screen/splash_screen_controller.dart';
import 'package:destined_app/screens/widgets/primary_gradient.dart';
import 'package:destined_app/utils/app_colors.dart';
import 'package:destined_app/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final SplashScreenController controller = Get.put(SplashScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: AppColors.blueColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('NexChat', style: AppTextStyle.whiteBold),
            Text('Online Chatting App', style: AppTextStyle.whiteMedium),
          ],
        ),
      ),
      //  PrimaryGradient(
      //   firstColor: AppColors.gradientPrimaryFirst,
      //   secondColor: AppColors.gradientPrimarySecond,
      //   child:
      // ),
    );
  }
}
