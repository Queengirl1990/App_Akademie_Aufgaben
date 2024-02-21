import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import '../styles/farbcodes.dart';

void main() {
  runApp(const Bookies());
}

class Bookies extends StatelessWidget {
  const Bookies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const BookiesList(),
      },
      theme: ThemeData.light().copyWith(
        appBarTheme: const AppBarTheme(
          backgroundColor: darkRed,
          elevation: 0,
        ),
      ),
    );
  }
}

class BookiesList extends StatefulWidget {
  const BookiesList({Key? key}) : super(key: key);

  @override
  _BookiesListState createState() => _BookiesListState();
}

class _BookiesListState extends State<BookiesList> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkRed,
      bottomNavigationBar: Theme.of(context).platform == TargetPlatform.iOS
          ? CupertinoTabBar(
              backgroundColor: darkRed,
              activeColor: snowWhite,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.menu_book),
                  label: 'Sub',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Settings',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.help_outline),
                  label: 'Random',
                ),
              ],
            )
          : CurvedNavigationBar(
              index: currentPageIndex,
              backgroundColor: darkRed,
              color: darkMode,
              buttonBackgroundColor: darkMode,
              onTap: (int index) {
                setState(() {
                  currentPageIndex = index;
                  if (index == 1) {
                    Navigator.pushNamed(context, '/unreadBooks');
                  }
                });
              },
              items: const <Widget>[
                Icon(Icons.home, size: 30, color: snowWhite),
                Icon(Icons.menu_book, size: 30, color: snowWhite),
                Icon(Icons.settings, size: 30, color: snowWhite),
                Icon(Icons.help_outline, size: 30, color: snowWhite),
              ],
            ),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          title: const Text('Bookies List'),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/unreadBooks');
              },
              style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                backgroundColor: snowWhite,
                foregroundColor: darkRed,
                minimumSize: const Size(320, 50),
              ),
              child: const Text(
                "Stapel ungelesener Bücher",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Link einfügen
              },
              style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                backgroundColor: snowWhite,
                foregroundColor: darkRed,
                minimumSize: const Size(320, 50),
              ),
              child: const Text(
                "Wunschliste",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
