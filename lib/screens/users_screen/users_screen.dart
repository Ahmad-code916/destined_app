import 'package:destined_app/screens/user_details_screen/user_details_screen.dart';
import 'package:destined_app/screens/users_screen/users_screen_controller.dart';
import 'package:destined_app/screens/widgets/head_row_widget.dart';
import 'package:destined_app/screens/widgets/primary_gradient.dart';
import 'package:destined_app/screens/widgets/user_data_container.dart';
import 'package:destined_app/services/app_functions.dart';
import 'package:destined_app/services/user_base_controller.dart';
import 'package:destined_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/app_images.dart';
import '../../utils/app_text_style.dart';
import '../filter_screen/filter_screen.dart';

class UsersScreen extends StatelessWidget {
  UsersScreen({super.key});

  final UsersScreenController controller = Get.put(UsersScreenController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UsersScreenController>(
      builder: (context) {
        return Scaffold(
          backgroundColor: AppColors.gradientSecondrySec,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: HeadRowWidget(
              image: UserBaseController.userData.imageUrl ?? "",
              name: UserBaseController.userData.name ?? "",
              onTapFilter: () => Get.to(() => FilterScreen()),
              onTapnotification: () {},
            ),
            backgroundColor: AppColors.gradientSecondryFirst,
            bottom: TabBar(
              indicatorColor: AppColors.whiteColor,
              controller: controller.tabController,
              tabs: [
                Tab(
                  child:
                      controller.selectedIndex == 0
                          ? Image.asset(AppImages.allTextImage, height: 13)
                          : Text(
                            'All',
                            style: AppTextStyle.lightPurpleSecMedium,
                          ),
                ),
                Tab(
                  child:
                      controller.selectedIndex == 1
                          ? Image.asset(AppImages.likedYouTextImage, height: 13)
                          : Text(
                            'Liked You',
                            style: AppTextStyle.lightPurpleSecMedium,
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
                                  // count: 30,
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
