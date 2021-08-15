import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'HomePage.dart';

void main() {
  runApp(Login());
}

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.pink,
        child: SafeArea(
          child: SingleChildScrollView(
            child: LoginContents(),
          ),
        ));
  }
}

class LoginContents extends StatelessWidget {
  const LoginContents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        margin: EdgeInsets.symmetric(horizontal: 30, vertical: 60),
        color: Colors.white,
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            height: 600,
            child: Column(children: [
              SizedBox(height: 40),
              Text("Login",
                  style: TextStyle(
                      fontSize: 40,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
              SizedBox(
                height: 100 - 20,
              ),
              // TextField for Email
              TextField(),
            ])));
  }
}

// TextField for Email and Password
class TextField extends StatefulWidget {
  @override
  _TextField1State createState() => _TextField1State();
}

class _TextField1State extends State<TextField> {
  final _key = GlobalKey<FormState>();

  bool _tapped = false;

  int _tapped_count = 0;

  moveNext(BuildContext context) {
    if (_key.currentState!.validate()) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: Column(
        children: [
          TextFormField(
              focusNode: FocusNode(canRequestFocus: true),
              decoration: InputDecoration(
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),),
                  prefixIcon: Icon(Icons.mail, color: Colors.pink),
                  labelText: "Email",
                  hintText: "Enter your email",
                  hintStyle: TextStyle(color: Colors.black),
                  labelStyle: TextStyle(color: Colors.black)),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "This field cannot be empty";
                }
                return null;
              }),
          SizedBox(height: 30),
          TextFormField(
              obscureText: _tapped ? false : true,
              decoration: InputDecoration(
                  counter: GestureDetector(
                      child: Text("Forgot Password?",
                          style: TextStyle(color: Colors.blue)),
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("I dont Know either")));
                      }),
                  filled: true,
                  labelText: "Password",
                  labelStyle: TextStyle(color: Colors.black),
                  hintText: "Enter password",
                  hintStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                     ),
                  prefixIcon: Icon(Icons.lock, color: Colors.pink),
                  suffix: GestureDetector(
                    onTap: () {
                      setState(() {
                        _tapped_count++;

                        if (_tapped_count % 2 == 0) {
                          _tapped = false;
                        }

                        if (_tapped_count % 2 != 0) {
                          _tapped = true;
                        }
                      });
                    },
                    child: _tapped
                        ? Icon(Icons.visibility_off, color: Colors.red)
                        : Icon(Icons.visibility, color: Colors.red),
                  )),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Cannot be empty";
                }

                if (value.length < 5) {
                  return "Atleast 5 characters";
                }

                return null;
              }),
          SizedBox(height: 30),
          ElevatedButton(
              style: ElevatedButton.styleFrom(minimumSize: Size(100, 40)),
              child: Text("Login"),
              onPressed: () => moveNext(context))
        ],
      ),
    );
  }
}
