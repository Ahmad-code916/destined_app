import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_text_style.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    super.key,
    required this.controller,
    this.icon,
    this.hintText,
    this.hintStyle,
    this.onChange,
    this.secIcon,
  });

  final TextEditingController controller;
  final Widget? icon;
  final String? hintText;
  final TextStyle? hintStyle;
  final Function(String)? onChange;
  final Widget? secIcon;

  @override
  Widget build(BuildContext context) {
    return
    // GradientContainer(
    //   height: 60,
    //   child: Container(
    //     padding: EdgeInsets.only(left: 16, right: 16),
    //     decoration: BoxDecoration(
    //       color: AppColors.darkBlackColor,
    //       borderRadius: BorderRadius.all(Radius.circular(50)),
    //     ),
    //     child:
    TextFormField(
      onChanged: onChange,
      controller: controller,
      style: AppTextStyle.whiteMedium.copyWith(color: AppColors.darkBlueColor),
      decoration: InputDecoration(
        suffix: secIcon,
        hintText: hintText,
        hintStyle: hintStyle,
        suffixIcon: icon,
        suffixIconColor: AppColors.lightPurpleSec,
        // contentPadding: EdgeInsets.only(bottom: 2),
        filled: true,
        fillColor: AppColors.whiteColor,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.lightPurpleSec),
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.blueColor),
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
      ),
      // ),
      // ),
    );
  }
}
