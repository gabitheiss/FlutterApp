import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'HomeScreen.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('Favoritos'),
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Center(
        child: appState.favorites.isEmpty
            ? const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.favorite, color: Colors.teal, size: 30),
            SizedBox(height: 20),
            Text(
              'Você ainda não tem palavras favoritadas!',
              style: TextStyle(fontSize: 18, color: Colors.teal),
            ),
          ],
        )
            : ListView(
          children: [
            const Padding(
              padding: EdgeInsets.all(10),
            ),
            for (var pair in appState.favorites)
              ListTile(
                leading: const Icon(Icons.favorite, color: Colors.teal),
                title: Text(
                  pair.asPascalCase,
                  style: const TextStyle(color: Colors.teal),
                ),
                trailing: GestureDetector(
                  onTap: () {
                    appState.removeFavorite(pair);
                  },
                  child: const Icon(Icons.delete, color: Colors.red),
                ),
              ),
          ],
        ),
      ),
    );
  }
}