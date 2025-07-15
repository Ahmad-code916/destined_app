import 'package:flutter/material.dart';
import '../../services/app_functions.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';
import '../../utils/app_text_style.dart';

class HeadRowWidget extends StatelessWidget {
  const HeadRowWidget({
    super.key,
    required this.image,
    required this.name,
    required this.onTapFilter,
    required this.onTapnotification,
  });

  final String image;
  final String name;
  final void Function() onTapFilter;
  final void Function() onTapnotification;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          spacing: 12,
          children: [
            ClipRRect(
              borderRadius: AppFunctions.borderRadius(50),
              child: Image.asset(image, height: 40, width: 40),
            ),
            Text(
              name,
              style: AppTextStyle.whiteMedium.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Icon(Icons.search, color: AppColors.whiteColor, size: 25),
            AppFunctions.width(25),
            GestureDetector(
              onTap: onTapnotification,
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Icon(
                    Icons.notifications_rounded,
                    color: AppColors.whiteColor,
                    size: 25,
                  ),
                  Container(
                    height: 12,
                    width: 12,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.darkBlackColor,
                        width: 2,
                      ),
                      color: AppColors.whiteColor,
                      borderRadius: AppFunctions.borderRadius(25),
                    ),
                  ),
                ],
              ),
            ),
            AppFunctions.width(25),
            GestureDetector(
              onTap: onTapFilter,
              child: Image.asset(AppImages.filterImage, height: 22),
            ),
          ],
        ),
      ],
    );
  }
}
