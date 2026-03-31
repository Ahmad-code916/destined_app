import 'package:destined_app/screens/user_details_screen/user_details_screen.dart';
import 'package:destined_app/screens/users_screen/users_screen_controller.dart';
import 'package:destined_app/screens/widgets/head_row_widget.dart';
import 'package:destined_app/screens/widgets/primary_gradient.dart';
import 'package:destined_app/screens/widgets/user_data_container.dart';
import 'package:destined_app/services/app_functions.dart';
import 'package:destined_app/services/user_base_controller.dart';
import 'package:destined_app/utils/app_colors.dart';
import 'package:destined_app/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/app_text_style.dart';

class UsersScreen extends StatelessWidget {
  UsersScreen({super.key});

  final UsersScreenController controller = Get.put(UsersScreenController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UsersScreenController>(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: HeadRowWidget(
              image: UserBaseController.userData.imageUrl ?? "",
              name: UserBaseController.userData.name ?? "",
            ),
            backgroundColor: AppColors.lightBlue2,
            bottom: TabBar(
              indicatorColor: AppColors.darkBlueColor,
              controller: controller.tabController,
              tabs: [
                Tab(
                  child: Text(
                    AppStrings.all.tr,
                    style: AppTextStyle.lightPurpleSecMedium.copyWith(
                      color:
                          controller.selectedIndex == 0
                              ? AppColors.redColor
                              : AppColors.blueColor,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    AppStrings.likedYou.tr,
                    style: AppTextStyle.lightPurpleSecMedium.copyWith(
                      color:
                          controller.selectedIndex == 1
                              ? AppColors.redColor
                              : AppColors.blueColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: PrimaryGradient(
            firstColor: AppColors.gradientSecondryFirst,
            secondColor: AppColors.gradientSecondrySec,
            child: SafeArea(
              child: TabBarView(
                controller: controller.tabController,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (controller.userList.isEmpty)
                          Center(
                            child: Text(
                              'No user found!',
                              style: AppTextStyle.whiteMedium,
                            ),
                          )
                        else
                          Expanded(
                            child: GridView.builder(
                              itemCount: controller.userList.length,
                              shrinkWrap: true,
                              primary: true,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    mainAxisSpacing: 22,
                                    crossAxisSpacing: 20,
                                    crossAxisCount: 2,
                                    childAspectRatio: 0.9,
                                  ),
                              itemBuilder: (context, index) {
                                final user = controller.userList[index];
                                final distnace = AppFunctions.calculateDistance(
                                  UserBaseController.userData.lat!,
                                  UserBaseController.userData.lng!,
                                  user.lat!,
                                  user.lng!,
                                );
                                return UserDataContainer(
                                  onTapContainer:
                                      () => Get.to(
                                        () => UserDetailsScreen(),
                                        arguments: {'uid': user.uid},
                                      ),
                                  image: user.imageUrl ?? "",
                                  age:
                                      AppFunctions.calculateAge(
                                        user.dateOfBirth!,
                                      ).toString(),
                                  name: user.name ?? "",
                                  distance: double.parse(distnace),
                                );
                              },
                            ),
                          ),
                      ],
                    ),
                  ),
                  if (controller.filteredList.isEmpty)
                    Center(
                      child: Text(
                        'No user found!',
                        style: AppTextStyle.whiteMedium,
                      ),
                    )
                  else
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: GridView.builder(
                              itemCount: controller.filteredList.length,
                              shrinkWrap: true,
                              primary: true,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    mainAxisSpacing: 22,
                                    crossAxisSpacing: 20,
                                    crossAxisCount: 2,
                                    childAspectRatio: 0.9,
                                  ),
                              itemBuilder: (context, index) {
                                final user = controller.filteredList[index];
                                final distance = AppFunctions.calculateDistance(
                                  UserBaseController.userData.lat!,
                                  UserBaseController.userData.lng!,
                                  user.lat!,
                                  user.lng!,
                                );
                                return UserDataContainer(
                                  onTapContainer:
                                      () => Get.to(() => UserDetailsScreen()),
                                  image: user.imageUrl ?? "",
                                  age:
                                      AppFunctions.calculateAge(
                                        user.dateOfBirth!,
                                      ).toString(),
                                  name: user.name ?? "",
                                  distance: double.parse(distance),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
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
