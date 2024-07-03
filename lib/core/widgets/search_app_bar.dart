import 'package:adhd/core/utils/app_colors/app_colors.dart';
import 'package:adhd/core/utils/route_utils/route_utils.dart';
import 'package:adhd/core/utils/dimensions/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SearchAppBar({super.key, this.onChanged});
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: 15.width),
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new,
              size: 30,
              color: AppColors.darkGray,
            ),
            onPressed: () {
              RouteUtils.pop();
            },
          ),
        ),
        title: TextFormField(
          style: const TextStyle(
              color: AppColors.black, fontWeight: FontWeight.w400),
          keyboardType: TextInputType.emailAddress,
          onChanged: onChanged,
          decoration: InputDecoration(
            filled: true,
            prefixIcon: const Icon(
              FontAwesomeIcons.magnifyingGlass,
              size: 18,
              color: AppColors.darkGray,
            ),
            focusColor: AppColors.black,
            fillColor: AppColors.white,
            hintText: 'search for doctor',
            hintStyle: TextStyle(
                color: AppColors.darkGray,
                fontFamily: 'Amiko',
                fontWeight: FontWeight.w900,
                fontSize: 14.width),
            contentPadding: EdgeInsets.only(
                top: 8.height,
                left: 20.width,
                bottom: 8.height,
                right: 20.width),
            border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.gray,
                  width: 3,
                ),
                borderRadius: BorderRadius.circular(10.width)),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.gray, width: 3),
              borderRadius: BorderRadius.circular(10.width),
            ),
          ),
        ));
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
