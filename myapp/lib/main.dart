

import "package:flutter/material.dart";
import 'package:myapp/screens/CartPage.dart';
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
        initialRoute: "/loginPage",
        routes: {
          "/loginPage": (conext) => Login(),
          "/homePage": (conext) => Home(),
          "/cartPage":(context)=>Cart(),
        });
  }
}
 