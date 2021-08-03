import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:myapp/models/catalog.dart';
import "dart:convert";
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
    await Future.delayed(Duration(seconds: 2));

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
        // APP BAR
        appBar: AppBar(title: Text("Catalog App")),
        // HOME PAGE BODY
        body: CatalogModel.items.isNotEmpty
            ? GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 2,
                ),
                itemCount: CatalogModel.items.length,
                itemBuilder: (context, index) {
                  final values = CatalogModel.items[index];
                  return Card(
                      shadowColor: Colors.red,
                      elevation: 10,
                      clipBehavior: Clip.hardEdge,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      color: Colors.pink,
                      child: GridTile(
                          header: Container(padding:EdgeInsets.all(10) ,height:34 ,child:Text(values.name,style:TextStyle(color:Colors.white)),decoration:BoxDecoration(color:Colors.pink)),
                          footer: Container(
                            color:Colors.pink,
                            padding:EdgeInsets.all(10),
                            child: Text(
                              "\$${values.price}",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          child: Image.network(values.image,
                              filterQuality: FilterQuality.high,
                              fit: BoxFit.fill)));
                })
            : Center(child: CircularProgressIndicator(color: Colors.pink)),
        // DRAWER
        drawer: MyDrawer());
  }
}
