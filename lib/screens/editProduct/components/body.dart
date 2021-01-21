import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shop_app/constants/routes.dart';

enum ProductMode { Register, Edit }

class Body extends StatefulWidget {
  const Body({
    Key key,
  }) : super(key: key);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  ProductMode _productMode = ProductMode.Register;
  Map<String, String> _productData = {
    'image': '',
    'title': '',
    'price': '',
    'description': '',
    'size': '',
    'color': ''
  };
  var _isLoading = false;

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Oops!'),
        content: Text(message),
        actions: <Widget>[
          FlatButton(
            child: Text('Okay'),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          )
        ],
      ),
    );
  }

  Future<void> _submit() async {
    if (!_formKey.currentState.validate()) {
      // Invalid!
      return;
    }

    _formKey.currentState.save();
    setState(() {
      _isLoading = true;
    });

    try {
      // if (_authMode == AuthMode.Login) {
      //   // Log user in
      //   await Provider.of<Auth>(context, listen: false).login(
      //     _authData['email'],
      //     _authData['password'],
      //   );
      // } else {
      //   // Sign user up
      //   await Provider.of<Auth>(context, listen: false).signup(
      //     _authData['email'],
      //     _authData['password'],
      //   );
      // }
      Navigator.of(context).pushReplacementNamed(Routes.HOME_SCREEN);
    } on HttpException catch (e) {
      var errorMessage = 'Authentication failed: ' + e.toString();

      _showErrorDialog(errorMessage);
    } catch (error) {
      const errorMessage = 'Could not authenticate you. Please try again late.';
      _showErrorDialog(errorMessage);
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // It provide us total height and width
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Nome'),
                keyboardType: TextInputType.text,
                onSaved: (value) {
                  _productData['title'] = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Preço'),
                keyboardType: TextInputType.number,
                onSaved: (value) {
                  _productData['price'] = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Descrição'),
                keyboardType: TextInputType.multiline,
                maxLines: 3,
                onSaved: (value) {
                  _productData['description'] = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Cor'),
                keyboardType: TextInputType.text,
                onSaved: (value) {
                  _productData['color'] = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Imagem'),
                keyboardType: TextInputType.url,
                onSaved: (value) {
                  _productData['imagem'] = value;
                },
              ),
              SizedBox(
                height: 20,
              ),
              if (_isLoading)
                CircularProgressIndicator()
              else
                RaisedButton(
                  child: Text(_productMode == ProductMode.Edit
                      ? 'EDITAR'
                      : 'CADASTRAR'),
                  onPressed: _submit,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
                  color: Theme.of(context).primaryColor,
                  textColor: Theme.of(context).primaryTextTheme.button.color,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
