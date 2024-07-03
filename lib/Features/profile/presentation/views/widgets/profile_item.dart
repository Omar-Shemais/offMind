import 'package:adhd/core/utils/app_colors/app_colors.dart';
import 'package:adhd/core/utils/dimensions/dimensions.dart';
import 'package:adhd/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({super.key, required this.title, required this.icon});
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.width, vertical: 2.height),
      child: Row(
        children: [
          Icon(
            icon,
            color: AppColors.blue,
          ),
          SizedBox(
            width: 8.width,
          ),
          AppText(
            title: title,
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: AppColors.boldGray,
          )
        ],
      ),
    );
  }
}
