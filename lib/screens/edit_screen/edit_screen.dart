import 'package:cached_network_image/cached_network_image.dart';
import 'package:destined_app/screens/edit_screen/edit_screen_controller.dart';
import 'package:destined_app/screens/widgets/button_widget.dart';
import 'package:destined_app/screens/widgets/drop_down_widget.dart';
import 'package:destined_app/screens/widgets/gradient_container.dart';
import 'package:destined_app/screens/widgets/primary_gradient.dart';
import 'package:destined_app/screens/widgets/text_form_field_widget.dart';
import 'package:destined_app/services/app_functions.dart';
import 'package:destined_app/services/user_base_controller.dart';
import 'package:destined_app/utils/app_colors.dart';
import 'package:destined_app/utils/app_strings.dart';
import 'package:destined_app/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditScreen extends StatelessWidget {
  const EditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EditScreenController());
    return Scaffold(
      body: GetBuilder<EditScreenController>(
        builder: (context) {
          return PrimaryGradient(
            firstColor: AppColors.gradientSecondryFirst,
            secondColor: AppColors.gradientSecondrySec,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      AppFunctions.height(30),
                      Text(
                        AppStrings.profileDetails.tr,
                        style: AppTextStyle.whiteBold.copyWith(fontSize: 36),
                      ),
                      AppFunctions.height(12),
                      Align(
                        alignment: Alignment.center,
                        child: Stack(
                          children: [
                            Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.whiteColor,
                              ),
                              height: 120,
                              width: 120,
                              child: Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.purpleColor,
                                ),
                                child: Center(
                                  child:
                                      controller.image == null
                                          ? CachedNetworkImage(
                                            imageUrl:
                                                UserBaseController
                                                    .userData
                                                    .imageUrl ??
                                                "",
                                          )
                                          : CircleAvatar(
                                            radius: 100,
                                            backgroundImage: FileImage(
                                              controller.image!,
                                            ),
                                          ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                controller.pickImage();
                              },
                              child: Container(
                                margin: EdgeInsets.only(left: 75, top: 90),
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: AppColors.blackColor,
                                    width: 3,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(50),
                                  ),
                                  gradient: LinearGradient(
                                    colors: [
                                      AppColors.lightRedColor,
                                      AppColors.purpleColor,
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    stops: [0, 1.0],
                                  ),
                                ),
                                child: Icon(
                                  Icons.camera_alt,
                                  color: AppColors.whiteColor,
                                  size: 22,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      AppFunctions.height(30),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          AppStrings.fullName.tr,
                          style: AppTextStyle.pinkMedium,
                        ),
                      ),
                      AppFunctions.height(16),
                      TextFormFieldWidget(
                        controller: controller.firstNameController,
                      ),
                      AppFunctions.height(20),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          AppStrings.lastName.tr,
                          style: AppTextStyle.pinkMedium,
                        ),
                      ),
                      AppFunctions.height(16),
                      TextFormFieldWidget(
                        controller: controller.lastNameController,
                      ),
                      AppFunctions.height(20),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          AppStrings.gender.tr,
                          style: AppTextStyle.pinkMedium,
                        ),
                      ),
                      AppFunctions.height(16),
                      DropDownWidget(
                        items: controller.genderList,
                        onChange: (value) {
                          controller.onChange(value);
                        },
                        selectedValue: controller.selectedDropDownValue,
                      ),
                      AppFunctions.height(22),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          AppStrings.dob.tr,
                          style: AppTextStyle.pinkMedium,
                        ),
                      ),
                      AppFunctions.height(10),
                      GestureDetector(
                        onTap: () {
                          controller.selectDate();
                        },
                        child: GradientContainer(
                          child: Container(
                            height: 55,
                            decoration: BoxDecoration(
                              borderRadius: AppFunctions.borderRadius(50),
                              color: AppColors.blackColor,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    controller.selectedDate == null
                                        ? AppStrings.selectDate.tr
                                        : '${controller.selectedDate!.day.toString()}-${controller.selectedDate!.month.toString()}-${controller.selectedDate!.year.toString()}',
                                    style: AppTextStyle.whiteRegular,
                                  ),
                                  Icon(
                                    Icons.calendar_month,
                                    color: AppColors.whiteColor,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      AppFunctions.height(30),
                      ButtonWidget(
                        buttonText: AppStrings.saveEdit.tr,
                        onTap: () {
                          controller.updateProfile();
                        },
                        isLoading: controller.isLoading,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
