import 'package:cached_network_image/cached_network_image.dart';
import 'package:destined_app/screens/chat_screen/chat_screen_controller.dart';
import 'package:destined_app/screens/profile_screen/profile_screen.dart';
import 'package:destined_app/screens/user_details_screen/user_details_screen.dart';
import 'package:destined_app/screens/widgets/chat_screen_menu.dart';
import 'package:destined_app/screens/widgets/gradient_container.dart';
import 'package:destined_app/screens/widgets/text_form_field_widget.dart';
import 'package:destined_app/services/app_functions.dart';
import 'package:destined_app/services/user_base_controller.dart';
import 'package:destined_app/utils/app_images.dart';
import 'package:destined_app/utils/app_strings.dart';
import 'package:destined_app/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../utils/app_colors.dart';
import '../widgets/primary_gradient.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

  final ChatScreenController controller = Get.put(ChatScreenController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatScreenController>(
      builder: (context) {
        return Scaffold(
          body: PrimaryGradient(
            firstColor: AppColors.gradientSecondryFirst,
            secondColor: AppColors.gradientSecondrySec,
            child: SafeArea(
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      bottom: 16,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: Image.asset(
                                    AppImages.backIcon,
                                    height: 20,
                                  ),
                                ),
                                AppFunctions.width(20),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: AppColors.whiteColor,
                                    ),
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
                                  style: AppTextStyle.whiteMedium.copyWith(
                                    color: AppColors.darkBlueColor,
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: () {
                                controller.showMenuOnTapIcon();
                              },
                              child: Image.asset(
                                AppImages.menuIcon,
                                height: 20,
                              ),
                            ),
                          ],
                        ),
                        if (controller.messages.isEmpty)
                          Center(
                            child: Text(
                              'Start Chat!',
                              style: AppTextStyle.whiteRegular.copyWith(
                                color: AppColors.purpleColorNew,
                              ),
                            ),
                          )
                        else if (controller.messages.isNotEmpty)
                          Flexible(
                            child: Padding(
                              padding: EdgeInsets.only(top: 16, bottom: 16),
                              child: ListView.builder(
                                reverse: true,
                                itemCount: controller.messages.length,
                                itemBuilder: (context, index) {
                                  final message = controller.messages[index];
                                  return Padding(
                                    padding:
                                        message.senderId ==
                                                UserBaseController.userData.uid
                                            ? EdgeInsets.only(
                                              left: 70,
                                              bottom: 16,
                                            )
                                            : EdgeInsets.only(
                                              right: 70,
                                              bottom: 16,
                                            ),

                                    child: Column(
                                      children: [
                                        GestureDetector(
                                          onLongPress: () {
                                            controller.deleteMessage(index);
                                          },
                                          child:
                                              message.messageType == 'text'
                                                  ? Container(
                                                    width: double.infinity,
                                                    padding: EdgeInsets.all(10),
                                                    decoration: BoxDecoration(
                                                      color:
                                                          AppColors.whiteColor,
                                                      borderRadius:
                                                          AppFunctions.borderRadius(
                                                            50,
                                                          ),
                                                      border: Border.all(
                                                        color: Color(
                                                          0xffF1EFE2,
                                                        ),
                                                      ),
                                                    ),
                                                    child: Text(
                                                      message.message ?? "",
                                                      style: AppTextStyle
                                                          .whiteMedium
                                                          .copyWith(
                                                            color:
                                                                AppColors
                                                                    .lightPurpleThird,
                                                          ),
                                                    ),
                                                  )
                                                  : Container(
                                                    decoration: BoxDecoration(
                                                      color:
                                                          AppColors.whiteColor,
                                                      borderRadius:
                                                          AppFunctions.borderRadius(
                                                            50,
                                                          ),
                                                      border: Border.all(
                                                        color:
                                                            AppColors
                                                                .lightPurpleThird,
                                                      ),
                                                    ),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius: BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                  50,
                                                                ),
                                                            topRight:
                                                                Radius.circular(
                                                                  50,
                                                                ),
                                                            bottomLeft:
                                                                message
                                                                        .message!
                                                                        .isEmpty
                                                                    ? Radius.circular(
                                                                      50,
                                                                    )
                                                                    : Radius.circular(
                                                                      0,
                                                                    ),
                                                            bottomRight:
                                                                message
                                                                        .message!
                                                                        .isEmpty
                                                                    ? Radius.circular(
                                                                      50,
                                                                    )
                                                                    : Radius.circular(
                                                                      0,
                                                                    ),
                                                          ),
                                                          child: CachedNetworkImage(
                                                            imageUrl:
                                                                message
                                                                    .imageUrl ??
                                                                "",
                                                            errorWidget:
                                                                (
                                                                  context,
                                                                  url,
                                                                  error,
                                                                ) => Icon(
                                                                  Icons.image,
                                                                  color:
                                                                      AppColors
                                                                          .whiteColor,
                                                                ),
                                                            placeholder:
                                                                (
                                                                  context,
                                                                  url,
                                                                ) => Center(
                                                                  child: CircularProgressIndicator(
                                                                    color:
                                                                        AppColors
                                                                            .whiteColor,
                                                                  ),
                                                                ),
                                                            height: 200,
                                                            width:
                                                                double.infinity,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        if (message
                                                            .message!
                                                            .isNotEmpty)
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets.all(
                                                                  15,
                                                                ),
                                                            child: Text(
                                                              message.message ??
                                                                  "",
                                                              style: AppTextStyle
                                                                  .whiteMedium
                                                                  .copyWith(
                                                                    color:
                                                                        AppColors
                                                                            .lightPurpleThird,
                                                                  ),
                                                            ),
                                                          ),
                                                      ],
                                                    ),
                                                  ),
                                        ),
                                        Align(
                                          alignment:
                                              message.senderId ==
                                                      UserBaseController
                                                          .userData
                                                          .uid
                                                  ? Alignment.centerRight
                                                  : Alignment.centerLeft,
                                          child: Text(
                                            '${message.timestamp!.hour}:${message.timestamp!.minute}',
                                            style: AppTextStyle.whiteRegular
                                                .copyWith(
                                                  color:
                                                      AppColors.purpleColorNew,
                                                ),
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
                                secIcon:
                                    controller.image != null
                                        ? Padding(
                                          padding: const EdgeInsets.only(
                                            left: 12,
                                          ),
                                          child: Image.file(
                                            controller.image!,
                                            height: 25,
                                          ),
                                        )
                                        : null,
                                onChange: (p0) {
                                  controller.updateValue(p0);
                                },
                                hintText: AppStrings.message,
                                controller: controller.messageController,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                controller.pickImage();
                              },
                              child: Icon(
                                Icons.camera_alt,
                                color: AppColors.purpleColorNew,
                                size: 32,
                              ),
                            ),
                            controller.isSendingMessage == true
                                ? CircularProgressIndicator(
                                  color: AppColors.whiteColor,
                                )
                                : GestureDetector(
                                  onTap: () {
                                    controller.createChat();
                                  },
                                  child: Icon(
                                    Icons.send,
                                    color: AppColors.darkBlueColor,
                                    size: 32,
                                  ),
                                ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  if (controller.showMenuCard == true)
                    ChatScreenMenu(
                      onTapClearIcon: () {
                        controller.showMenuOnTapIcon();
                      },
                      onTapClearViewProfile: () {
                        Get.to(
                          () => UserDetailsScreen(),
                          arguments: {'uid': controller.user.uid},
                        );
                      },
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
