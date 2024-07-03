import 'package:adhd/core/utils/app_colors/app_colors.dart';
import 'package:adhd/core/utils/dimensions/dimensions.dart';
import 'package:adhd/core/widgets/app_loading_indicator.dart';
import 'package:adhd/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';


class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.title,
    this.onTap,
    this.color = AppColors.darkGray,
    this.isLoading = false,
  });

  final String title;
  final void Function()? onTap;
  final Color color;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const AppLoadingIndicator();
    }
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 48.height,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: color,
        ),
        child: AppText(
          title: title,
          color: AppColors.white,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
