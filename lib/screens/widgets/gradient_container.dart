import 'package:destined_app/services/app_functions.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3),
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: AppFunctions.borderRadius(50),
        gradient: LinearGradient(
          colors: [AppColors.lightRedColor, AppColors.purpleColor],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          stops: [0, 1.0],
        ),
      ),
      child: child,
    );
  }
}
