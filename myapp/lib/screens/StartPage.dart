import 'package:flutter/material.dart';
import "LoginPage.dart";

void main() {
  runApp(start());
}

class start extends StatelessWidget {
  const start({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
          child: Column(children: [
        Image.asset("assets/images/welcome.png"),
        Divider(color: Colors.green, thickness: 5),
        SizedBox(height: 150),
        ElevatedButton(
            child: Text("Click here ......",
                style: TextStyle(color: Colors.white)),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => login()));
            },
            style: ElevatedButton.styleFrom(minimumSize: Size(200.0, 60.0)))
      ])),
    );
  }
}
