import "package:flutter/material.dart";

import 'HomePage.dart';

void main() {
  runApp(login());
}

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  String _name = "";
  bool tapped = false;
  final _formKey = GlobalKey<FormState>();

  moveNext(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Processing"),
        backgroundColor: Colors.green,
      ));
      setState(() {
        tapped = true;
      });

      await Future.delayed(Duration(seconds: 1));
      await Navigator.push(
          context, MaterialPageRoute(builder: (context) => Home()));
      setState(() {
        tapped = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: SingleChildScrollView(
            child: Form(
      key: _formKey,
      child: Column(children: [
        Image.asset("assets/images/landing.png"),
        SizedBox(height: 30),
        Text("Welcome $_name",
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please fill";
                    }
                    return null;
                  },
                  cursorColor: Colors.pink,
                  cursorHeight: 25.0,
                  onChanged: (value) async {
                    setState(() {
                      _name = value;
                    });
                  }),
              TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password cannot be empty";
                    }

                    if (value.length < 5) {
                      return "Password must have 5 characters";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: "password", labelText: "Password"),
                  cursorColor: Colors.pink,
                  cursorHeight: 25.0,
                  obscureText: true)
            ])),
        SizedBox(height: 30),

        InkWell(
            child: AnimatedContainer(
              child: Center(
                  child: tapped
                      ? Icon(Icons.done, color: Colors.white)
                      : Text("Login",
                          style: TextStyle(color: Colors.white, fontSize: 20))),
              duration: Duration(seconds: 1),
              width: tapped ? 50 : 145,
              height: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.purple,
              ),
            ),
            onTap: () => moveNext(context)),

        // ElevatedButton(
        //   child: Text("login", style: TextStyle(fontSize: 20)),
        //   onPressed: () {

        //       Navigator.push(
        //           context, MaterialPageRoute(builder: (context) => home()));

        //   },
        //   style: ElevatedButton.styleFrom(
        //       minimumSize: Size(150, 50), shadowColor: Colors.pink),
        // ),
       
        
      ]),
    )));
  }
}
