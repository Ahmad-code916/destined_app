import 'package:destined_app/screens/chat_screen/chat_screen.dart';
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
        child: GetBuilder<MessageScreenController>(
          builder: (context) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(
                  width: double.infinity,
                  child: SingleChildScrollView(
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
                        Text(
                          AppStrings.newMatches,
                          style: AppTextStyle.whiteMedium,
                        ),
                        AppFunctions.height(32),
                        if (controller.userList.isEmpty)
                          Center(
                            child: Text(
                              'No match found',
                              style: AppTextStyle.whiteMedium,
                            ),
                          )
                        else
                          SizedBox(
                            height: 150,
                            child: ListView.builder(
                              itemCount: controller.userList.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                final user = controller.userList[index];
                                return Padding(
                                  padding: const EdgeInsets.only(right: 17),
                                  child: Column(
                                    spacing: 5,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: AppColors.whiteColor,
                                          ),
                                          shape: BoxShape.circle,
                                        ),
                                        child: CircleAvatar(
                                          radius: 50,
                                          backgroundImage: NetworkImage(
                                            user.imageUrl ?? "",
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          user.name ?? "",
                                          style: AppTextStyle.whiteRegular,
                                        ),
                                      ),
                                    ],
                                  ),
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
                        if (controller.userList.isEmpty)
                          Center(
                            child: Text(
                              'No User Found',
                              style: AppTextStyle.whiteMedium,
                            ),
                          )
                        else if (controller.userList.isNotEmpty)
                          SizedBox(
                            height: Get.height * 0.6,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: controller.threadList.length,
                              itemBuilder: (context, index) {
                                final thread = controller.threadList[index];
                                final user =
                                    (index < controller.otherUsersList.length)
                                        ? controller.otherUsersList[index]
                                        : null;
                                return GestureDetector(
                                  onTap: () {
                                    Get.to(
                                      () => ChatScreen(),
                                      arguments: {
                                        'threadId': thread.id,
                                        'user': user,
                                      },
                                    );
                                  },
                                  child: MessageWidget(
                                    name: user?.name ?? "",
                                    lastMessage: thread.lastMessage ?? "",
                                    image: user?.imageUrl ?? "",
                                    dateTime:
                                        '${thread.lastMessageTime!.hour}:${thread.lastMessageTime!.minute}',
                                    count: '3',
                                  ),
                                );
                              },
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
