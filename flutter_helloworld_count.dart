import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> { //Herzanimation
  int counter = 0;
  double heartScale = 1.0;

  void incrementCounter() {
    setState(() {
      counter++;
      heartScale = 1.2; // Skalierung erhöhen
    });

    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        heartScale = 1.0; // Skalierung wieder auf den Normalwert setzen
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFAC5859),
          title: Text('App Hello World'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  incrementCounter();
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  transform: Matrix4.diagonal3Values(heartScale, heartScale, 1.0),
                  child: Icon(
                    Icons.favorite,
                    color: Color(0xFFAC5859),
                    size: 80.0,
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                'Counter: $counter',
                style: TextStyle(fontSize: 20.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
