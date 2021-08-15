import 'dart:convert';

class CatalogModel {
  static final catModel = CatalogModel._internal();
  CatalogModel._internal();
  factory CatalogModel() => catModel;

  static List<Products> items = [];

  // Get PRODUCTS ID
  Products getById(int id) =>
      items.firstWhere((element) => element.id == id, orElse: null);

  // GET ITEM BY POSITION
  Products getByPosition(int pos) => items[pos];
}

class Products {
  final String name;
  final int id;
  final String color;
  final String image;
  final String desc;
  final num price;

  Products(this.name, this.id, this.color, this.image, this.desc, this.price);

  Products copyWith({
    String? name,
    int? id,
    String? color,
    String? image,
    String? desc,
    num? price,
  }) {
    return Products(
      name ?? this.name,
      id ?? this.id,
      color ?? this.color,
      image ?? this.image,
      desc ?? this.desc,
      price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'id': id,
      'color': color,
      'image': image,
      'desc': desc,
      'price': price,
    };
  }

  factory Products.fromMap(Map<String, dynamic> map) {
    return Products(
      map['name'],
      map['id'],
      map['color'],
      map['image'],
      map['desc'],
      map['price'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Products.fromJson(String source) =>
      Products.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Products(name: $name, id: $id, color: $color, image: $image, desc: $desc, price: $price)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Products &&
        other.name == name &&
        other.id == id &&
        other.color == color &&
        other.image == image &&
        other.desc == desc &&
        other.price == price;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        id.hashCode ^
        color.hashCode ^
        image.hashCode ^
        desc.hashCode ^
        price.hashCode;
  }
}
