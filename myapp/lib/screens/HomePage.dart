import 'package:flutter/material.dart';

import 'package:myapp/widgets/Drawer.dart';

import "LoginPage.dart";

void main() {
  runApp(Home());
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // APP BAR
        appBar: AppBar(
            title: Text(
          "Catalog App",
        )),
        // HOME PAGE BODY
        body:Container(),

        // DRAWER
        drawer: MyDrawer());
  }
}
