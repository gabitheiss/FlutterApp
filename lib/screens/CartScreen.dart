import 'package:drawer_app/widgets/DrawerWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('Carrinho'),
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      drawer: DrawerWidget(),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.shopping_cart_rounded, color: Colors.teal, size: 30),
            SizedBox(height: 20),
            Text(
              'Carrinho vazio!',
              style: TextStyle(fontSize: 18, color: Colors.teal),
            ),
          ],
        )
      ),
    );
  }
}