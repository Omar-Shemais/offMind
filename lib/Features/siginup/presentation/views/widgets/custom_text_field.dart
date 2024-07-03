import 'package:adhd/core/utils/app_colors/app_colors.dart';
import 'package:adhd/core/utils/dimensions/dimensions.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.hint,
      this.prefixIcon,
      this.suffixIcon,
      this.onChange,
      this.isObsecure,
      this.onTap,
      this.controller,
      this.textInputAction,
      this.validator});
  final String hint;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Function(String)? onChange;
  final bool? isObsecure;
  final void Function()? onTap;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 35.width, left: 35.width),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: AppColors.white,
              boxShadow: [
                BoxShadow(
                  color: AppColors.darkGray.withOpacity(0.2),
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: TextFormField(
              obscureText: isObsecure ?? false,
              onChanged: onChange,
              onTap: onTap,
              controller: controller,
              validator: validator,
              textInputAction: textInputAction,
              style: const TextStyle(
                  color: AppColors.black, fontWeight: FontWeight.w400),
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                prefixIcon: prefixIcon,
                suffixIcon: suffixIcon,
                hintText: hint,
                focusColor: AppColors.offWhite,
                fillColor: AppColors.offWhite,
                hintStyle: TextStyle(
                    color: AppColors.gray,
                    fontFamily: 'Amiko',
                    fontWeight: FontWeight.w900,
                    fontSize: 16.width),
                contentPadding: EdgeInsets.only(
                    top: 15.height,
                    left: 15.width,
                    bottom: 15.height,
                    right: 15.width),
                border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: AppColors.white,
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(30.width)),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: AppColors.offWhite, width: 3),
                  borderRadius: BorderRadius.circular(50.width),
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: AppColors.offWhite, width: 3),
                    borderRadius: BorderRadius.circular(30.width)),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(30.width),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
