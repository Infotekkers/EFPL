library config.globals;

import 'package:efpl/presentation/colors.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  // brightness: Brightness.light,
  // Background Colors
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.blue,
  )
      .copyWith(
        secondary: ConstantColors.primary_900,
      )
      .copyWith(
        tertiary: Colors.black,
      ),

  // text styles
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      fontFamily: "Poppins",
    ),
  ),
);

ThemeData darkTheme = ThemeData(
  // brightness: Brightness.dark,
  // Background Colors
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.blue,
  )
      .copyWith(
        secondary: Colors.amber,
      )
      .copyWith(
        tertiary: Colors.black,
      ),

  // text styles
  textTheme: const TextTheme(
    headline1: TextStyle(
      fontSize: 72.0,
      fontWeight: FontWeight.bold,
      color: Colors.pink,
      fontFamily: "Architect",
    ),
  ),
);
