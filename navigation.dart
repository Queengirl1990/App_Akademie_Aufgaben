import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'HomeScreen',
    initialRoute: '/',
    routes: {
      '/': (context) => HomeScreen(),
      '/details': (context) => DetailsScreen(),
    },
  ));
}

class HomeScreen extends StatelessWidget {
  final List<String> productNames = ['Product 1', 'Product 2', 'Product 3', 'Product 4', 'Product 5'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HomeScreen"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: productNames.map((productName) {
                return Card(
                  child: ListTile(
                    leading: Icon(Icons.phone),
                    title: Text(productName),
                    onTap: () {
                      Navigator.pushNamed(context, '/details', arguments: 'Info zu $productName');
                    },
                  ),
                );
              }).toList(),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/details', arguments: 'Info zu anderem Produkt');
            },
            child: Icon(Icons.search), // Such-Icon hinzufügen
          ),
        ],
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String info = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_sharp),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("DetailsScreen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(info),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Zurück zum HomeScreen"),
            ),
          ],
        ),
      ),
    );
  }
}
