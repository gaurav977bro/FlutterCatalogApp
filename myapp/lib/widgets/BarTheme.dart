import "package:flutter/material.dart";

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.deepPurple,
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: Colors.white),
        
        elevation: 5.0,
        
      ),
      );
}
