import "package:flutter/material.dart";

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.pink,
      brightness: Brightness.dark,
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: Colors.white),
        
        elevation: 5.0,
        
      ),
      );
}
