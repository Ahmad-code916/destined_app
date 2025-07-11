import 'package:destined_app/utils/app_text_style.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.buttonText,
    required this.onTap,
  });
  final String buttonText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        width: 212,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.lightRedColor, AppColors.purpleColor],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            stops: [0, 1.0],
          ),
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: AppTextStyle.whiteMedium.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
