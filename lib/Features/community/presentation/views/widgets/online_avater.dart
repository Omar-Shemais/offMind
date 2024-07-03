import 'package:adhd/core/utils/app_colors/app_colors.dart';
import 'package:adhd/core/utils/constants/constants.dart';
import 'package:flutter/material.dart';

class OnlineAvater extends StatelessWidget {
  const OnlineAvater({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.3),
          spreadRadius: 2,
          blurRadius: 2,
        ),
      ], borderRadius: BorderRadius.circular(50)),
      child: CircleAvatar(
        radius: 38.0,
        backgroundImage: const AssetImage(Constants.defultProfileImage),
        child: Align(
          alignment: Alignment.bottomRight,
          child: CircleAvatar(
            radius: 12.0,
            child: Container(
              width: 15, // Adjust the size of the dot as needed
              height: 15,
              decoration: const BoxDecoration(
                color: AppColors.green, // Color of the dot
                shape: BoxShape.circle, // Shape of the dot
              ),
            ),
          ),
        ),
      ),
    );
  }
}
