import 'package:adhd/core/utils/app_colors/app_colors.dart';
import 'package:adhd/core/utils/dimensions/dimensions.dart';
import 'package:flutter/material.dart';


class AppIconButton extends StatelessWidget {
  const AppIconButton({
    super.key,
    required this.icon,
    required this.onTap,
    this.padding = EdgeInsets.zero,
  });

  final IconData icon;
  final void Function() onTap;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: Padding(
        padding: padding,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: onTap,
          child: Container(
            width: 45.width,
            height: 45.height,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: AppColors.blue,
            ),
            child: Icon(
              icon,
              color: AppColors.white,
              size: 18.height,
            ),
          ),
        ),
      ),
    );
  }
}
