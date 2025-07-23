import 'package:destined_app/screens/widgets/primary_gradient.dart';
import 'package:destined_app/screens/widgets/users_details_head_row.dart';
import 'package:destined_app/services/app_functions.dart';
import 'package:destined_app/utils/app_colors.dart';
import 'package:destined_app/utils/app_images.dart';
import 'package:destined_app/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserDetailsScreen extends StatelessWidget {
  const UserDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PrimaryGradient(
        firstColor: AppColors.gradientSecondryFirst,
        secondColor: AppColors.gradientSecondrySec,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UsersDetailsHeadRow(
              firstColor: AppColors.pinkColorSec,
              secondColor: AppColors.lightPink,
              child: Image.asset(AppImages.backIcon, height: 20),
              onTapChild: () => Get.back(),
            ),
            Center(
              child: Container(
                width: double.infinity,
                color: Color(0xff21154D),
                child: Image.asset(
                  AppImages.profileImage,
                  height: 300,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            AppFunctions.height(28),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Belle Benson',
                        style: AppTextStyle.whiteMedium.copyWith(fontSize: 32),
                      ),
                      Row(
                        children: [
                          Icon(Icons.location_on, color: AppColors.whiteColor),
                          AppFunctions.width(8),
                          RichText(
                            text: TextSpan(
                              text: '1.5 ',
                              children: [TextSpan(text: 'km away')],
                              style: AppTextStyle.whiteMedium.copyWith(
                                fontSize: 12,
                              ),
                            ),
                          ),
                          AppFunctions.width(16),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
