import 'package:flutter/material.dart';

void main() {
  runApp(home());
}

class home extends StatelessWidget {
  const home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog app", style: TextStyle(color: Colors.lightGreen)),
      ),
      body: Text("help"),
      drawer: Drawer(),
    );
  }
}
