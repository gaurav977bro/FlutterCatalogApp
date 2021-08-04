import "package:flutter/material.dart";
import 'package:myapp/models/catalog.dart';
import 'package:myapp/screens/HomePage.dart';
import 'package:myapp/widgets/BarTheme.dart';

class ItemWidget extends StatelessWidget {
  final Products items;

  const ItemWidget({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        
        
        elevation: 3.0,
        clipBehavior: Clip.antiAlias,
        color: Colors.white,
        child: ListTile(
            contentPadding: EdgeInsets.symmetric(vertical: 50, horizontal: 10),
            leading: Image.network(
              items.image,
              filterQuality: FilterQuality.high,
              
            ),
            title: Text(
              "${items.name}",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 20),
            ),
            subtitle: Text("Black, 4gb / 128gb "),
            trailing: Text("\$${items.price}", style: TextStyle(fontSize: 25)),
            onTap: () {
            
            }));
  }
}
