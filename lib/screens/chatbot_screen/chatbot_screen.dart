import 'package:destined_app/screens/chatbot_screen/chatbot_screen_controller.dart';
import 'package:destined_app/screens/widgets/gradient_container.dart';
import 'package:destined_app/screens/widgets/primary_gradient.dart';
import 'package:destined_app/screens/widgets/text_form_field_widget.dart';
import 'package:destined_app/services/app_functions.dart';
import 'package:destined_app/utils/app_colors.dart';
import 'package:destined_app/utils/app_images.dart';
import 'package:destined_app/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatbotScreen extends StatelessWidget {
  ChatbotScreen({super.key});

  final ChatbotScreenController controller = Get.put(ChatbotScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PrimaryGradient(
        firstColor: AppColors.gradientSecondryFirst,
        secondColor: AppColors.gradientSecondrySec,
        child: SafeArea(
          child: GetBuilder<ChatbotScreenController>(
            builder: (context) {
              return Padding(
                padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                child: Column(
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
                            child: Icon(Icons.person),
                          ),
                        ),
                        AppFunctions.width(15),
                        Text('Chatbot', style: AppTextStyle.whiteMedium),
                      ],
                    ),
                    AppFunctions.height(12),
                    Expanded(
                      child: ListView.builder(
                        reverse: true,
                        itemCount: controller.chatMessages.length,
                        itemBuilder: (context, index) {
                          final message = controller.chatMessages[index];
                          return Padding(
                            padding:
                                message.isSender == true
                                    ? EdgeInsets.only(left: 70, bottom: 16)
                                    : EdgeInsets.only(right: 70, bottom: 16),

                            child: Column(
                              children: [
                                GradientContainer(
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: AppColors.blackColor,
                                      borderRadius: AppFunctions.borderRadius(
                                        50,
                                      ),
                                    ),
                                    child: Text(
                                      message.message ?? "",
                                      style: AppTextStyle.whiteMedium,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment:
                                      message.isSender == true
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
                    Row(
                      spacing: 20,
                      children: [
                        Expanded(
                          child: TextFormFieldWidget(
                            controller: controller.messageText,
                            hintText: 'Write',
                            hintStyle: TextStyle(color: AppColors.whiteColor),
                          ),
                        ),
                        controller.isLoading == false
                            ? GestureDetector(
                              onTap: () {
                                controller.sendMessage();
                              },
                              child: Icon(
                                Icons.send,
                                color: AppColors.whiteColor,
                                size: 25,
                              ),
                            )
                            : CircularProgressIndicator(color: Colors.white),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
