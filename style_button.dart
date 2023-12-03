import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material Button Beispiele'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyMaterialButton(
                text: 'Material Button',
                onPressed: () {
                  print('Material Button wurde geklickt!');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyMaterialButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  MyMaterialButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Material(
          color: Colors.orange,
          borderRadius: BorderRadius.circular(20.0),
          child: InkWell(
            onTap: () {}, // Hier sollte eine Funktion ausgeführt werden
            borderRadius: BorderRadius.circular(20.0),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
