import "package:flutter/material.dart";
import "StartPage.dart";
import 'HomePage.dart';

void main() {
  runApp(login());
}

class login extends StatelessWidget {
  const login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        child: SingleChildScrollView(
            child: Column(children: [
      Image.asset("assets/images/landing.png"),
      SizedBox(height: 30),
      Text("Login to your account..",
          style: TextStyle(
            fontSize: 20,
          )),
      SizedBox(height: 30),
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
          child: Column(children: [
            TextFormField(
                decoration: InputDecoration(
                  hintText: "email/number",
                  labelText: "email",
                ),
                cursorColor: Colors.pink,
                cursorHeight: 25.0),
            TextFormField(
                decoration: InputDecoration(
                    hintText: "password", labelText: "Password"),
                cursorColor: Colors.pink,
                cursorHeight: 25.0,
                obscureText: true)
          ])),
      SizedBox(height: 30),
      ElevatedButton(
        child: Text("login"),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => home()));
        },
        style: ElevatedButton.styleFrom(
            minimumSize: Size(150, 50), shadowColor: Colors.pink),
      ),
      SizedBox(height: 30),
      ElevatedButton(
          child: Text("Back"),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => start()));
          },
          style: ElevatedButton.styleFrom(
              minimumSize: Size(150, 50), shadowColor: Colors.pink))
    ])));
  }
}
