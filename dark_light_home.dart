import 'package:dark_mode/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:dark_mode/components/box.dart';
import 'package:dark_mode/components/button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ThemeData currentTheme = lightMode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Aufruf der Themes
      backgroundColor: currentTheme.colorScheme.background,
      body: Center(
        child: MyBox(
          color: currentTheme.colorScheme.primary,
          child: MyButton(
            //Switch zwischen Light und Dark
            color: currentTheme.colorScheme.secondary,
            onTap: () {
              setState(() {
                currentTheme =
                    (currentTheme == lightMode) ? darkMode : lightMode;
              });
            },
          ),
        ),
      ),
    );
  }
}
