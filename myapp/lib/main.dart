import "package:flutter/material.dart";
import "screens/StartPage.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme:
            ThemeData(primarySwatch: Colors.green, brightness: Brightness.dark),
        initialRoute: "/startPage",
        routes: {
          "/startPage": (conext) => start(),
        });
  }
}
