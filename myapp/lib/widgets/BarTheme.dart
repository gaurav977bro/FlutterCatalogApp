import "package:flutter/material.dart";

class MyTheme {
  static Color creamColor = Color(0xfff5f5f5);
  static Color bluish = Color(0xff403b58);

  static ThemeData lightTheme(BuildContext context) => ThemeData(
        primarySwatch: Colors.pink,
        // brightness: Brightness.dark,
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
      );
}
