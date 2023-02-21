import 'package:flutter/material.dart';


class ProductsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Inicio"),
        centerTitle: true,

      ),
      body: Center(
        child: Text('Hola Mundo'),
      ),
    );
  }
}