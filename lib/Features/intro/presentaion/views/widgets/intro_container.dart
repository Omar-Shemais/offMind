import 'package:adhd/core/utils/dimensions/dimensions.dart';
import 'package:adhd/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class IntroContainer extends StatelessWidget {
  const IntroContainer({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  final String image;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: const [FadeEffect(delay: Duration(seconds: 1))],
      child: Column(
        children: [
          SizedBox(
            height: 100.height,
          ),

          // effects: const [FadeEffect(delay: Duration(seconds: 1))],
          Image(
            image: AssetImage(image),
            width: 260.width,
          ),

          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 40.height,
            ),
            child: Column(
              children: [
                AppText(
                  title: title,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(
                  height: 12.height,
                ),
                AppText(
                  title: description,
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
