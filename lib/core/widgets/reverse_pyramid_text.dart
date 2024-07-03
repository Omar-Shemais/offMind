import 'package:flutter/material.dart';

class ReversePyramidText extends StatelessWidget {
  final String text;

  const ReversePyramidText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> words = text.split(' ');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: words
          .asMap()
          .entries
          .map((entry) {
            int index = entry.key;
            String word = entry.value;
            return Padding(
              padding: EdgeInsets.only(left: index * 5.0),
              child: Text(
                word,
                textAlign: TextAlign.center,
              ),
            );
          })
          .toList()
          .reversed
          .toList(),
    );
  }
}
