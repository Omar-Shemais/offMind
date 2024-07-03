import 'package:adhd/core/utils/app_colors/app_colors.dart';
import 'package:adhd/core/utils/dimensions/dimensions.dart';
import 'package:adhd/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';


class LogoutButtton extends StatelessWidget {
  const LogoutButtton({
    super.key,
    required this.btnText,
    this.onTap,
    this.width = 150,
    this.height = 45, this.borderRadius,
  });
  final String btnText;
  final void Function()? onTap;

  final double width;
  final double height;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: height.height,
          width: width.width,
          decoration: BoxDecoration(
              color: AppColors.blue, borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child: AppText(
                title: btnText,
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppColors.white,
              )),
            ],
          ),
        ),
      ),
    );
  }
}
