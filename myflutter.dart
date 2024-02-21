mport 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: FluidBusinessCard(),
  ));
}

class FluidBusinessCard extends StatelessWidget {
  const FluidBusinessCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter McFlutter'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16),
          width: double.infinity,
          height: 200,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Einzelnes großes Icon
                  Container(
                    width: 100,
                    height: 100,
                    child: const Icon(
                      Icons.account_circle,
                      size: 100,
                      color: Colors.black, // Farbe des Icons
                    ),
                  ),
                  const SizedBox(width: 8),
                  // Text
                  const Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Icon und Name
                        Row(
                          children: [
                            Text(
                              'Flutter McFlutter',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        // Titel
                        Text(
                          'Experienced App Developer',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              // Adresse und Telefonnummer mit Spacer
              const Row(
                children: [
                  // Adresse
                  Text(
                    '123 Main Street',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  Spacer(),
                  // Telefonnummer
                  Text(
                    '(415) 555-0198',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              // Icons unter der Adresse
              const Row(
                children: [
                  Icon(Icons.accessibility_new),
                  SizedBox(width: 8),
                  Icon(Icons.timer),
                  SizedBox(width: 8),
                  Icon(Icons.phone_android),
                  SizedBox(width: 8),
                  Icon(Icons.smartphone),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
