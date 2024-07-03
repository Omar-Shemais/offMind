import 'package:adhd/core/utils/app_colors/app_colors.dart';
import 'package:adhd/core/utils/dimensions/dimensions.dart';
import 'package:adhd/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AppAppBar({
    super.key,
    this.title,
    this.actions,
    this.enableBackButton = false,
    this.fontSize = 35,
  });

  final String? title;
  final List<Widget>? actions;
  final bool enableBackButton;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      primary: true,
      centerTitle: false,
      backgroundColor: AppColors.white.withOpacity(0),
      leading: enableBackButton
          ? IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                size: 25,
                color: AppColors.darkGray,
              ))
          : const SizedBox.shrink(),
      leadingWidth: enableBackButton ? 20.width + 16 : 0,
      title: AppText(
        title: title ?? "",
        fontWeight: FontWeight.w600,
        fontSize: fontSize,
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
