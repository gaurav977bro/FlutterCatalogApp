import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:myapp/models/catalog.dart';
import 'package:myapp/widgets/BarTheme.dart';
import 'dart:convert';

import 'package:myapp/widgets/Drawer.dart';

import 'CartPage.dart';
import 'ProductScreen.dart';

void main() {
  runApp(Home());
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    final data = await rootBundle.loadString("assets/products/catalog.json");
    final decodedData = jsonDecode(data);
    var productData = decodedData["products"];

    CatalogModel.items = List.from(productData)
        .map<Products>((products) => Products.fromMap(products))
        .toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => Cart())),
          child: Icon(CupertinoIcons.cart, color: Colors.white)),
      backgroundColor: MyTheme.creamColor,
      appBar: AppBar(title: Text("My Store")),
      body: SafeArea(
          child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Header(),
                    SizedBox(height: 10),
                    Expanded(
                        child: CatalogModel.items.isNotEmpty
                            ? CatalogList()
                            : Center(child: CircularProgressIndicator()))
                  ]))),
      drawer: MyDrawer(),
    );
  }
}

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: 15),
          child: Text("Popular products",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.normal,
                color: MyTheme.bluish,
              )),
        )
      ],
    );
  }
}

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context, index) {
          final catalogs = CatalogModel.items[index];

          return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Preview(contents: catalogs)));
              },
              child: CatalogWidget(catalog: catalogs));
        },
        itemCount: CatalogModel.items.length);
  }
}

class CatalogWidget extends StatelessWidget {
  final Products catalog;

  const CatalogWidget({Key? key, required this.catalog}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyTheme.creamColor,
      padding: EdgeInsets.all(10),
      height: 250,
      child: Container(
          padding: EdgeInsets.only(left: 10),
          color: Colors.white,
          child: Row(
            children: [
              Container(
                width: 150,
                height: 140,
                child: Container(
                  padding: EdgeInsets.all(10),
                  color: MyTheme.creamColor,
                  child: Hero(
                    tag: Key(catalog.name),
                    child: Image.network(
                      catalog.image,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 45,
                  ),
                  Container(
                      width: 150,
                      child: Text(catalog.name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20))),
                  SizedBox(height: 5),
                  Text(catalog.desc, style: TextStyle(fontSize: 15)),
                  SizedBox(height: 20),
                  ButtonBar(
                    children: [
                      Text("\$${catalog.price}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                      SizedBox(width: 30),
                      ElevatedButton(onPressed: () {}, child: Text("Buy"))
                    ],
                  )
                ],
              )
            ],
          )),
    );
  }
}
