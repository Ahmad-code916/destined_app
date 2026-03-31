import 'package:destined_app/services/app_functions.dart';
import 'package:destined_app/utils/app_colors.dart';
import 'package:destined_app/utils/app_strings.dart';
import 'package:destined_app/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatScreenMenu extends StatelessWidget {
  const ChatScreenMenu({
    super.key,
    required this.onTapClearIcon,
    required this.onTapClearViewProfile,
  });

  final void Function() onTapClearIcon;
  final void Function() onTapClearViewProfile;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.redColorSec, AppColors.purpleColorThird],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50)),
      ),
      height: Get.height * 0.5,
      width: Get.width * 0.7,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            GestureDetector(
              onTap: onTapClearIcon,
              child: Align(
                alignment: Alignment.centerRight,
                child: Icon(Icons.clear, color: AppColors.whiteColor),
              ),
            ),
            AppFunctions.height(12),
            GestureDetector(
              onTap: onTapClearViewProfile,
              child: Row(
                spacing: 12,
                children: [
                  Icon(Icons.person, color: AppColors.whiteColor),
                  Text(
                    AppStrings.viewProfile.tr,
                    style: AppTextStyle.whiteMedium,
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
