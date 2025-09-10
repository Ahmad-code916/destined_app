import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../services/app_functions.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_text_style.dart';

class MessageWidget extends StatelessWidget {
  const MessageWidget({
    super.key,
    required this.name,
    required this.lastMessage,
    required this.image,
    required this.dateTime,
    required this.count,
  });

  final String name;
  final String lastMessage;
  final String image;
  final String dateTime;
  final String count;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.lightBrown,
        borderRadius: AppFunctions.borderRadius(18),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 12,
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.whiteColor, width: 2),
                      borderRadius: AppFunctions.borderRadius(10),
                    ),
                    margin: const EdgeInsets.only(right: 17),
                    child: ClipRRect(
                      borderRadius: AppFunctions.borderRadius(10),
                      child: CachedNetworkImage(
                        imageUrl: image,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 6,
                      children: [
                        Text(
                          name,
                          style: AppTextStyle.whiteMedium.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          lastMessage,
                          style: AppTextStyle.lightPurpleSecMedium,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            AppFunctions.width(3),
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  dateTime,
                  style: AppTextStyle.lightPurpleSecMedium.copyWith(
                    color: AppColors.whiteColor,
                  ),
                ),
                // Container(
                //   height: 20,
                //   width: 20,
                //   decoration: BoxDecoration(
                //     color: AppColors.darkRed,
                //     shape: BoxShape.circle,
                //   ),
                //   child: Center(
                //     child: Text(
                //       count,
                //       style: AppTextStyle.whiteRegular.copyWith(fontSize: 14),
                //     ),
                //   ),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
