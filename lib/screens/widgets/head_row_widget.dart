import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../services/app_functions.dart';
import '../../utils/app_text_style.dart';

class HeadRowWidget extends StatelessWidget {
  const HeadRowWidget({super.key, required this.image, required this.name});

  final String image;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          spacing: 12,
          children: [
            ClipRRect(
              borderRadius: AppFunctions.borderRadius(50),
              child: CircleAvatar(
                backgroundImage: CachedNetworkImageProvider(image),
                radius: 25,
              ),
            ),
            Text(
              name,
              style: AppTextStyle.whiteMedium.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
