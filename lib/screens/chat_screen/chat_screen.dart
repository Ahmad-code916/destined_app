import 'package:cached_network_image/cached_network_image.dart';
import 'package:destined_app/screens/chat_screen/chat_screen_controller.dart';
import 'package:destined_app/screens/widgets/gradient_container.dart';
import 'package:destined_app/screens/widgets/text_form_field_widget.dart';
import 'package:destined_app/services/app_functions.dart';
import 'package:destined_app/services/user_base_controller.dart';
import 'package:destined_app/utils/app_images.dart';
import 'package:destined_app/utils/app_strings.dart';
import 'package:destined_app/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/app_colors.dart';
import '../widgets/primary_gradient.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

  final ChatScreenController controller = Get.put(ChatScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PrimaryGradient(
        firstColor: AppColors.gradientSecondryFirst,
        secondColor: AppColors.gradientSecondrySec,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: GetBuilder<ChatScreenController>(
              builder: (context) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Image.asset(AppImages.backIcon, height: 20),
                        ),
                        AppFunctions.width(20),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.whiteColor),
                            borderRadius: AppFunctions.borderRadius(50),
                          ),
                          child: CircleAvatar(
                            radius: 35,
                            backgroundImage: CachedNetworkImageProvider(
                              controller.user.imageUrl ?? "",
                            ),
                          ),
                        ),
                        AppFunctions.width(15),
                        Text(
                          controller.user.name ?? "",
                          style: AppTextStyle.whiteMedium,
                        ),
                      ],
                    ),

                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.only(top: 16, bottom: 16),
                        child: ListView.builder(
                          itemCount: controller.messages.length,
                          itemBuilder: (context, index) {
                            final message = controller.messages[index];
                            return Padding(
                              padding:
                                  message.senderId ==
                                          UserBaseController.userData.uid
                                      ? EdgeInsets.only(left: 70, bottom: 16)
                                      : EdgeInsets.only(right: 70, bottom: 16),

                              child: Column(
                                children: [
                                  GestureDetector(
                                    onLongPress: () {
                                      controller.deleteMessage(index);
                                    },
                                    child: GradientContainer(
                                      child: Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          color: AppColors.blackColor,
                                          borderRadius:
                                              AppFunctions.borderRadius(50),
                                        ),
                                        child: Text(
                                          message.message ?? "",
                                          style: AppTextStyle.whiteMedium,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment:
                                        message.senderId ==
                                                UserBaseController.userData.uid
                                            ? Alignment.centerRight
                                            : Alignment.centerLeft,
                                    child: Text(
                                      '${message.timestamp!.hour}:${message.timestamp!.minute}',
                                      style: AppTextStyle.whiteRegular,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Row(
                      spacing: 12,
                      children: [
                        Expanded(
                          child: TextFormFieldWidget(
                            onChange: (p0) {
                              controller.updateValue(p0);
                            },
                            hintText: AppStrings.message,
                            controller: controller.messageController,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            controller.createChat();
                          },
                          child: Icon(
                            Icons.send,
                            color: AppColors.whiteColor,
                            size: 32,
                          ),
                        ),
                      ],
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
