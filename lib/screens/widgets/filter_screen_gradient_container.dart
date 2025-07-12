import 'package:flutter/material.dart';
import '../../services/app_functions.dart';
import '../../utils/app_colors.dart';
import 'gradient_container.dart';

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
      child: GradientContainer(
        height: 60,
        child: Container(
          padding: EdgeInsets.only(left: 16, right: 16),
          decoration: BoxDecoration(
            color: AppColors.darkBlackColor,
            borderRadius: AppFunctions.borderRadius(50),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [widget, icon],
          ),
        ),
      ),
    );
  }
}
