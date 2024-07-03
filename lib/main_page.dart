import 'dart:developer';
import 'package:adhd/Features/community/presentation/views/chat_view.dart';
import 'package:adhd/Features/games/presentation/views/games_view.dart';
import 'package:adhd/Features/home/presentation/views/home_view.dart';
import 'package:adhd/Features/profile/presentation/views/profile_view.dart';
import 'package:adhd/Features/test/presentation/views/test_view.dart';
import 'package:adhd/core/utils/app_colors/app_colors.dart';
import 'package:adhd/core/utils/dimensions/dimensions.dart';
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainPaage extends StatefulWidget {
  const MainPaage({
    Key? key,
  }) : super(key: key);

  @override
  State<MainPaage> createState() => _MainPaageState();
}

class _MainPaageState extends State<MainPaage> {
  /// Controller to handle PageView and also handles initial page
  final _pageController = PageController(initialPage: 0);

  /// Controller to handle bottom nav bar and also handles initial page
  final _controller = NotchBottomBarController(index: 0);

  int maxCount = 5;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  /// widget list
  final List<Widget> bottomBarPages = [
     HomeView(),
    const TestView(),
    const ChatsView(),
    const GamesView(),
    const ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
            bottomBarPages.length, (index) => bottomBarPages[index]),
      ),
      extendBody: true,
      bottomNavigationBar: (bottomBarPages.length <= maxCount)
          ? AnimatedNotchBottomBar(
              kIconSize: 23,
              kBottomRadius: 10,

              /// Provide NotchBottomBarController
              notchBottomBarController: _controller,
              color: AppColors.white,
              showLabel: true,
              itemLabelStyle: TextStyle(
                color: AppColors.blue,
                fontSize: 10.height,
              ),
              notchColor: AppColors.white,

              /// restart app if you change removeMargins
              removeMargins: false,
              bottomBarWidth: 500,
              durationInMilliSeconds: 300,

              bottomBarItems: const [
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.home_outlined,
                    color: AppColors.blue,
                  ),
                  activeItem: Icon(
                    Icons.home_outlined,
                    color: AppColors.blue,
                  ),
                  itemLabel: 'Home',
                ),
                BottomBarItem(
                  inActiveItem: Icon(
                    FontAwesomeIcons.clipboardCheck,
                    color: AppColors.blue,
                  ),
                  activeItem: Icon(
                    FontAwesomeIcons.clipboardCheck,
                    color: AppColors.blue,
                  ),
                  itemLabel: 'Test',
                ),
                BottomBarItem(
                  inActiveItem: Icon(
                    FontAwesomeIcons.comments,
                    color: AppColors.blue,
                  ),
                  activeItem: Icon(
                    FontAwesomeIcons.comments,
                    color: AppColors.blue,
                  ),
                  itemLabel: 'Community',
                ),
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.sports_esports,
                    color: AppColors.blue,
                  ),
                  activeItem: Icon(
                    Icons.sports_esports,
                    color: AppColors.blue,
                  ),
                  itemLabel: 'Games',
                ),
                BottomBarItem(
                  inActiveItem: Icon(
                    FontAwesomeIcons.user,
                    color: AppColors.blue,
                  ),
                  activeItem: Icon(
                    FontAwesomeIcons.user,
                    color: AppColors.blue,
                  ),
                  itemLabel: 'Profile',
                ),
              ],
              onTap: (index) {
                /// perform action on tab change and to update pages you can update pages without pages
                log('current selected index $index');
                _pageController.jumpToPage(index);
              },
            )
          : null,
    );
  }
}
