import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Cached Network Image Example'),
        ),
        body: Center(
          //images ziehen
          child: CachedNetworkImage(
            imageUrl:
                'https://www.drachenmond.de/cdn/shop/files/drachenmond-book-elements-farbschnittansicht_02bac1f7-f430-45e0-8eb5-fabf49dc00cb.png?v=1696642296',
            placeholder: (context, url) =>
                const CircularProgressIndicator(), //ladebalken
            errorWidget: (context, url, error) =>
                const Icon(Icons.error), //anzeige falls bild nicht geladen wird
          ),
        ),
      ),
    );
  }
}
