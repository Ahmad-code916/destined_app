import 'package:destined_app/screens/filter_screen/filter_screen.dart';
import 'package:destined_app/screens/home_swipe_screen/home_swipe_screen_controller.dart';
import 'package:destined_app/screens/widgets/gradient_secondry_container.dart';
import 'package:destined_app/screens/widgets/primary_gradient.dart';
import 'package:destined_app/services/app_functions.dart';
import 'package:destined_app/services/user_base_controller.dart';
import 'package:destined_app/utils/app_colors.dart';
import 'package:destined_app/utils/app_images.dart';
import 'package:destined_app/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:get/get.dart';

import '../widgets/head_row_widget.dart';

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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  HeadRowWidget(
                    image: UserBaseController.userData.imageUrl ?? "",
                    name: UserBaseController.userData.name ?? "",
                    onTapFilter: () => Get.to(() => FilterScreen()),
                    onTapnotification: () {},
                  ),
                  AppFunctions.height(30),
                  SizedBox(
                    height: Get.height * 0.6,
                    child: CardSwiper(
                      numberOfCardsDisplayed: 2,
                      cardsCount: controller.userList.length,
                      cardBuilder: (context, index, prev, ind) {
                        final card = controller.cards2[index];
                        return GestureDetector(
                          onTap: () {},
                          child: Container(
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
                                color: AppColors.whiteColor,
                                width: 3,
                              ),
                              color: AppColors.darkBlackColor,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(card, style: AppTextStyle.whiteBold),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 26,
                                    right: 26,
                                    bottom: 36,
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        spacing: 20,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                              color: AppColors.whiteColor,
                                              borderRadius:
                                                  AppFunctions.borderRadius(50),
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                                  AppFunctions.borderRadius(50),
                                              child: Image.asset(
                                                AppImages.swipeImage,
                                                height: 80,
                                                width: 80,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Anna Mcconaughey',
                                                  style: AppTextStyle.whiteBold
                                                      .copyWith(fontSize: 24),
                                                ),
                                                Text(
                                                  '1.5 km away',
                                                  style:
                                                      AppTextStyle.whiteRegular,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      AppFunctions.height(20),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            width: 80,
                                            height: 10,
                                            child: ListView.builder(
                                              itemCount: 10,
                                              scrollDirection: Axis.horizontal,
                                              shrinkWrap: true,
                                              primary: true,
                                              itemBuilder: (context, index) {
                                                return Container(
                                                  margin: EdgeInsets.only(
                                                    left: 2,
                                                    right: 5,
                                                  ),
                                                  height: 10,
                                                  width: 10,
                                                  decoration: BoxDecoration(
                                                    color:
                                                        index == 0
                                                            ? AppColors
                                                                .whiteColor
                                                            : AppColors
                                                                .darkBlackColor,
                                                    border: Border.all(
                                                      color:
                                                          AppColors.whiteColor,
                                                      width: 2,
                                                    ),
                                                    borderRadius:
                                                        AppFunctions.borderRadius(
                                                          50,
                                                        ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                          Icon(
                                            Icons.chat_outlined,
                                            color: AppColors.whiteColor,
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
                      },
                    ),
                  ),
                  AppFunctions.height(20),
                  Padding(
                    padding: const EdgeInsets.only(left: 50, right: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GradientSecondryContainer(
                          firstColor: Color(0xff34F07F),
                          thirdColor: Color(0xff10AA7C),
                          child: Icon(
                            Icons.thumb_up,
                            color: AppColors.whiteColor,
                          ),
                        ),
                        GradientSecondryContainer(
                          firstColor: Color(0xffFFBC7D),
                          thirdColor: Color(0xffEF5533),
                          child: Icon(
                            Icons.favorite,
                            color: AppColors.whiteColor,
                          ),
                        ),
                        GradientSecondryContainer(
                          firstColor: Color(0xffFF7D95),
                          thirdColor: Color(0xffEF3349),
                          child: Icon(
                            Icons.thumb_down,
                            color: AppColors.whiteColor,
                          ),
                        ),
                        GradientSecondryContainer(
                          firstColor: Color(0xff2285FA),
                          thirdColor: Color(0xff1B40C1),
                          child: Icon(
                            Icons.info_outline_rounded,
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
