import 'package:flutter/material.dart';
import 'package:sociallyfox/utils/constant.dart';

final ThemeData lightTheme = ThemeData(
  backgroundColor: kColorWhite,
  scaffoldBackgroundColor: kColorWhite,
  dividerColor: kColorGrey,
  dialogBackgroundColor: kColorWhite,
  highlightColor: kColorOrange,
  splashColor: kColorOrange,
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: TextStyle(
      color: kColorBlack,
      fontWeight: FontWeight.w300,
    ),
    border: InputBorder.none,
    focusedBorder: InputBorder.none,
  ),
  iconTheme: IconThemeData(color: kColorBlack),
  unselectedWidgetColor: kColorBlack,
  fontFamily: 'AirbnbCereal',
  textSelectionTheme: TextSelectionThemeData(cursorColor: kColorBlack),
  cardTheme: CardTheme(
    margin: const EdgeInsets.all(10),
    color: kColorWhite,
  ),
  appBarTheme: AppBarTheme(
    elevation: 0,
    color: Colors.transparent,
    iconTheme: IconThemeData(color: kColorBlack),
  ),
  textTheme: TextTheme(
    button: TextStyle(
      fontSize: 23,
      color: kColorWhite,
      fontWeight: FontWeight.w800,
      letterSpacing: 1.65,
    ),
    bodyText1: TextStyle(
      fontSize: 14,
      color: kColorBlack,
    ),
    // !!!!  style above is not always used:
    bodyText2: TextStyle(
      fontSize: 12,
      color: kColorBlack,
    ),
    subtitle2: TextStyle(
      fontSize: 16,
      color: kColorBlack,
    ),
    subtitle1: TextStyle(
      fontSize: 18,
      color: kColorBlack,
    ),
    headline6: TextStyle(
      fontSize: 22,
      color: kColorBlack,
    ),
    headline5: TextStyle(
      fontSize: 24,
      color: kColorBlack,
    ),
    headline4: TextStyle(
      fontSize: 27,
      color: kColorBlack,
    ),
    headline3: TextStyle(
      fontSize: 38,
      color: kColorBlack,
    ),
    headline1: TextStyle(
      fontSize: 43,
      color: kColorBlack,
      fontWeight: FontWeight.normal,
    ),
  ),
);
