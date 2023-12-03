import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Switch Example",
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 238, 238, 238),
        appBar: AppBar(
          title: const Text('App Akademie'),
        ),
        body: const MyContent(),
      ),
    );
  }
}

class MyContent extends StatefulWidget {
  const MyContent({super.key});

  @override
  _MyContentState createState() => _MyContentState();
}

class _MyContentState extends State<MyContent> {
  bool isSwitchOn = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Center(
          child: Text(
            "Hello World!",
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.red,
              child: const SizedBox(
                width: 120,
                height: 120,
              ),
            ),
            const SizedBox(width: 40),
            Container(
              color: Colors.green,
              child: const SizedBox(
                width: 120,
                height: 120,
              ),
            ),
          ],
        ),
        const SizedBox(height: 150),
        Center(
          child: Switch(
            value: isSwitchOn,
            onChanged: (value) {
              setState(() {
                isSwitchOn = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
