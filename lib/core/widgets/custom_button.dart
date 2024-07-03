import 'package:adhd/core/utils/dimensions/dimensions.dart';
import 'package:adhd/core/widgets/app_loading_indicator.dart';
import 'package:adhd/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
import '../utils/app_colors/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.btnText,
    this.onTap,
    this.width = 150,
    this.height = 45, this.borderRadius,  this.isLoading=false,
     this.btnColor=AppColors.blue, this.textColor=AppColors.white,
  });
  final String btnText;
  final void Function()? onTap;

  final double width;
  final double height;
  final BorderRadiusGeometry? borderRadius;
  final bool isLoading;
  final Color? btnColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
     if (isLoading) {
      return const AppLoadingIndicator();
    }
    return Center(
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: height.height,
          width: width.width,
          decoration: BoxDecoration(
              color: btnColor,
              border: Border.all(color: AppColors.blue),              
               borderRadius: BorderRadius.circular(35)),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child: AppText(
                title: btnText,
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: textColor!,
              )),
            ],
          ),
        ),
      ),
    );
  }
}
