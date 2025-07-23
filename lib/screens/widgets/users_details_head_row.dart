import 'package:destined_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UsersDetailsHeadRow extends StatelessWidget {
  const UsersDetailsHeadRow({
    super.key,
    required this.firstColor,
    required this.secondColor,
    required this.child,
    required this.onTapChild,
  });
  final Color firstColor;
  final Color secondColor;
  final Widget child;
  final void Function() onTapChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 24, top: 20),
      height: 90,
      width: Get.width * 0.6,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [firstColor, secondColor],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [0, 1.0],
        ),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: GestureDetector(onTap: onTapChild, child: child),
      ),
    );
  }
}
