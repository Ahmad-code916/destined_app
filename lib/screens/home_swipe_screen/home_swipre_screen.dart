import 'package:destined_app/screens/home_swipe_screen/home_swipe_screen_controller.dart';
import 'package:destined_app/screens/widgets/primary_gradient.dart';
import 'package:destined_app/services/app_functions.dart';
import 'package:destined_app/utils/app_colors.dart';
import 'package:destined_app/utils/app_images.dart';
import 'package:destined_app/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:get/get.dart';

class HomeSwipreScreen extends StatelessWidget {
  HomeSwipreScreen({super.key});
  final HomeSwipeScreenController controller = Get.put(
    HomeSwipeScreenController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PrimaryGradient(
        firstColor: AppColors.gradientSecondryFirst,
        secondColor: AppColors.gradientSecondrySec,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: GetBuilder<HomeSwipeScreenController>(
              builder: (context) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          spacing: 12,
                          children: [
                            ClipRRect(
                              borderRadius: AppFunctions.borderRadius(50),
                              child: Image.asset(
                                AppImages.profileSelectedIcon,
                                height: 40,
                                width: 40,
                              ),
                            ),
                            Text(
                              'Name',
                              style: AppTextStyle.whiteMedium.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.search,
                              color: AppColors.whiteColor,
                              size: 25,
                            ),
                            AppFunctions.width(25),
                            Stack(
                              alignment: Alignment.topRight,
                              children: [
                                Icon(
                                  Icons.notifications_rounded,
                                  color: AppColors.whiteColor,
                                  size: 25,
                                ),

                                Container(
                                  height: 12,
                                  width: 12,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: AppColors.darkBlackColor,
                                      width: 2,
                                    ),
                                    color: AppColors.whiteColor,
                                    borderRadius: AppFunctions.borderRadius(25),
                                  ),
                                ),
                              ],
                            ),
                            AppFunctions.width(25),
                            Image.asset(AppImages.filterImage, height: 22),
                          ],
                        ),
                      ],
                    ),
                    AppFunctions.height(50),
                    SizedBox(
                      width: double.infinity,
                      height: Get.height * 0.6,
                      child: CardSwiper(
                        controller: controller.swiperController,
                        numberOfCardsDisplayed: 2,

                        onSwipe:
                            (previousIndex, currentIndex, direction) =>
                                controller.updateIndexOnSwipe(
                                  currentIndex ?? 0,
                                ),
                        backCardOffset: Offset(60, -50),
                        cardBuilder: (
                          context,
                          index,
                          horizontalOffsetPercentage,
                          verticalOffsetPercentage,
                        ) {
                          if (index >= controller.cards2.length)
                            return SizedBox();
                          final card = controller.cards2[index];
                          final isTopCard = index == controller.currentIndex;
                          return Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                stops: [0.0, 1.0],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  AppColors.swipeCardPrimaryColor,
                                  AppColors.swipeCardSecondryColor,
                                ],
                              ),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color:
                                    isTopCard
                                        ? AppColors.whiteColor
                                        : AppColors.transparentColor,
                                width: 3,
                              ),
                              color: AppColors.darkBlackColor,
                            ),
                            child: Text(card, style: AppTextStyle.whiteBold),
                          );
                        },
                        cardsCount: controller.cards2.length,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
