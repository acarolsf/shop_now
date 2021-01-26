import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/constants/routes.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          userHeader(context),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Início'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(Routes.HOME_SCREEN);
            },
          ),
          ListTile(
            leading: Icon(Icons.add),
            title: Text('Adicionar produtos'),
            onTap: () {
              Navigator.of(context).pushNamed(Routes.EDIT_PRODUCT);
            },
          ),
          ListTile(
            leading: SvgPicture.asset(
              "assets/icons/cart.svg",
              // By default our  icon color is white
              color: Colors.black54,
            ),
            title: Text('Carrinho'),
            onTap: () {
              Navigator.of(context).pushNamed(Routes.CART_SCREEN);
            },
          ),
        ],
      ),
    );
  }

  Widget userHeader(BuildContext context) {
    return UserAccountsDrawerHeader(
      accountName: Text('Ana Carolina'),
      accountEmail: Text('carol@gmail.com'),
      currentAccountPicture: CircleAvatar(
        backgroundColor: Colors.white,
        backgroundImage: ExactAssetImage('assets/images/logo.png'),
      ),
      // otherAccountsPictures: <Widget>[
      //   CircleAvatar(
      //     child: Text('A'),
      //     backgroundColor: Colors.white60,
      //   ),
      //   CircleAvatar(
      //     child: Text('R'),
      //   ),
      // ],
      onDetailsPressed: () {},
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(0, 0, 0, 1).withOpacity(0.5),
            Color.fromRGBO(255, 255, 255, 1).withOpacity(0.7),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0, 1],
        ),
      ),
    );
  }
}
