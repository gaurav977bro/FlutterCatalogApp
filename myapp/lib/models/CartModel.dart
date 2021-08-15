import 'package:myapp/models/catalog.dart';

class CartModel {
  static final cartModel = CartModel._internal();
  CartModel._internal();
  factory CartModel() => cartModel;
  // Catalog Field
  late CatalogModel _catalog;

  final List<int> _itemsIds = [];

  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newcatalog) {
    assert(newcatalog != null);
    _catalog = newcatalog;
  }

// Get items in the cart
  List<Products> get items =>
      _itemsIds.map((id) => _catalog.getById(id)).toList();

  // Get total price
  num get totalPrice => items.fold(0, (total, current) => total + current.price);
// add items
  void add(Products item) {
    _itemsIds.add(item.id);
  }

// remoce items
  void remove(Products item) {
    _itemsIds.remove(item.id);
  }
}
