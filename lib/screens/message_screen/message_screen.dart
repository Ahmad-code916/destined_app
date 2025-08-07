import 'package:destined_app/screens/message_screen/message_screen_controller.dart';
import 'package:destined_app/screens/widgets/gradient_secondry_container.dart';
import 'package:destined_app/screens/widgets/message_widget.dart';
import 'package:destined_app/screens/widgets/primary_gradient.dart';
import 'package:destined_app/screens/widgets/text_form_field_widget.dart';
import 'package:destined_app/services/app_functions.dart';
import 'package:destined_app/utils/app_images.dart';
import 'package:destined_app/utils/app_strings.dart';
import 'package:destined_app/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_colors.dart';

class MessageScreen extends StatelessWidget {
  MessageScreen({super.key});

  final MessageScreenController controller = Get.put(MessageScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PrimaryGradient(
        firstColor: AppColors.gradientSecondryFirst,
        secondColor: AppColors.gradientSecondrySec,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          GradientSecondryContainer(
                            firstColor: AppColors.lightRed,
                            thirdColor: AppColors.darkRed,
                            child: Icon(
                              Icons.message,
                              color: AppColors.whiteColor,
                            ),
                          ),
                          AppFunctions.width(11),
                          Text(
                            AppStrings.addNewMessage,
                            style: AppTextStyle.whiteMedium.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Image.asset(AppImages.archieveIcon, height: 21),
                    ],
                  ),
                  AppFunctions.height(32),
                  TextFormFieldWidget(
                    controller: controller.searchController,
                    hintText: 'Search Message, Match',
                    hintStyle: AppTextStyle.whiteMedium,
                  ),
                  AppFunctions.height(30),
                  Text(AppStrings.newMatches, style: AppTextStyle.whiteMedium),
                  AppFunctions.height(32),
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.whiteColor),
                            // borderRadius: AppFunctions.borderRadius(25),
                            shape: BoxShape.circle,
                          ),
                          margin: const EdgeInsets.only(right: 17),
                          child: Image.asset(AppImages.musicImage),
                        );
                      },
                    ),
                  ),
                  AppFunctions.height(30),
                  Text(
                    AppStrings.allMessages,
                    style: AppTextStyle.whiteMedium.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                    ),
                  ),
                  AppFunctions.height(30),
                  MessageWidget(
                    name: 'Belle Benson',
                    lastMessage:
                        'Hi, How are you? Nice to meet you? Free now, You?',
                    image: AppImages.musicImage,
                    dateTime: '3:45 PM',
                    count: '3',
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
