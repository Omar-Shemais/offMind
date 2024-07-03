import 'package:adhd/core/utils/app_colors/app_colors.dart';
import 'package:adhd/core/utils/dimensions/dimensions.dart';
import 'package:adhd/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class TestButton extends StatelessWidget {
  const TestButton({
    Key? key,
    this.onTap,
    this.width = 150,
    this.height = 60,
    required this.price,
    required this.title,
    required this.icon,
  }) : super(key: key);

  final void Function()? onTap;
  final double width;
  final double height;
  final String price;
  final String title;

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: AppColors.blue,
            borderRadius: BorderRadius.circular(35),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppText(
                    title: price,
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white,
                  ),
                  const CustomDivider(), // Custom divider widget
                  AppText(
                    title: title,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white,
                  ),
                ],
              ),
              SizedBox(
                width: 10.width,
              ),
              Icon(
                icon,
                color: AppColors.white,
                size: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60, // Width of the divider
      height: 1, // Height of the divider
      color: AppColors.white,
      margin:
          const EdgeInsets.symmetric(vertical: 3), // Adjust margin as needed
    );
  }
}
