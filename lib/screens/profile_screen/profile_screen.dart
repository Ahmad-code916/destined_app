import 'package:destined_app/screens/profile_screen/profile_screen_controller.dart';
import 'package:destined_app/screens/widgets/button_widget.dart';
import 'package:destined_app/screens/widgets/profile_page_row.dart';
import 'package:destined_app/services/user_base_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../services/app_functions.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';
import '../../utils/app_strings.dart';
import '../../utils/app_text_style.dart';
import '../widgets/gradient_secondry_container.dart';
import '../widgets/primary_gradient.dart';
import '../widgets/users_details_head_row.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final ProfileScreenController controller = Get.put(ProfileScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PrimaryGradient(
        firstColor: AppColors.gradientSecondryFirst,
        secondColor: AppColors.gradientSecondrySec,
        child: GetBuilder<ProfileScreenController>(
          builder: (context) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UsersDetailsHeadRow(
                  firstColor: AppColors.pinkColorSec,
                  secondColor: AppColors.lightPink,
                  child: Image.asset(AppImages.backIcon, height: 20),
                  onTapChild: () => Get.back(),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          height: Get.height * 0.3,
                          width: double.infinity,
                          color: Color(0xff21154D),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Image.network(
                                  UserBaseController.userData.imageUrl ?? "",
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Color(0xff140034),
                                  border: Border.symmetric(
                                    horizontal: BorderSide(
                                      color: AppColors.darkPurple,
                                    ),
                                  ),
                                ),
                                width: Get.width * 0.25,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 15),
                                        child: ProfilePageRow(
                                          icon: Icons.favorite_border_outlined,
                                          text1:
                                              UserBaseController
                                                  .userData
                                                  .likedBy!
                                                  .length
                                                  .toString(),
                                          // text2: 'k',
                                        ),
                                      ),
                                    ),
                                    AppFunctions.height(20),
                                    Divider(
                                      color: AppColors.darkPurple,
                                      height: 1,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 15),
                                        child: ProfilePageRow(
                                          icon: Icons.thumb_up,
                                          text1: '2.7',
                                          // text2: 'k',
                                        ),
                                      ),
                                    ),
                                    AppFunctions.height(20),
                                    Divider(
                                      color: AppColors.darkPurple,
                                      height: 1,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 15),
                                        child: ProfilePageRow(
                                          icon: Icons.message_outlined,
                                          text1: '2.7',
                                          // text2: 'k',
                                        ),
                                      ),
                                    ),
                                    AppFunctions.height(20),
                                    Divider(
                                      color: AppColors.darkPurple,
                                      height: 1,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        bottom: 10,
                                        top: 10,
                                      ),
                                      child: GradientSecondryContainer(
                                        firstColor: AppColors.lightBlue,
                                        thirdColor: AppColors.darkBlue,
                                        child: Icon(
                                          Icons.edit,
                                          color: AppColors.whiteColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SafeArea(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  UserBaseController.userData.name ?? "",
                                  style: AppTextStyle.whiteMedium.copyWith(
                                    fontSize: 32,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.location_on,
                                          color: AppColors.whiteColor,
                                        ),
                                        AppFunctions.width(8),
                                        RichText(
                                          text: TextSpan(
                                            text: '1.5 ',
                                            children: [
                                              TextSpan(text: 'km away'),
                                            ],
                                            style: AppTextStyle.whiteMedium
                                                .copyWith(fontSize: 14),
                                          ),
                                        ),
                                        AppFunctions.width(16),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.favorite_sharp,
                                          color: AppColors.whiteColor,
                                        ),
                                        AppFunctions.width(8),
                                        Text(
                                          UserBaseController
                                              .userData
                                              .likedBy!
                                              .length
                                              .toString(),
                                          style: AppTextStyle.whiteRegular,
                                        ),
                                        AppFunctions.width(16),
                                      ],
                                    ),
                                  ],
                                ),
                                AppFunctions.height(25),
                                SizedBox(
                                  height: 40,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    itemCount: controller.choiceList.length,
                                    itemBuilder: (context, index) {
                                      final data = controller.choiceList[index];
                                      return Padding(
                                        padding: const EdgeInsets.only(
                                          right: 15,
                                        ),
                                        child: GestureDetector(
                                          behavior: HitTestBehavior.opaque,
                                          onTap: () {
                                            controller.selectChoiceListOption(
                                              index,
                                            );
                                          },
                                          child: Column(
                                            spacing: 8,
                                            children: [
                                              Text(
                                                data,
                                                style: AppTextStyle.whiteMedium
                                                    .copyWith(
                                                      color:
                                                          controller.selectedChoice ==
                                                                  data
                                                              ? AppColors
                                                                  .purpleColor
                                                              : AppColors
                                                                  .pinkColor,
                                                    ),
                                              ),
                                              Container(
                                                height: 3,
                                                width: 70,
                                                color:
                                                    controller.selectedChoice ==
                                                            data
                                                        ? AppColors.whiteColor
                                                        : AppColors
                                                            .transparentColor,
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                AppFunctions.height(30),
                                SizedBox(
                                  height: 120,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    physics: BouncingScrollPhysics(),
                                    shrinkWrap: true,
                                    primary: true,
                                    itemCount: 10,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        height: 90,
                                        width: 90,
                                        margin: EdgeInsets.only(right: 20),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            width: 2,
                                            color: AppColors.whiteColor,
                                          ),
                                          borderRadius:
                                              AppFunctions.borderRadius(12),
                                        ),
                                        child: Image.asset(
                                          AppImages.cameraImage,
                                          fit: BoxFit.contain,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                AppFunctions.height(30),
                                Text(
                                  AppStrings.interest,
                                  style: AppTextStyle.whiteMedium,
                                ),
                                AppFunctions.height(16),
                                SizedBox(
                                  height: 50,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount:
                                        UserBaseController
                                            .userData
                                            .interestList!
                                            .length,
                                    itemBuilder: (context, index) {
                                      final interests =
                                          UserBaseController
                                              .userData
                                              .interestList![index];
                                      return Padding(
                                        padding: const EdgeInsets.only(
                                          right: 15,
                                        ),
                                        child: Text(
                                          interests,
                                          style: AppTextStyle.whiteRegular
                                              .copyWith(
                                                color: AppColors.purpleColor,
                                              ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                AppFunctions.height(20),
                                Align(
                                  alignment: Alignment.center,
                                  child: ButtonWidget(
                                    isLoading: controller.isLoading,
                                    buttonText: 'LogOut',
                                    onTap: () {
                                      controller.logOut();
                                    },
                                  ),
                                ),
                                AppFunctions.height(30),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
