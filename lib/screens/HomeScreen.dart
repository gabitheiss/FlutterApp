import 'package:flutter/material.dart';
import '../widgets/DrawerWidget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('Home'),
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      drawer: DrawerWidget(),
      body: const Center(
        child: Text('Home'),
      ),
    );
  }
}
