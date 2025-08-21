import 'package:destined_app/screens/login_screen/login_screen.dart';
import 'package:destined_app/screens/personal_details_screen/personal_details_screen_controller.dart';
import 'package:destined_app/screens/widgets/button_widget.dart';
import 'package:destined_app/screens/widgets/drop_down_widget.dart';
import 'package:destined_app/screens/widgets/gradient_container.dart';
import 'package:destined_app/screens/widgets/primary_gradient.dart';
import 'package:destined_app/screens/widgets/text_form_field_widget.dart';
import 'package:destined_app/services/app_functions.dart';
import 'package:destined_app/utils/app_images.dart';
import 'package:destined_app/utils/app_strings.dart';
import 'package:destined_app/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';
import 'package:get/get.dart';

class PersonalDetailsScreen extends StatelessWidget {
  PersonalDetailsScreen({super.key});

  final PersonalDetailsScreenController controller = Get.put(
    PersonalDetailsScreenController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PrimaryGradient(
        firstColor: Color(0xff641C3C),
        secondColor: Color(0xff07011A),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: GetBuilder<PersonalDetailsScreenController>(
              builder: (context) {
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                            Get.to(() => LoginScreen());
                          },
                          child: Text(
                            AppStrings.login,
                            style: AppTextStyle.whiteBold.copyWith(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      AppFunctions.height(30),
                      Text(
                        AppStrings.profileDetails,
                        style: AppTextStyle.whiteBold.copyWith(fontSize: 36),
                      ),
                      AppFunctions.height(12),
                      Text(
                        AppStrings.filldetails,
                        style: AppTextStyle.whiteBold.copyWith(fontSize: 16),
                      ),
                      AppFunctions.height(40),
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
                                  child: Image.asset(
                                    AppImages.profileImage,
                                    fit: BoxFit.cover,
                                    height: 50,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 90, left: 75),
                              child: Container(
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
                      AppFunctions.height(36),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          AppStrings.email,
                          style: AppTextStyle.pinkMedium,
                        ),
                      ),
                      AppFunctions.height(10),
                      TextFormFieldWidget(
                        controller: controller.emailController,
                      ),
                      AppFunctions.height(22),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          AppStrings.password,
                          style: AppTextStyle.pinkMedium,
                        ),
                      ),
                      AppFunctions.height(10),
                      TextFormFieldWidget(
                        controller: controller.passwordController,
                      ),
                      AppFunctions.height(22),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          AppStrings.fullName,
                          style: AppTextStyle.pinkMedium,
                        ),
                      ),
                      AppFunctions.height(10),
                      TextFormFieldWidget(
                        controller: controller.firstNameController,
                      ),
                      AppFunctions.height(22),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          AppStrings.lastName,
                          style: AppTextStyle.pinkMedium,
                        ),
                      ),
                      AppFunctions.height(10),
                      TextFormFieldWidget(
                        controller: controller.lastNameController,
                      ),
                      AppFunctions.height(22),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          AppStrings.dob,
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
                                        ? 'Select Date'
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
                      AppFunctions.height(22),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          AppStrings.gender,
                          style: AppTextStyle.pinkMedium,
                        ),
                      ),
                      AppFunctions.height(10),
                      DropDownWidget(
                        selectedValue:
                            controller.selectedGender == null
                                ? null
                                : controller.selectedGender ?? "",
                        items: controller.genderList,
                        onChange: controller.onChange,
                      ),
                      AppFunctions.height(44),
                      ButtonWidget(
                        buttonText: AppStrings.continu,
                        onTap: () {
                          controller.signUp();
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
