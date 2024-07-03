import 'package:adhd/core/utils/app_colors/app_colors.dart';
import 'package:adhd/core/utils/dimensions/dimensions.dart';
import 'package:adhd/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class SeeMore extends StatelessWidget {
  const SeeMore({super.key, required this.tittle, this.onTap,});
  final String tittle;

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.height),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                title: tittle,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              InkWell(
                onTap: onTap,
                child: AppText(
                  title: 'See more',
                  fontSize: 15.height,
                  color: AppColors.blue,
                ),
              )
            ],
          ),
          const Divider(color: AppColors.darkGray,thickness: 0.2,),
        ],
      ),
    );
  }
}
