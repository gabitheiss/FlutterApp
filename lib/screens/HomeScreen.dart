import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/DrawerWidget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    IconData icon;
    if (appState.favorites.contains(appState.current)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Consumer<MyAppState>(
              builder: (context, myAppState, child) {
                return Container(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    myAppState.current.asPascalCase,
                    style: const TextStyle(fontSize: 24, color: Colors.teal),
                  ),
                );
              },
            ),
            ElevatedButton(
              onPressed: () {
                context.read<MyAppState>().getNext();
              },
              child: const Text('Próxima'),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              label: const Text('Favoritar'),
              icon: Icon(icon),
              onPressed: () {
                appState.toggleFavorite();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();

  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }

  var favorites = <WordPair>[];

  void toggleFavorite() {
    if (favorites.contains(current)) {
      favorites.remove(current);
    } else {
      favorites.add(current);
    }
    notifyListeners();
  }
}
