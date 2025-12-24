import 'package:cached_network_image/cached_network_image.dart';
import 'package:destined_app/screens/edit_screen/edit_screen.dart';
import 'package:destined_app/screens/profile_screen/profile_screen_controller.dart';
import 'package:destined_app/screens/widgets/button_widget.dart';
import 'package:destined_app/screens/widgets/filter_screen_gradient_container.dart';
import 'package:destined_app/screens/widgets/profile_page_row.dart';
import 'package:destined_app/services/local_controller.dart';
import 'package:destined_app/services/user_base_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../services/app_functions.dart';
import '../../utils/app_colors.dart';
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
    final localeController = Get.put(LocalController());
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
                                child: CachedNetworkImage(
                                  imageUrl:
                                      UserBaseController.userData.imageUrl ??
                                      "",
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
                                      child: GestureDetector(
                                        onTap: () {
                                          Get.to(() => EditScreen());
                                        },
                                        child: GradientSecondryContainer(
                                          firstColor: AppColors.lightBlue,
                                          thirdColor: AppColors.darkBlue,
                                          child: Icon(
                                            Icons.edit,
                                            color: AppColors.whiteColor,
                                          ),
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
                                AppFunctions.height(25),
                                Text(
                                  'Pictures',
                                  style: AppTextStyle.whiteMedium.copyWith(
                                    color: AppColors.whiteColor,
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
                                    itemCount:
                                        UserBaseController
                                            .userData
                                            .profileImages!
                                            .length,
                                    itemBuilder: (context, index) {
                                      final image =
                                          UserBaseController
                                              .userData
                                              .profileImages![index];
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
                                        child: CachedNetworkImage(
                                          imageUrl: image,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                AppFunctions.height(30),
                                Text(
                                  AppStrings.interest.tr,
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
                                AppFunctions.height(30),
                                Text(
                                  AppStrings.language.tr,
                                  style: AppTextStyle.whiteMedium,
                                ),
                                AppFunctions.height(20),
                                FilterScreenGradientContainer(
                                  widget: Text(
                                    // controller.selectedLanguage,
                                    localeController.currentLocale ==
                                            Locale('en', 'US')
                                        ? 'English'
                                        : 'Urdu',
                                    style: AppTextStyle.whiteRegular,
                                  ),
                                  icon: Icon(
                                    Icons.change_circle,
                                    color: AppColors.whiteColor,
                                  ),
                                  onTap: () {
                                    localeController.showDialoge();
                                  },
                                ),
                                AppFunctions.height(20),
                                Align(
                                  alignment: Alignment.center,
                                  child: ButtonWidget(
                                    isLoading: controller.isLoading,
                                    buttonText: AppStrings.logOut.tr,
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
