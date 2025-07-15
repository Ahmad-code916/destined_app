import 'package:destined_app/screens/widgets/primary_gradient.dart';
import 'package:destined_app/screens/widgets/users_details_head_row.dart';
import 'package:destined_app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class UserDetailsScreen extends StatelessWidget {
  const UserDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PrimaryGradient(
        firstColor: AppColors.gradientSecondryFirst,
        secondColor: AppColors.gradientSecondrySec,
        child: Column(
          children: [
            UsersDetailsHeadRow(
              firstColor: AppColors.pinkColorSec,
              secondColor: AppColors.purpleColorSec,
            ),
          ],
        ),
      ),
    );
  }
}
