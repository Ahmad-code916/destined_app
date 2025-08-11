import 'package:flutter/material.dart';

import '../../utils/app_text_style.dart';

class RichTextWidget extends StatelessWidget {
  const RichTextWidget({super.key, required this.text1, required this.text2});

  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text1,
        children: [TextSpan(text: text2)],
        style: AppTextStyle.whiteRegular,
      ),
    );
  }
}
