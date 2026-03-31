import 'package:destined_app/services/app_functions.dart';
import 'package:destined_app/utils/app_colors.dart';
import 'package:destined_app/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class ConfirmDialog extends StatelessWidget {
  const ConfirmDialog({
    super.key,
    required this.onTapCancel,
    required this.onTapConfirm,
    required this.title,
    required this.subTitle,
  });

  final void Function() onTapCancel;
  final void Function() onTapConfirm;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        style: AppTextStyle.whiteMedium.copyWith(color: AppColors.redColor),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(subTitle),
          AppFunctions.height(20),
          Row(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(onTap: onTapCancel, child: Text('Cancel')),
              GestureDetector(
                onTap: onTapConfirm,
                child: Text(
                  'Ok',
                  style: AppTextStyle.whiteRegular.copyWith(
                    color: AppColors.redColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
