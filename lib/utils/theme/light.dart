import 'package:flutter/material.dart';
import 'package:sociallyfox/utils/constant.dart';

TextTheme buildTextTheme(TextTheme base, Color color) {
  return base
      .copyWith(
        headline1: base.headline1!.copyWith(),
      )
      .apply(
        bodyColor: color,
        displayColor: color,
        fontFamily: "AirbnbCereal",
      );
}

ThemeData buildLigtTheme() {
  final base = ThemeData.light();
  return base.copyWith(
    primaryColor: kColorOrange,
    primaryTextTheme: buildTextTheme(base.primaryTextTheme, kColorBlack),
    primaryIconTheme: base.iconTheme.copyWith(color: kColorBlack),
  );
}
