import 'package:adhd/core/utils/app_colors/app_colors.dart';
import 'package:adhd/core/utils/dimensions/dimensions.dart';
import 'package:adhd/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class GameContainer extends StatelessWidget {
  const GameContainer(
      {super.key,
      required this.gameName,
      required this.gameImg,
      this.gameIcon});
  final String gameName;
  final String gameImg;
  final IconData? gameIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 157.height,
      width: 160.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image:
              DecorationImage(image: AssetImage(gameImg), fit: BoxFit.cover)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            gameIcon,
            color: AppColors.white,
            size: 45,
          ),
          SizedBox(
            height: 10.height,
          ),
          AppText(
            title: gameName,
            textAlign: TextAlign.left,
            color: AppColors.white,
            fontWeight: FontWeight.bold,
          )
        ],
      ),
    );
  }
}
