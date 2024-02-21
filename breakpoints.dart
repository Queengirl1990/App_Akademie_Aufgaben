import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GridView mit Breakpoints'),
      ),
      body: MyGridView(),
    );
  }
}

class MyGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int columnsCount = 2;

    // Bildschirmbreite und Anzahl Spalten
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth >= 600 && screenWidth < 900) {
      columnsCount = 3;
    } else if (screenWidth >= 900) {
      columnsCount = 4;
    }

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //Reihen und Spalten
        crossAxisCount: columnsCount,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: 10, // Anzahl der Container
      itemBuilder: (context, index) {
        // farbige Container erstellen
        return Container(
          color: _getRandomColor(),
          height: 100.0,
          width: 100.0,
          child: Center(
            child: Text('Item $index'),
          ),
        );
      },
    );
  }

  List<int> _getShuffledValues() {
    return List<int>.generate(256, (index) => index)..shuffle();
  }

  Color _getRandomColor() {
    final List<int> shuffledValues = _getShuffledValues();
    return Color.fromRGBO(
      0,
      shuffledValues[0],
      shuffledValues[1],
      1.0,
    );
  }
}
