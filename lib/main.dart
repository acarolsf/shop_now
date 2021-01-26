import 'package:flutter/material.dart';
import 'package:shop_app/constants/routes.dart';
import 'package:shop_app/screens/auth/auth_screen.dart';
import 'package:shop_app/screens/cart/cart.dart';
import 'package:shop_app/screens/editProduct/editProduct.dart';
import 'package:shop_app/screens/home/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shop',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(255, 77, 154, 1),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AuthScreen(),
      routes: {
        Routes.HOME_SCREEN: (_) => HomeScreen(),
        Routes.EDIT_PRODUCT: (_) => EditProduct(),
        Routes.CART_SCREEN: (_) => CartScreen(),
      },
    );
  }
}
