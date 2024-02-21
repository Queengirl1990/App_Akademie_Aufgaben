import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String text = "";
  late TextEditingController _textController;
  late String imagePath;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
    loadImagePath();
  }

  // Aufgabe 2: CRUD-Operationen mit SharedPreferences
  void saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("data", "Gespeicherte Information");
  }

  void readData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String data = prefs.getString("data") ?? "Keine Information gefunden";
    print(data);
  }

  void updateData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("data", "Aktualisierte Information");
  }

  void deleteData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("data");
  }

  // Beispiel für die Verwendung von ImagePicker und Pfad-Provider
  void loadImagePath() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
        source: ImageSource.gallery); // getImage zu pickImage geändert
    if (pickedFile != null) {
      imagePath = pickedFile.path;
      print("Bildpfad: $imagePath");
    }
  }

  @override
  Widget build(BuildContext context) {
    // Hier sollte die Widget-Implementierung hinzugefügt werden, um den Fehler zu beheben
    return Scaffold(
      appBar: AppBar(
        title: Text('My App'),
      ),
      body: Center(
        child: Text('Hello, World!'),
      ),
    );
  }
}
