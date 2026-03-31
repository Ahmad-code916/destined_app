import 'package:flutter/material.dart';
import '../../services/app_functions.dart';
import '../../utils/app_colors.dart';

class FilterScreenGradientContainer extends StatelessWidget {
  const FilterScreenGradientContainer({
    super.key,
    required this.widget,
    required this.icon,
    required this.onTap,
  });

  final Widget widget;
  final Widget icon;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: AppFunctions.borderRadius(50),
          border: Border.all(color: AppColors.blueColor),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [widget, icon],
        ),
      ),
    );
  }
}
