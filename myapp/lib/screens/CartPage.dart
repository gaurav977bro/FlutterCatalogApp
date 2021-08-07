import 'package:flutter/material.dart';
import 'package:myapp/models/catalog.dart';

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Items")),
        body: SafeArea(
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  
                ],
              ),
            ),
          ),
        ));
  }
}

