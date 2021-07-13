import 'package:flutter/material.dart';
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
          title:
              Text("Catalog app", style: TextStyle(color: Colors.lightGreen)),
        ),
        // HOME PAGE BODY
        body: Container(
            ),
        
        // DRAWER
        drawer: Drawer(
          child: SingleChildScrollView(
              child: Column(
            children: [
              SizedBox(height: 100),
              TextButton(
                  child: ListTile(
                    leading: Icon(Icons.settings),
                    title: Text("Settings"),
                    subtitle: Text("system settings"),
                  ),
                  onPressed: () {}),
              ElevatedButton(
                  child: Text("EXIT"),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => login()));
                  }),
            ],
          )),
        ));
  }
}
