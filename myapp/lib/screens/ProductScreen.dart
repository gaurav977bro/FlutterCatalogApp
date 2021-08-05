import 'package:flutter/material.dart';
import 'package:myapp/models/catalog.dart';

class Preview extends StatelessWidget {
  final Products contents;

  const Preview({Key? key,required this.contents}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(),
      body:SafeArea(child: Container(child: 
      Column(children: [
        Image.network(contents.image),
      ],)
      ,),));
  }
}
