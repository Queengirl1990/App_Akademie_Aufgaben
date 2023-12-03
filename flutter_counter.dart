import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _displayText = '';

  void _showName() {
    setState(() {
      _displayText = 'Anja';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.blue,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF24025E),
        ),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text('Push the Name Button'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, //Kinder werden in der Mitte der Hauptachse ausgerichtet.
            children: <Widget>[
              const Text(
                'Press the button to show my name:',
              ),
              const SizedBox(height: 20),
              FloatingActionButton( //Button
                onPressed: _showName,
                tooltip: 'Show Name',
                child: const Icon(Icons.person), //Icon Button
              ),
              const SizedBox(height: 10), //Abstandhalter
              Text(
                _displayText,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold), //Textstil 
              ),
            ],
          ),
        ),
      ),
    );
  }
}
