import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// erstellen eines ChangeNotifier
class CounterModel extends ChangeNotifier {
  int _counter = 0;

  int get counter => _counter;

  void increment() {
    _counter++;
    notifyListeners();
  }
}

void main() {
  runApp(
    // Verwendung den ChangeNotifierProvider
    ChangeNotifierProvider(
      create: (context) => CounterModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Hello World Provider'),
        ),
        // Verwendung eines Consumer, um auf den ChangeNotifier zuzugreifen
        body: Consumer<CounterModel>(
          builder: (context, counterModel, child) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Counter:',
                  ),
                  Text(
                    '${counterModel.counter}',
                    style: const TextStyle(fontSize: 40),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Verwendung des ChangeNotifier im Consumer für den Zähler
                      counterModel.increment();
                    },
                    child: const Text('Klick mich'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
