import 'dart:async';

import 'package:adhd/Features/intro/presentaion/views/intro_view.dart';
import 'package:adhd/core/utils/app_colors/app_colors.dart';
import 'package:adhd/core/utils/route_utils/route_utils.dart';
// import 'package:adhd/core/utils/dimensions/app_router.dart';
// import 'package:adhd/core/utils/dimensions/app_router.dart';
import 'package:adhd/core/utils/dimensions/dimensions.dart';
import 'package:adhd/main_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:adhd/main_page.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:go_router/go_router.dart';
// import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  @override
  // void initState() {

  //   super.initState();
  //   SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  //   Future.delayed(const Duration(seconds: 2), () {

  //     RouteUtils.pushReplacement(const IntroView());
  //   });aaa
  // }
  @override
  void initState() {
    Timer(const Duration(seconds: 6), () {
      final currentUser = FirebaseAuth.instance.currentUser;
      RouteUtils.pushAndPopAll(
          currentUser == null ? const IntroView() : const MainPaage()
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body:  
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              
                Image(
                  image: const AssetImage('Assets/Images/logo2.gif'),
                  width: 700.width,
                  height: 700.height,
                ),
                SizedBox(
                  height: 20.height,
                ),
             
              ],
            ),
      
    );
  }
}
