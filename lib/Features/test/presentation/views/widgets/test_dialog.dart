import 'package:adhd/core/utils/app_colors/app_colors.dart';
import 'package:adhd/core/utils/dimensions/dimensions.dart';
import 'package:adhd/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TestDialog extends StatelessWidget {
  const TestDialog({
    super.key,
    this.onCancel,
  });

  static void show(
    BuildContext context, {
    void Function()? onCancel,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: AppColors.darkGray.withOpacity(0.7),
      builder: (context) => TestDialog(
        onCancel: onCancel,
      ),
    );
  }

  final void Function()? onCancel;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.gray,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 40,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            const Icon(
              FontAwesomeIcons.folderOpen,
              color: AppColors.darkGray,
              size: 70,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 14.height),
              child: const InkWell(
                // onTap: ()=>RouteUtils.push(const TestResultView()),
                child: AppText(
                  title: 'Select a file',
                  textDecoration: TextDecoration.underline,
                  fontSize: 16,
                  textAlign: TextAlign.center,
                  color: AppColors.darkGray,
                ),
              ),
            ),
            IconButton(
                onPressed: () {
                  if (onCancel == null) {
                    Navigator.pop(context);
                    return;
                  }
                  onCancel!();
                },
                icon: const Icon(FontAwesomeIcons.doorOpen)),

            // AppButton(
            //   title: "Discard",
            //   color: AppColors.red,
            //   onTap: () {
            //     if (onCancel == null) {
            //       Navigator.pop(context);
            //       return;
            //     }
            //     onCancel!();
            //   },
            // ),
            // SizedBox(width: 32.width),
            // const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
