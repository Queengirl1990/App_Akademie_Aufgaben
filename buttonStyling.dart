import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

const Color background = Color(0xFF837471);
const Color backgroundGrey = Color(0xFFF3F3F3);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MyProfilPage(),
    );
  }
}

class MyCircularAvatar extends StatelessWidget {
  const MyCircularAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: ClipOval(
        child: Image.asset(
          'assets/images/avatar.png',
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class MyProfilPage extends StatelessWidget {
  const MyProfilPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          backgroundColor: background,
          elevation: 0,
          actions: const [],
          title: const Text(
            "Mein Profil",
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'DancingScript',
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ),
      ),
      backgroundColor: background,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 20),
              const MyCircularAvatar(),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Queengirl",
                    style: TextStyle(
                      fontFamily: 'DancingScript',
                      fontWeight: FontWeight.normal,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.edit),
                    color: Colors.white,
                    iconSize: 18,
                    onPressed: () {
                      // Icon Logik
                    },
                  ),
                ],
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // Bearbeiten Logik
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: backgroundGrey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 5,
                ),
                child: const Text(
                  "Bearbeiten",
                  style: TextStyle(
                    color: background,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              //Cupertiono Design
              CupertinoButton(
                onPressed: () {
                  // Cupertino Button Logik
                },
                padding: const EdgeInsets.all(12),
                color: backgroundGrey,
                borderRadius: BorderRadius.circular(10),
                child: const Text(
                  "Bearbeiten (Cupertino)",
                  style: TextStyle(
                    color: background,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
