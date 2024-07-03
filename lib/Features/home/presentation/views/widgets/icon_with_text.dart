import 'package:flutter/material.dart';
import 'package:adhd/core/utils/app_colors/app_colors.dart';
import 'package:adhd/core/utils/dimensions/dimensions.dart';
import 'package:adhd/core/widgets/custom_text.dart';

class IconText extends StatelessWidget {
  const IconText({
    Key? key,
    required this.text,
    required this.icon,
  }) : super(key: key);
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         Icon(
          icon,
          size: 28,
          color: AppColors.blue,
        ),
        SizedBox(
          width: 10.width,
        ),
         Flexible(
          child: AppText(
            title: text,
            fontSize: 14,
            color: AppColors.darkGray,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }
}
