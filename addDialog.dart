import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../styles/farbcodes.dart';

void main() {
  runApp(const GiveAwayApp());
}

class GiveAwayApp extends StatelessWidget {
  const GiveAwayApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Give Away Screen',
      theme: ThemeData(
        backgroundColor: darkRed,
      ),
      home: const GiveAwayScreen(),
    );
  }
}

class GiveAwayScreen extends StatefulWidget {
  const GiveAwayScreen({Key? key});

  @override
  _GiveAwayScreenState createState() => _GiveAwayScreenState();
}

class _GiveAwayScreenState extends State<GiveAwayScreen> {
  void _showAddBookDialog(BuildContext context) {
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      // iOS Dialog
      showCupertinoDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: const Text('Neues Buch hinzufügen'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CupertinoDialogAction(
                  onPressed: () {
                    Navigator.pop(context);
                    // Aktion für "Neues Buch hinzufügen"
                  },
                  child: const Text('Neues Buch hinzufügen'),
                ),
                CupertinoDialogAction(
                  onPressed: () {
                    Navigator.pop(context);
                    // Aktion für "Neues Buch aus vorhandener Liste importieren"
                  },
                  child: const Text(
                      'Neues Buch aus vorhandener Liste importieren'),
                ),
                CupertinoDialogAction(
                  onPressed: () {
                    Navigator.pop(context);
                    // Aktion für "Abbrechen"
                  },
                  child: const Text('Abbrechen'),
                ),
              ],
            ),
          );
        },
      );
    } else {
      // Android Dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Neues Buch hinzufügen'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    // Aktion für "Neues Buch hinzufügen"
                  },
                  child: const Text('Neues Buch hinzufügen'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    // Aktion für "Neues Buch aus vorhandener Liste importieren"
                  },
                  child: const Text(
                      'Neues Buch aus vorhandener Liste importieren'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    // Aktion für "Abbrechen"
                  },
                  child: const Text('Abbrechen'),
                ),
              ],
            ),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Verschenken",
          style: TextStyle(
            fontFamily: 'DancingScript',
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: snowWhite,
          ),
        ),
        backgroundColor: darkRed,
        elevation: 0,
        leading: IconButton(
          color: snowWhite,
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Pfad
            Navigator.pop(context);
          },
        ),
        actions: [
          myCircularAvatar(),
        ],
      ),
      backgroundColor: darkRed,
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 80 / 100,
        ),
        itemCount: giveAway.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            // Buch hinzufügen
            return GestureDetector(
              onTap: () {
                _showAddBookDialog(context);
              },
              child: Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: darkRed,
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    color: Colors.white,
                    width: 1.0,
                  ),
                ),
                child: const SizedBox(
                  width: 80,
                  height: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add,
                        size: 40,
                        color: Colors.white,
                      ),
                      Text(
                        "Neues Buch hinzufügen",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            final bookKey = giveAway.keys.elementAt(index - 1);
            return GestureDetector(
              onTap: () {
                // Navigator.push
              },
              child: Container(
                margin: const EdgeInsets.all(8),
                child: SizedBox(
                  width: 80,
                  height: 100,
                  child: Image.asset(
                    giveAway[bookKey]!['image']!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
