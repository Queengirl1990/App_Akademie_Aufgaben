import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue,
        colorScheme: const ColorScheme.light(
          primary: Colors.blue,
        ),
        scaffoldBackgroundColor: Colors.white, // Hintergrundfarbe der App
        fontFamily: 'Roboto', // Standardschriftart
      ),
      // ignore: prefer_const_constructors
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("App Akedemie Theme"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Bergfest", style: Theme.of(context).textTheme.headlineMedium),
            ElevatedButton(
              onPressed: () {},
              child:
                  Text("Klick mich", style: Theme.of(context).textTheme.button),
            ),
            const SizedBox(height: 20),
            Container(
              width: 200,
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Nutzername",
                  border: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.grey), // Grauer Rahmen
                    borderRadius:
                        BorderRadius.circular(10), // Abgerundete Ecken
                  ),
                  filled: true,
                  fillColor: Colors.white, // Hintergrundfarbe des Textfelds
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  // Vertikale und horizontale Innenabstände
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                    // Abgerundete Ecken für den fokussierten Zustand
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                    // Abgerundete Ecken für den normalen Zustand
                  ),
                  hintText: "Geben Sie Ihren Nutzernamen ein",
                  //Inpufeld
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: const Icon(
                Icons.favorite, // Herz-Icon
                color: Color.fromARGB(255, 142, 6, 6),
                size: 36,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
