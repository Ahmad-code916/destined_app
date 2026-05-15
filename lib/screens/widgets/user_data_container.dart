import 'package:cached_network_image/cached_network_image.dart';
import 'package:destined_app/services/app_functions.dart';
import 'package:destined_app/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';

class UserDataContainer extends StatelessWidget {
  const UserDataContainer({
    super.key,
    required this.name,
    required this.distance,
    required this.age,
    required this.image,
    this.onTapContainer,
  });

  final String name;
  final String image;
  final double distance;
  final String age;
  final void Function()? onTapContainer;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapContainer,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          gradient: LinearGradient(
            stops: [0.0, 1.0],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.swipeCardPrimaryColor,
              AppColors.swipeCardSecondryColor,
            ],
          ),
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(color: AppColors.whiteColor),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Center(
                    child: ClipRRect(
                      borderRadius: AppFunctions.borderRadius(10),
                      child: CachedNetworkImage(
                        imageUrl: image,
                        height: 120,
                        fit: BoxFit.fitWidth,
                        width: double.infinity,
                        placeholder:
                            (context, url) => Center(
                              child: CircularProgressIndicator(
                                color: AppColors.purpleColorNew,
                              ),
                            ),
                        errorWidget:
                            (context, url, error) =>
                                Center(child: Icon(Icons.image)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            AppFunctions.height(6),
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      text: '$name, ',
                      children: [TextSpan(text: age)],
                      style: AppTextStyle.whiteMedium.copyWith(fontSize: 15),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: '$distance ',
                          children: [TextSpan(text: 'km away')],
                          style: AppTextStyle.whiteMedium.copyWith(
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
