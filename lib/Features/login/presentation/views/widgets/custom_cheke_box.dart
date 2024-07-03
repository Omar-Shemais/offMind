import 'package:adhd/core/utils/app_colors/app_colors.dart';
import 'package:adhd/core/utils/dimensions/dimensions.dart';
import 'package:flutter/material.dart';


class CustomChekeBox extends StatefulWidget {
  const CustomChekeBox({super.key});

  @override
  State<CustomChekeBox> createState() => _CustomChekeBoxState();
}

class _CustomChekeBoxState extends State<CustomChekeBox> {
  bool joing = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 12.width),
          child: Checkbox(
              side: WidgetStateBorderSide.resolveWith(
                (states) => const BorderSide(
                  color: AppColors.black,
                ),
              ),
              value: joing,
              activeColor: AppColors.darkGray,
              onChanged: (value) {
                joing = value ?? false;
                setState(() {});
              }),
        ),
        Text(
          'Remember password',
          style: TextStyle(
              color: AppColors.darkGray,
              fontSize: 14.height,
              fontWeight: FontWeight.w600,
              fontFamily: 'Amiko'),
        ),
      ],
    );
  }
}