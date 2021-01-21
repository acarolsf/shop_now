import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/screens/editProduct/components/body.dart';

class EditProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
    );
  }
}

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    elevation: 0,
    title: Text('Cadastrar Produto'),
    leading: IconButton(
      icon: SvgPicture.asset(
        'assets/icons/back.svg',
        color: Colors.white,
      ),
      onPressed: () => Navigator.pop(context),
    ),
    // actions: <Widget>[
    //   IconButton(
    //     icon: SvgPicture.asset("assets/icons/bag_1.svg"),
    //     onPressed: () {},
    //   ),
    //   SizedBox(width: 20 / 2)
    // ],
  );
}
