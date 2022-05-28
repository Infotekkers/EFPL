import 'package:flutter/material.dart';

class EfplTheme {
  ThemeData buildLightTheme() => ThemeData(
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

  ThemeData buildDarkTheme() => ThemeData(
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
}
