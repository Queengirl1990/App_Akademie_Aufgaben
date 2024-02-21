import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightMode,
      darkTheme: darkMode,
      home: MyHomePage(),
    );
  }
}

final ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: Colors.grey.shade400,
    primary: Colors.grey.shade300,
    secondary: Colors.grey.shade200,
  ),
);

final ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: Colors.grey.shade900,
    primary: Colors.grey.shade800,
    secondary: Colors.grey.shade700,
  ),
  textTheme: ThemeData.dark().textTheme.copyWith(
        bodyText2: TextStyle(
            color: Colors.white), // Änderung der Textfarbe im Dark-Modus
      ),
);

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dark/Light Mode Switch'),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Aktueller Modus:',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(height: 10),
            Text(
              isDarkMode ? 'Dark Mode' : 'Light Mode',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(height: 30),
            Switch(
              value: isDarkMode,
              onChanged: (value) {
                setState(() {
                  isDarkMode = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
