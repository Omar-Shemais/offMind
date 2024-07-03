import 'package:adhd/core/utils/app_colors/app_colors.dart';
import 'package:flutter/material.dart';


class AppLoadingIndicator extends StatelessWidget {
  const AppLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: AppColors.blue,
        strokeWidth: 1.5,
      ),
    );
  }
}
