import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/widgets/BarTheme.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:MyTheme.creamColor,
        appBar: AppBar(),
        body: SafeArea(
            child: Column(
          children: [
            Expanded(child: CartList()),
            Divider(
              thickness: 3,
            ),
            CartTotal(),
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
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Card(
            margin:EdgeInsets.only(left:10,right:10,bottom:10),
              child: ListTile(
                contentPadding: EdgeInsets.all(30),
                  leading: Icon(
                    Icons.check,
                    color: Colors.green,
                  ),
                  title: Text("item"),
                  trailing: ElevatedButton(
                      child: Icon(CupertinoIcons.delete), onPressed: () {})));
        });
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
    return Card(
      shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(50)),
        elevation: 3,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceAround,
          children: [
            Text("\$10,000",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            SizedBox(width: 100),
            ElevatedButton(child: Text("Buy"), onPressed: () {})
          ],
        ));
  }
}
