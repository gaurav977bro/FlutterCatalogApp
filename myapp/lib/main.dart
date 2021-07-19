import "package:flutter/material.dart";

import "screens/HomePage.dart";
import "screens/LoginPage.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            primarySwatch: Colors.purple, brightness: Brightness.dark),
        debugShowCheckedModeBanner: false,
        initialRoute: "/homePage",
        routes: {
          "/loginPage": (conext) => login(),
          "/homePage": (conext) => home(),
        });
  }
}
