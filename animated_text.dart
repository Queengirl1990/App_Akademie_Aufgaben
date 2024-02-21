import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _fontSize = 20.0;
  bool _isGrowing = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated Text Size"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedDefaultTextStyle(
              child: const Text(
                "App Akademie",
                style: TextStyle(color: Color.fromARGB(255, 219, 191, 9)),
              ),
              style: TextStyle(
                fontSize: _fontSize,
                fontWeight: FontWeight.bold,
              ),
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
            ),
            const SizedBox(height: 20),
            //Animation beim Klick wird der Text größer und beim erneuten wieder kleiner
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (_isGrowing) {
                    _fontSize = 40.0;
                  } else {
                    _fontSize = 20.0;
                  }
                  _isGrowing = !_isGrowing;
                });
              },
              child: const Icon(Icons.search),
            ),
          ],
        ),
      ),
    );
  }
}
