import 'package:flutter/material.dart';
import 'package:shop_app/models/cart_item.dart';
import 'package:shop_app/screens/cart/components/cart_item.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        cardTotal(context),
        ListView.builder(
          shrinkWrap: true,
          itemBuilder: (ctx, i) {
            return CartItemCard(item: cartItems[i]);
          },
          itemCount: cartItems.length,
        ),
        checkoutButton(context),
      ],
    );
  }
}

Widget cardTotal(BuildContext context) {
  return Card(
    margin: EdgeInsets.all(16),
    child: Padding(
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text(
              'Total',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Spacer(),
          Chip(
            label: Text(
              'R\$${totalAmount.toStringAsFixed(2)}',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            backgroundColor: Theme.of(context).primaryColor,
          ),
        ],
      ),
    ),
  );
}

Widget checkoutButton(BuildContext context) {
  return Container(
    padding: EdgeInsets.all(20),
    child: RaisedButton(
      child: Text('CHECKOUT'),
      onPressed: () {},
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      padding: EdgeInsets.symmetric(vertical: 15),
      color: Theme.of(context).primaryColor,
      textColor: Theme.of(context).primaryTextTheme.button.color,
    ),
  );
}
