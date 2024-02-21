import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../styles/farbcodes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginDemo(),
    );
  }
}

class LoginDemo extends StatefulWidget {
  const LoginDemo({Key? key}) : super(key: key);

  @override
  _LoginDemoState createState() => _LoginDemoState();
}

class _LoginDemoState extends State<LoginDemo> {
  @override
  Widget build(BuildContext context) {
    Widget loginButtonIcon;
    String loginButtonText;
//zeigt nur den jeweiligen Button je nach Gerät an
    if (Theme.of(context).platform == TargetPlatform.android) {
      // Android
      loginButtonIcon = const Icon(Icons.mail);
      loginButtonText = 'Login mit Gmail';
    } else if (Theme.of(context).platform == TargetPlatform.iOS) {
      // iOS
      loginButtonIcon = const Icon(CupertinoIcons.heart_fill);
      loginButtonText = 'Login mit Apple';
    } else {
      loginButtonIcon = const SizedBox.shrink(); // Placeholder
      loginButtonText = 'Login';
    }

    return Scaffold(
      backgroundColor: darkRed,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 50),
              Center(
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: Image.asset('assets/images/logo.png'),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Logik für den Login-Button
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  minimumSize: const Size(160, 30),
                  elevation: 5,
                ),
                child: Text(
                  loginButtonText,
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  // Account erstellen 3 Varianten
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  minimumSize: const Size(320, 30),
                ),
                child: const Text(
                  'Registrieren',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
              if (Theme.of(context).platform == TargetPlatform.android ||
                  Theme.of(context).platform == TargetPlatform.iOS)
                ElevatedButton(
                  onPressed: () {
                    // Gmail login oder Apple login, je nach Plattform
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    minimumSize: const Size(320, 30),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      loginButtonIcon,
                      const SizedBox(width: 5),
                      Text(
                        loginButtonText,
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
