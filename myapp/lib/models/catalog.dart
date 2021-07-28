class CatalogModel {
  final items = [
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
  String name;
  String id;
  String color;
  String image;
  String desc;
  num price;

  Products(
      {required this.name,
      required this.id,
      required this.color,
      required this.image,
      required this.desc,
      required this.price});
}
