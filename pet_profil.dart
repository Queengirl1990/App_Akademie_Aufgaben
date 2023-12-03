import 'package:flutter/material.dart';
import 'style.dart'; // Importiere die style.dart-Datei

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

class PetProfile {
  String name;
  double weight;
  double height;
  String favoriteFood;
  String imageAsset;
  String steckbrief;

  PetProfile(this.name, this.weight, this.height, this.favoriteFood, this.imageAsset, this.steckbrief);
}

class HomeScreen extends StatelessWidget {
  final Map<String, PetProfile> petProfiles = {
    'Jones': PetProfile('Jones', 32, 57, 'Käse', 'assets/images/jones2.png', 'Hund'),
    'Lilly': PetProfile('Lilly', 1.5, 20, 'Leberwurstcreme', 'assets/images/lilly.jpeg', 'Katze'),
    'Irnie': PetProfile('Irnie', 0.85, 10, 'Nüsse', 'assets/images/irnie.jpeg', 'Hamster'),
    'Sindy': PetProfile('Sindy', 1.0, 59, 'Salat', 'assets/images/lexi.jpeg', 'Schildkröte'),
    'Red': PetProfile('Red', 3.8, 58, 'Äpfel', 'assets/images/tony.webp', 'Roter Panda'),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomeScreen"),
      ),
      body: ListView(
        children: petProfiles.values.map((profile) {
          return Card(
            child: ListTile(
              leading: Icon(Icons.pets),
              title: Text(profile.name, style: regularTextStyle), // Verwende "regularTextStyle"
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/details',
                  arguments: profile,
                );
              },
            ),
          );
        }).toList(),
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PetProfile petProfile = ModalRoute.of(context)!.settings.arguments as PetProfile;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("Steckbrief ${petProfile.steckbrief}"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageContainer(imageAsset: petProfile.imageAsset),
            SizedBox(
              height: 10,
            ),
            Text(
              "Name:",
              style: boldTextStyle, // Verwende "boldTextStyle"
            ),
            Text(
              "${petProfile.name}",
              style: regularTextStyle, // Verwende "regularTextStyle"
            ),
            Text(
              "Gewicht:",
              style: boldTextStyle, // Verwende "boldTextStyle"
            ),
            Text(
              "${petProfile.weight} kg",
              style: regularTextStyle, // Verwende "regularTextStyle"
            ),
            Text(
              "Größe:",
              style: boldTextStyle, // Verwende "boldTextStyle"
            ),
            Text(
              "${petProfile.height} cm",
              style: regularTextStyle, // Verwende "regularTextStyle"
            ),
            Text(
              "Lieblingsessen:",
              style: boldTextStyle, // Verwende "boldTextStyle"
            ),
            Text(
              "${petProfile.favoriteFood}",
              style: regularTextStyle, // Verwende "regularTextStyle"
            ),
          ],
        ),
      ),
    );
  }
}

class ImageContainer extends StatelessWidget {
  final String imageAsset;

  ImageContainer({required this.imageAsset});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imageAsset),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
