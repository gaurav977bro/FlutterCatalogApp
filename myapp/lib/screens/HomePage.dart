import 'package:flutter/material.dart';
import 'package:myapp/widgets/Drawer.dart';


import "LoginPage.dart";

void main() {
  runApp(home());
}

class home extends StatelessWidget {
  const home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // APP BAR
        appBar: AppBar(
            centerTitle: true,
            title: Text("Catalog App",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ))),
        // HOME PAGE BODY
        body: Container(
            child: Center(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(minimumSize: Size(150, 50)),
                    child: Text("Exit"),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => login()));
                    }))),

        // DRAWER
        drawer: MyDrawer());
  }
}
