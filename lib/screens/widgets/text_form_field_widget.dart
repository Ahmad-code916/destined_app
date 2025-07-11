import 'package:flutter/material.dart';
import 'package:destined_app/screens/widgets/gradient_container.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_text_style.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    super.key,
    required this.controller,
    this.icon,
    this.hintText,
  });

  final TextEditingController controller;
  final Widget? icon;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return GradientContainer(
      child: Container(
        padding: EdgeInsets.only(left: 16, right: 16),
        decoration: BoxDecoration(
          color: AppColors.darkBlackColor,
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
        child: TextFormField(
          controller: controller,
          style: AppTextStyle.whiteMedium,
          decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: icon,
            contentPadding: EdgeInsets.only(bottom: 2),
            filled: true,
            fillColor: AppColors.darkBlackColor,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.darkBlackColor),
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.darkBlackColor),
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
          ),
        ),
      ),
    );
  }
}
