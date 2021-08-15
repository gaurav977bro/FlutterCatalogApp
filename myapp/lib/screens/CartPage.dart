import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/models/CartModel.dart';
import 'package:myapp/models/catalog.dart';

import 'package:myapp/widgets/BarTheme.dart';

import 'ProductScreen.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CartTotal(),
        backgroundColor: MyTheme.creamColor,
        appBar: AppBar(),
        body: SafeArea(
            child: Column(
          children: [
            Expanded(child: CartList()),
            Divider(
              thickness: 3,
            ),
          ],
        )));
  }
}

class CartList extends StatefulWidget {
  const CartList({Key? key}) : super(key: key);

  @override
  _CartListState createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  static final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    return _cart.items.isEmpty
        ? Center(
            child: Text(
            "Add some items !!",
            style: TextStyle(color: Colors.pink, fontSize: 40),
          ))
        : ListView.builder(
            itemBuilder: (context, index) => Card(
                child: Card(
              shadowColor: Colors.pink,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              elevation: 5,
              child: ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                leading: Container(
                    height: 40,
                    width: 100,
                    child: Image.network(_cart.items[index].image)),
                trailing: TextButton(
                    child: Icon(Icons.remove, color: Colors.pink),
                    onPressed: () {
                      _cart.remove(_cart.items[index]);
                      
                      setState(() {});
                    }),
                title: Text(_cart.items[index].name),
                subtitle: Text("\$${_cart.items[index].price}",
                    style: TextStyle(color: Colors.pink)),
              ),
            )),
            itemCount: _cart.items.length,
          );
  }
}

class CartTotal extends StatefulWidget {
  const CartTotal({Key? key}) : super(key: key);

  @override
  _CartTotalState createState() => _CartTotalState();
}

class _CartTotalState extends State<CartTotal> {
  @override
  Widget build(BuildContext context) {
    final _cart = CartModel();
    return Container(
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, -13), blurRadius: 40, color: Colors.pink)
          ],
          color: Colors.white,
        ),
        child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            child: ButtonBar(
              alignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "\$${_cart.totalPrice}",
                  style: TextStyle(fontSize: 25),
                ),
                SizedBox(
                  width: 35,
                ),
                ElevatedButton(
                    child: Text("Buy"),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content:
                              Text("Sorry purchase is Available for now !!")));
                    })
              ],
            )));
  }
}
