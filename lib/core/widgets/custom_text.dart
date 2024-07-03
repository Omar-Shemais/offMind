import 'package:adhd/core/utils/dimensions/dimensions.dart';
import 'package:flutter/material.dart';
import '../utils/app_colors/app_colors.dart';

class AppText extends StatelessWidget {
  const AppText({
    super.key,
    required this.title,
    this.maxLines,
    this.color = AppColors.black,
    this.fontSize = 14,
    this.fontWeight = FontWeight.normal,
    this.textDecoration = TextDecoration.none,
    this.overflow,
    this.textAlign,
    this.cutoff,
  });

  final String title;
  final int? maxLines;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final TextDecoration textDecoration;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final int? cutoff;

  @override
  Widget build(BuildContext context) {
    String displayTitle = title;
    if (cutoff != null) {
      displayTitle = truncateWithEllipsis(cutoff!, title);
    }
    return Text(
      displayTitle,
      maxLines: maxLines,
      textAlign: textAlign,
      style: TextStyle(
        color: color,
        fontSize: fontSize.height,
        fontWeight: fontWeight,
        fontFamily: 'Amiko',
        decoration: textDecoration,
        overflow: overflow,
      ),
    );
  }
}

String truncateWithEllipsis(int cutoff, String myString) {
  return (myString.length <= cutoff)
      ? myString
      : '${myString.substring(0, cutoff)}...';
}
