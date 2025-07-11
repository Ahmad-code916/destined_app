import 'package:destined_app/screens/home_screen/home_screen_controller.dart';
import 'package:destined_app/screens/home_swipe_screen/home_swipre_screen.dart';
import 'package:destined_app/screens/message_screen/message_screen.dart';
import 'package:destined_app/screens/profile_screen/profile_screen.dart';
import 'package:destined_app/screens/users_screen/users_screen.dart';
import 'package:destined_app/utils/app_colors.dart';
import 'package:destined_app/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeScreenController controller = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenController>(
      builder: (context) {
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: AppColors.whiteColor,
            unselectedItemColor: AppColors.blackColor,
            currentIndex: controller.selectedIndex,
            onTap: controller.changeIndex,
            items: [
              BottomNavigationBarItem(
                icon:
                    controller.selectedIndex == 0
                        ? Image.asset(AppImages.swipeSelectedIcon, height: 28)
                        : Image.asset(
                          AppImages.swipeImage,
                          height: 28,
                          fit: BoxFit.cover,
                        ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon:
                    controller.selectedIndex == 1
                        ? Image.asset(AppImages.usersSelectedIcon, height: 28)
                        : Image.asset(AppImages.usersIcon, height: 28),
                label: '',
              ),
              BottomNavigationBarItem(
                icon:
                    controller.selectedIndex == 2
                        ? Image.asset(AppImages.chatsSelectedIcon, height: 28)
                        : Image.asset(AppImages.chatsIcon, height: 28),
                label: '',
              ),
              BottomNavigationBarItem(
                icon:
                    controller.selectedIndex == 3
                        ? Image.asset(AppImages.profileSelectedIcon, height: 28)
                        : Image.asset(AppImages.profileIcon, height: 28),
                label: '',
              ),
            ],
            backgroundColor: Color(0xff140133),
            showUnselectedLabels: true,
            unselectedLabelStyle: TextStyle(color: AppColors.blackColor),
            type: BottomNavigationBarType.fixed,
          ),
          body: IndexedStack(
            index: controller.selectedIndex,
            children: [
              HomeSwipreScreen(),
              UsersScreen(),
              MessageScreen(),
              ProfileScreen(),
            ],
          ),
        );
      },
    );
  }
}
