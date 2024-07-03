import 'dart:io';

import 'package:adhd/core/utils/app_colors/app_colors.dart';
import 'package:adhd/core/utils/caching_utils/caching_utils.dart';
import 'package:adhd/core/utils/constants/constants.dart';
import 'package:adhd/core/utils/dimensions/dimensions.dart';
import 'package:adhd/core/widgets/app_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(70.height),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 6,
              blurRadius: 6,
              offset: const Offset(0, -8),
            ),
          ],
        ),
        child: AppBar(
          backgroundColor: AppColors.white,
          elevation: 0.0,
          leadingWidth: double.infinity,
          toolbarHeight: 80.height,
          leading: Row(
            children: [
              SizedBox(
                width: 20.width,
              ),
              Container(
                width: 40.width,
                height: 40.height,
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(blurRadius: 2),
                  ],
                  color: Colors.white,
                  border: Border.all(
                    style: BorderStyle.solid,
                    color: AppColors.white,
                    width: 3.0.height,
                  ),
                  borderRadius: BorderRadius.circular(500),
                ),
                child: FutureBuilder<String?>(
                  future: CachingUtils.getProfileImagePath(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const AppLoadingIndicator();
                    } else if (snapshot.hasError ||
                        !snapshot.hasData ||
                        snapshot.data == null) {
                      return CircleAvatar(
                          radius: 50.height,
                          backgroundColor: AppColors.white,
                          backgroundImage:
                              const AssetImage(Constants.defultProfileImage));
                    } else {
                      File imageFile = File(snapshot.data!);
                      return CircleAvatar(
                        radius: 50.width,
                        backgroundImage: FileImage(imageFile),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
          actions: [
            SizedBox(
              width: 4.width,
            ),
            const Icon(
              FontAwesomeIcons.magnifyingGlass,
              size: 25,
            ),
            SizedBox(
              width: 20.width,
            ),
            const Image(image: AssetImage('Assets/Images/bell.png')),
            SizedBox(
              width: 20.width,
            )
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
