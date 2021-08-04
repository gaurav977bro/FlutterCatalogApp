import "dart:convert";

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:myapp/models/catalog.dart';
import 'package:myapp/screens/Products_details.dart';
import 'package:myapp/widgets/BarTheme.dart';
import 'package:myapp/widgets/Drawer.dart';
import 'package:myapp/widgets/Item_widgets.dart';

void main() {
  runApp(Home());
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

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
    // await Future.delayed(Duration(seconds: 2));

    final catalogJson =
        await rootBundle.loadString("assets/products/catalog.json");

    final decodedData = jsonDecode(catalogJson);

    var productData = decodedData["products"];

    CatalogModel.items = List.from(productData)
        .map<Products>((products) => Products.fromMap(products))
        .toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      appBar: AppBar(
        shape: RoundedRectangleBorder(),
        title: Text("Catalog App", style: TextStyle(fontSize: 30)),
      ),
      body: SafeArea(
          child: Container(
        color: MyTheme.creamColor,
        padding: EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Header(),
          Expanded(
            child: CatalogModel.items.isNotEmpty
                ? CatalogList()
                : Center(child: CircularProgressIndicator()),
          ),
        ]),
      )),
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
        Text("Trendings",
            style: TextStyle(
                color: MyTheme.bluish,
                fontSize: 20,
                fontWeight: FontWeight.bold))
      ],
    );
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) {

        final catalogs = CatalogModel.items[index];
        
        return InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProductDetails(catalog: catalogs)));
          },
          child: CatalogWidget(
            catalog: catalogs,
          ),
        );
      },
      itemCount: CatalogModel.items.length,
    );
  }
}

class CatalogWidget extends StatelessWidget {
  final Products catalog;

  const CatalogWidget({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20, left: 5, right: 5),
      child: Container(
          color: Colors.white,
          padding: EdgeInsets.all(10),
          height: 190,
          child: Row(
            children: [
              Container(
                  height: 150,
                  width: 120,
                  color: MyTheme.creamColor,
                  child: Image.network(catalog.image)),
              SizedBox(
                width: 20,
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                SizedBox(height: 20),
                Text(catalog.name,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                SizedBox(height: 10),
                Text(catalog.desc),
                SizedBox(height: 20),
                ButtonBar(children: [
                  Text("\$${catalog.price}",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  SizedBox(width: 70),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(50, 35),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(49))),
                      child: Text("Buy"),
                      onPressed: () {}),
                ])
              ])
            ],
          )),
    );
  }
}
