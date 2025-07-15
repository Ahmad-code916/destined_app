import 'package:destined_app/screens/user_details_screen/user_details_screen.dart';
import 'package:destined_app/screens/users_screen/users_screen_controller.dart';
import 'package:destined_app/screens/widgets/head_row_widget.dart';
import 'package:destined_app/screens/widgets/primary_gradient.dart';
import 'package:destined_app/screens/widgets/user_data_container.dart';
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
              image: AppImages.profileIcon,
              name: 'Name',
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
                          ? Image.asset(AppImages.onlineTextImage, height: 13)
                          : Text(
                            'Online',
                            style: AppTextStyle.lightPurpleSecMedium,
                          ),
                ),
                Tab(
                  child:
                      controller.selectedIndex == 2
                          ? Image.asset(AppImages.newDaterTextImage, height: 14)
                          : Text(
                            'New Daters',
                            style: AppTextStyle.lightPurpleSecMedium,
                          ),
                ),
                Tab(
                  child:
                      controller.selectedIndex == 3
                          ? Image.asset(AppImages.likedYouTextImage, height: 14)
                          : Text(
                            'Liked you',
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
                            itemCount: 10,
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
                              return UserDataContainer(
                                onTapContainer:
                                    () => Get.to(() => UserDetailsScreen()),
                                isShownGreen:
                                    index == 0 || index == 2 || index == 5
                                        ? true
                                        : false,
                                image: AppImages.profileImage,
                                age: '28',
                                name: 'Belle Benson',
                                distance: 2.5,
                                count: 30,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('HY', style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('HY', style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('HY', style: TextStyle(color: Colors.white)),
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
