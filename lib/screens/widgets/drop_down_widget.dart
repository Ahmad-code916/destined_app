import 'package:destined_app/screens/widgets/gradient_container.dart';
import 'package:destined_app/utils/app_text_style.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class DropDownWidget extends StatelessWidget {
  const DropDownWidget({
    super.key,
    this.selectedValue,
    required this.items,
    required this.onChange,
  });
  final String? selectedValue;
  final List<String> items;
  final ValueChanged<String?> onChange;

  @override
  Widget build(BuildContext context) {
    return GradientContainer(
      height: 60,
      child: Container(
        padding: EdgeInsets.only(left: 16, right: 16),
        decoration: BoxDecoration(
          color: AppColors.darkBlackColor,
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
        child: DropdownButton(
          hint: Text('Select', style: AppTextStyle.whiteMedium),
          iconEnabledColor: AppColors.whiteColor,
          dropdownColor: AppColors.darkBlackColor,
          style: AppTextStyle.whiteMedium,
          underline: const SizedBox(),
          isExpanded: true,
          value: selectedValue,
          items:
              items.map((String? value) {
                return DropdownMenuItem(value: value, child: Text(value ?? ""));
              }).toList(),
          onChanged: onChange,
        ),
      ),
    );
  }
}
