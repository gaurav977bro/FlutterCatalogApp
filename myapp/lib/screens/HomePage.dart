import 'package:flutter/material.dart';
import 'package:myapp/models/catalog.dart';

import 'package:myapp/widgets/Drawer.dart';
import 'package:myapp/widgets/Item_widgets.dart';
import 'package:myapp/widgets/Item_widgets.dart';

import "LoginPage.dart";

void main() {
  runApp(Home());
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dummylist = List.generate(12, (index) => CatalogModel().items[0]);

    return Scaffold(
        // APP BAR
        appBar: AppBar(
            title: Text(
          "Catalog App",
        )),
        // HOME PAGE BODY
        body: ListView.builder(
            itemCount: dummylist.length,
            itemBuilder: (context, index) {
              return ItemWidget(items: dummylist[index]);
            }),

        // DRAWER
        drawer: MyDrawer());
  }
}
