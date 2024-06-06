import 'package:flutter/material.dart';
import 'package:iris_wheel_assist/Constants/Colors.dart';

class Themes {
  final lightTheme = ThemeData.light().copyWith(
      primaryColor: whiteColor,
      useMaterial3: true,
      scaffoldBackgroundColor: backGroundColorLight,
      brightness: Brightness.light,
      textTheme: const TextTheme(displayLarge: TextStyle(color: blackColor),),
      primaryTextTheme: const TextTheme(displayLarge: TextStyle(color: blackColor)));

  final darkTheme = ThemeData.dark().copyWith(
      primaryColor: const Color(0xff000000),
      useMaterial3: true,
      scaffoldBackgroundColor: backGroundColorDark,
      brightness: Brightness.dark,
      textTheme: const TextTheme(displayLarge: TextStyle(color: whiteColor)),
      primaryTextTheme: const TextTheme(displayLarge: TextStyle(color: whiteColor)));
}
