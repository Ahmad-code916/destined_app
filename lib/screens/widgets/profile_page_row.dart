import 'package:destined_app/utils/app_colors.dart';
import 'package:destined_app/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import '../../services/app_functions.dart';

class ProfilePageRow extends StatelessWidget {
  const ProfilePageRow({super.key, required this.icon, required this.text1});

  final IconData icon;
  final String text1;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: AppColors.whiteColor, size: 20),
        AppFunctions.width(8),
        Text(text1, style: AppTextStyle.whiteRegular),
        AppFunctions.width(16),
      ],
    );
  }
}
