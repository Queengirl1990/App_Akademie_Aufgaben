import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: [
          //Anpassung nach Format
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 800, name: TABLET),
          const Breakpoint(start: 801, end: 1920, name: DESKTOP),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
      ),
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

    // Überprüfe die Bildschirmbreite
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth >= 600 && screenWidth < 900) {
      columnsCount = 3;
    } else if (screenWidth >= 900) {
      columnsCount = 4;
    }

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columnsCount,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: 10, // Anzahl der Container
      itemBuilder: (context, index) {
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
    // zufällige ausgabe
    return List<int>.generate(256, (index) => index)..shuffle();
  }

  Color _getRandomColor() {
    //Farben der Container
    final List<int> shuffledValues = _getShuffledValues();
    return Color.fromRGBO(
      0,
      shuffledValues[0],
      shuffledValues[1],
      1.0,
    );
  }
}
