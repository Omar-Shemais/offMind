import 'package:adhd/core/utils/app_colors/app_colors.dart';
import 'package:adhd/core/utils/dimensions/dimensions.dart';
import 'package:adhd/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CirclerIcon extends StatelessWidget {
  const CirclerIcon({
    super.key,
    required this.backgroundColor,
    required this.icon,
    required this.iconColor,
    required this.iconTitle1,
    required this.iconTitle2,
    this.titleColor = AppColors.darkGray,
  });
  final Color backgroundColor;
  final IconData icon;
  final Color iconColor;
  final Color titleColor;
  final String iconTitle1;
  final String iconTitle2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 60.width,
          height: 60.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
          ),
          child: CircleAvatar(
            radius: 25.width,
            backgroundColor: backgroundColor,
            child: Icon(
              icon,
              color: iconColor,
              size: 35,
            ),
          ),
        ),
        SizedBox(
          height: 4.height,
        ),
        AppText(
          title: iconTitle1,
          fontSize: 12,
        ),
        SizedBox(
          height: 4.height,
        ),
        AppText(
          title: iconTitle2,
          color: titleColor,
          fontSize: 12,
        ),
      ],
    );
  }
}
