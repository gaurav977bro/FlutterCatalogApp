import 'package:flutter/foundation.dart';

class CatalogModel {
  static List<Products> items = [
    Products(
      name: "Iphone",
      id: "3343",
      color: "#73D5BC",
      image:
          "https://shop.jtglobal.com/wp-content/uploads/2020/10/iphone-12-red.jpg",
      desc: "Iphone 12 Max Pro",
      price: 1299,
    )
  ];
}

class Products {
  final String name;
  final String id;
  final String color;
  final String image;
  final String desc;
  final num price;

  Products(
      {required this.name,
      required this.id,
      required this.color,
      required this.image,
      required this.desc,
      required this.price});

  factory Products.fromMap(Map<String, dynamic> map) {
    return Products(
      id:map["id"],
      name:map["name"],
      price:map["price"],
      desc: map["desc"],
      color: map["color"],
      image: map["image"],
    );
  }

  toMap() => {
        "id": id,
        "color": color,
        "name": name,
        "price": price,
        "desc": desc,
        "image": image,
      };
}
