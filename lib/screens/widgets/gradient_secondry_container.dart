import 'package:flutter/material.dart';

import '../../services/app_functions.dart';

class GradientSecondryContainer extends StatelessWidget {
  const GradientSecondryContainer({
    super.key,
    required this.child,
    required this.firstColor,
    required this.thirdColor,
  });

  final Widget child;
  final Color firstColor;
  final Color thirdColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3),
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        borderRadius: AppFunctions.borderRadius(50),
        gradient: LinearGradient(
          colors: [firstColor, thirdColor],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0, 1.0],
        ),
      ),
      child: Center(child: child),
    );
  }
}
