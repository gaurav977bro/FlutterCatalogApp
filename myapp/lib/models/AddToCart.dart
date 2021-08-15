import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'CartModel.dart';
import 'catalog.dart';


class Add_To_Cart extends StatefulWidget {
  final Products catalog;
  const Add_To_Cart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  Add_To_CartState createState() => Add_To_CartState();
}

class Add_To_CartState extends State<Add_To_Cart> {
  final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    bool isInCart = _cart.items.contains(widget.catalog)? true:false;
    return  FloatingActionButton(
        onPressed: () {
         
          if (!isInCart) {
            isInCart = true;
             final _catalog = CatalogModel();
          
          _cart.catalog = _catalog;
          _cart.add(widget.catalog);
          setState(() {});
          }
         
        },
        child:
            isInCart ? Icon(Icons.check) : Icon(CupertinoIcons.cart_badge_plus));
  }
}