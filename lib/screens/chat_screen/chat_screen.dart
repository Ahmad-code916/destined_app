import 'package:destined_app/screens/chat_screen/chat_screen_controller.dart';
import 'package:destined_app/screens/widgets/head_row_widget.dart';
import 'package:destined_app/screens/widgets/text_form_field_widget.dart';
import 'package:destined_app/services/app_functions.dart';
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
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.whiteColor),
                            borderRadius: AppFunctions.borderRadius(50),
                          ),
                          child: CircleAvatar(
                            radius: 35,
                            backgroundImage: NetworkImage(
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

                    Row(
                      spacing: 12,
                      children: [
                        Expanded(
                          child: TextFormFieldWidget(
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
