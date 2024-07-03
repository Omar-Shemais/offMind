import 'package:adhd/core/utils/dimensions/dimensions.dart';
import 'package:adhd/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class NoSearchResultVector extends StatelessWidget {
  const NoSearchResultVector({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'Assets/Images/no_search_result.png',
            height: 240.height,
            width: 370.width,
            fit: BoxFit.fill,
          ),
          SizedBox(height: 12.height),
          const AppText(
            title: 'Note not found. Try searching again.',
            fontSize: 16,
            fontWeight: FontWeight.w300,
          ),
        ],
      ),
    );
  }
}
