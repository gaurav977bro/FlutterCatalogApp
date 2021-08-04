import "package:flutter/material.dart";
import 'package:myapp/models/catalog.dart';

class ProductDetails extends StatelessWidget {
  final Products catalog;

  const ProductDetails({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        SizedBox(height: 50),
        Image.network(catalog.image),
        SizedBox(height: 30),
        FloatingActionButton(
            onPressed: () {}, child: Icon(Icons.add, color: Colors.white))
      ],
    ));
  }
}
