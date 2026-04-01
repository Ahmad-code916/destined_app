import 'package:destined_app/services/app_functions.dart';
import 'package:destined_app/services/local_controller.dart';
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
    required this.onTapBlock,
    required this.blockOrUnclockText,
    required this.onTapDeleteChat,
    required this.onTapArchive,
    required this.archiveText,
    required this.archiveIcon,
  });

  final void Function() onTapClearIcon;
  final void Function() onTapClearViewProfile;
  final void Function() onTapBlock;
  final void Function() onTapDeleteChat;
  final void Function() onTapArchive;
  final String blockOrUnclockText;
  final String archiveText;
  final Icon archiveIcon;

  @override
  Widget build(BuildContext context) {
    final localeController = Get.put(LocalController());
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.redColorSec, AppColors.purpleColorThird],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft:
              localeController.currentLocale == Locale('en', 'US')
                  ? Radius.circular(50)
                  : Radius.circular(0),
          bottomRight:
              localeController.currentLocale == Locale('ur', 'PK')
                  ? Radius.circular(50)
                  : Radius.circular(0),
        ),
      ),
      height: Get.height * 0.3,
      width: Get.width * 0.7,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            GestureDetector(
              onTap: onTapClearIcon,
              child: Align(
                alignment:
                    localeController.currentLocale == Locale('en', 'US')
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
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
            AppFunctions.height(20),
            GestureDetector(
              onTap: onTapDeleteChat,
              child: Row(
                spacing: 12,
                children: [
                  Icon(Icons.delete, color: AppColors.whiteColor),
                  Text(
                    AppStrings.deleteChat.tr,
                    style: AppTextStyle.whiteMedium,
                  ),
                ],
              ),
            ),
            AppFunctions.height(20),
            GestureDetector(
              onTap: onTapBlock,
              child: Row(
                spacing: 12,
                children: [
                  Icon(Icons.block, color: AppColors.whiteColor),
                  Text(blockOrUnclockText, style: AppTextStyle.whiteMedium),
                ],
              ),
            ),
            AppFunctions.height(20),
            GestureDetector(
              onTap: onTapArchive,
              child: Row(
                spacing: 12,
                children: [
                  archiveIcon,
                  Text(archiveText, style: AppTextStyle.whiteMedium),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
