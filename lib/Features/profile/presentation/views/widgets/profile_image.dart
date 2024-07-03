import 'package:adhd/core/utils/app_colors/app_colors.dart';
import 'package:adhd/core/utils/dimensions/dimensions.dart';
import 'package:flutter/material.dart';

class ProfileImageContainer extends StatelessWidget {
  const ProfileImageContainer({super.key, required this.image});
  final Widget image;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 60.height,
      child: Container(
        height: 120.height,
        width: 120.width,
        decoration: BoxDecoration(
          border: Border.all(
            style: BorderStyle.solid,
            color: AppColors.white,
            width: 6.0.height,
          ),
          color: AppColors.white,
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: image
      ),
    );
  }
}
