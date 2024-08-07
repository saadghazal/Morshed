import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AppTexts {
  static double fontSize18 = 3.75.sp;
  static double fontSize14 = 2.92.sp;
  static double fontSize16 = 3.34.sp;
  static Text titleBold({
    required String text,
    double fontSize = 28,
    Color fontColor = Colors.black,
  }) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        color: fontColor,
      ),
    );
  }

  static Text titleMedium({
    required String text,
    double fontSize = 28,
    Color fontColor = Colors.black,
  }) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w500,
        color: fontColor,
      ),
    );
  }

  static Text bodyMedium({
    required String text,
    double fontSize = 16,
    Color fontColor = Colors.black,
    TextOverflow textOverflow = TextOverflow.visible,
    bool? softWrap,
  }) {
    return Text(
      text,
      overflow: textOverflow,
      softWrap: softWrap,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w500,
        color: fontColor,
      ),
    );
  }

  static Text bodyRegular({
    required String text,
    double fontSize = 16,
    Color fontColor = Colors.black,
  }) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.normal,
        color: fontColor,
      ),
    );
  }
}
