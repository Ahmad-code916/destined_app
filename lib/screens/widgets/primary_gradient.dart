import 'package:destined_app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class PrimaryGradient extends StatelessWidget {
  const PrimaryGradient({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.lightBlue2, AppColors.lightYellow],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: child,
    );
  }
}
