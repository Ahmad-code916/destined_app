import 'package:destined_app/screens/home_screen/home_screen_controller.dart';
import 'package:destined_app/screens/home_swipe_screen/home_swipre_screen.dart';
import 'package:destined_app/screens/message_screen/message_screen.dart';
import 'package:destined_app/screens/profile_screen/profile_screen.dart';
import 'package:destined_app/screens/users_screen/users_screen.dart';
import 'package:destined_app/utils/app_colors.dart';
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
                icon: Icon(
                  Icons.person,
                  color:
                      controller.selectedIndex == 0
                          ? AppColors.whiteColor
                          : AppColors.darkBlackColor,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color:
                      controller.selectedIndex == 1
                          ? AppColors.whiteColor
                          : AppColors.darkBlackColor,
                ),
                label: 'Message',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color:
                      controller.selectedIndex == 2
                          ? AppColors.whiteColor
                          : AppColors.darkBlackColor,
                ),
                label: 'Contacts',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color:
                      controller.selectedIndex == 3
                          ? AppColors.whiteColor
                          : AppColors.darkBlackColor,
                ),
                label: 'Settings',
              ),
            ],
            backgroundColor: AppColors.whiteColor,
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
