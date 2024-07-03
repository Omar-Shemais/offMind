import 'package:adhd/core/utils/app_colors/app_colors.dart';
import 'package:adhd/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider(
      {super.key, required this.text, this.textColor = AppColors.darkGray});
  final String text;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(children: <Widget>[
        const Expanded(
            child: Divider(
          color: AppColors.darkGray,
          thickness: 2,
        )),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: AppText(
              title: text,
              fontWeight: FontWeight.w900,
              color: textColor,
            )),
        const Expanded(
          child: Divider(
            color: AppColors.darkGray,
            thickness: 2,
          ),
        ),
      ]),
    );
  }
}
