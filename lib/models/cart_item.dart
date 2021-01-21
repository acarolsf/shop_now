import 'package:flutter/material.dart';

class CartItem {
  final int id;
  final String title;
  final int quantity;
  final double price;
  final String image;

  CartItem({
    this.id,
    @required this.title,
    @required this.quantity,
    @required this.price,
    @required this.image,
  });
}

List<CartItem> cartItems = [
  CartItem(
    id: 1,
    title: "Office Code",
    price: 134,
    quantity: 2,
    image: "assets/images/bag_1.png",
  ),
  CartItem(
    id: 2,
    title: "Belt Bag",
    price: 244,
    quantity: 2,
    image: "assets/images/bag_2.png",
  ),
  CartItem(
    id: 3,
    title: "Hang Top",
    price: 154,
    quantity: 2,
    image: "assets/images/bag_3.png",
  ),
  CartItem(
    id: 4,
    title: "Old Fashion",
    price: 164,
    quantity: 2,
    image: "assets/images/bag_4.png",
  )
];

double get totalAmount {
  var total = 0.0;
  cartItems.forEach((cartItem) {
    total += cartItem.price * cartItem.quantity;
  });
  return total;
}
