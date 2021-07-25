import "package:flutter/material.dart";
import 'package:myapp/widgets/BarTheme.dart';

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
        theme: MyTheme.lightTheme(context),
        debugShowCheckedModeBanner: false,
        initialRoute: "/homePage",
        routes: {
          "/loginPage": (conext) => login(),
          "/homePage": (conext) => Home(),
        });
  }
}
