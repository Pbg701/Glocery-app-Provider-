import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  // list of items on sale
  final List _shopItems = const [
    // [ itemName, itemPrice, imagePath, color ]
    ["Avocado", "4.00", "assets/images/avocado1.png", Colors.red],
    ["Banana", "2.50", "assets/images/banana.jpeg", Colors.red],
    ["Chicken", "12.80", "assets/images/chicken1.png", Colors.red],
    ["Water", "1.00", "assets/images/waterBottol.jpeg", Colors.red],
    ["Balaji Chips", "10.00", "assets/images/balaji chips.jpeg", Colors.red],
    ["Banana", "20.50", "assets/images/icecream.jpeg", Colors.red],
    ["Chicken", "10.80", "assets/images/buiscuit.jpeg", Colors.red],
    ["Pizza", "1.00", "assets/images/pizza.jpeg", Colors.red],
  ];

  // list of cart items
  List _cartItems = [];

  get cartItems => _cartItems;

  get shopItems => _shopItems;

  // add item to cart
  void addItemToCart(int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  // remove item from cart
  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  // calculate total price
  String calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i < cartItems.length; i++) {
      totalPrice += double.parse(cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }
}
