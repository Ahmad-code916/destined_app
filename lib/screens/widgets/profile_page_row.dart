import 'package:destined_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import '../../services/app_functions.dart';
import 'rich_text_widget.dart';

class ProfilePageRow extends StatelessWidget {
  const ProfilePageRow({
    super.key,
    required this.icon,
    required this.text1,
    required this.text2,
  });

  final IconData icon;
  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: AppColors.whiteColor, size: 20),
        AppFunctions.width(8),
        RichTextWidget(text1: text1, text2: text2),
        AppFunctions.width(16),
      ],
    );
  }
}
