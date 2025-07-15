import 'package:destined_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UsersDetailsHeadRow extends StatelessWidget {
  const UsersDetailsHeadRow({
    super.key,
    required this.firstColor,
    required this.secondColor,
  });
  final Color firstColor;
  final Color secondColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 6,
          child: Container(
            height: 90,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [firstColor, secondColor],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                stops: [0, 1.0],
              ),
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: Container(
            width: Get.width * 0.6,
            height: 90,
            decoration: BoxDecoration(color: AppColors.gradientSecondryFirst),
          ),
        ),
      ],
    );
  }
}
