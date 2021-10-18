import 'package:flutter/foundation.dart';

class CartItem {
  final String id;
  final String title;
  final double price;
  final int quantity;

  CartItem(
      {required this.id,
      required this.title,
      required this.price,
      required this.quantity});
}

class Cart with ChangeNotifier {
  // ignore: prefer_final_fields
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  double get totaAmount {
    var total = 0.0;

    _items.forEach((key, cartItem) {
      total += cartItem.quantity * cartItem.price;
    });

    return total;
  }

  void addItems(String productid, String title, double price, int quantity) {
    if (_items.containsKey(productid)) {
      _items.update(
          productid,
          (existingCartItem) => CartItem(
              id: existingCartItem.id,
              title: existingCartItem.title,
              price: existingCartItem.price,
              quantity: quantity));
    } else {
      print(productid);
      _items.putIfAbsent(
        productid,
        () => CartItem(
            id: DateTime.now().toString(),
            title: title,
            price: price,
            quantity: quantity),
      );
    }

    notifyListeners();
    _items.forEach((key, value) {
      print(value.title);
    });
  }
}
