import 'package:flutter/material.dart';

class PrimaryGradient extends StatelessWidget {
  const PrimaryGradient({
    super.key,
    required this.child,
    required this.firstColor,
    required this.secondColor,
  });
  final Widget child;
  final Color firstColor;
  final Color secondColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [firstColor, secondColor],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0, 1.0],
        ),
      ),
      child: child,
    );
  }
}
