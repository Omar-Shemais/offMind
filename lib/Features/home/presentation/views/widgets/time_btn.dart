import 'package:adhd/core/utils/dimensions/dimensions.dart';
import 'package:adhd/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class TimeBtn extends StatelessWidget {
    const TimeBtn({super.key,
     required this.btnText,
      required this.color, 
      required this.onTap});
  final String btnText;
  final Color color;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            height: 45.height,
            width: 130.width,
            decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(35)),
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: AppText(
                    title: btnText,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
