//zum testen ausgelagert

import 'package:flutter/material.dart';

class S5511 extends StatefulWidget {
  const S5511({Key? key}) : super(key: key);

  @override
  _S5511State createState() => _S5511State();
}

class _S5511State extends State<S5511> {
  int zaehler1 = 0;
  int zaehler2 = 0;

  Future<void> warteKurz() async {
    await Future.delayed(const Duration(milliseconds: 500));
  }

  Future<void> inkrementiereZaehler1() async {
    await warteKurz();
    setState(() {
      zaehler1++;
      debugPrint('Methode 1: $zaehler1');
    });
  }

  Future<void> inkrementiereZaehler2() async {
    await warteKurz();
    setState(() {
      zaehler2++;
      debugPrint('Methode 2: $zaehler2');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Async Button'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  await inkrementiereZaehler1();
                  await inkrementiereZaehler2();
                  debugPrint('Fertig');
                },
                child: const Text('Button'),
              ),
              const SizedBox(height: 16),
              Text('Zähler 1: $zaehler1', style: const TextStyle(fontSize: 18)),
              Text('Zähler 2: $zaehler2', style: const TextStyle(fontSize: 18)),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const S5511());
}
