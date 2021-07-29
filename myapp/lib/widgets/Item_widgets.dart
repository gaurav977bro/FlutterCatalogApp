import "package:flutter/material.dart";
import 'package:myapp/models/catalog.dart';

class ItemWidget extends StatelessWidget {
  final Products items;

  const ItemWidget({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    

    return Card(
      
      margin:EdgeInsets.symmetric(horizontal:10,vertical: 5),
      elevation: 10.0,
      
      shadowColor:Colors.purple,
      color: Colors.white,
      child: ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          leading: Image.network(items.image),
          title: Text(
            "IPhone 12 max pro",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
          ),
          subtitle: Text("Black, 4gb / 128gb "),
          trailing: Text("\$${items.price}", style: TextStyle(fontSize: 25)),
          onLongPress: () {}),
    );
  }
}
