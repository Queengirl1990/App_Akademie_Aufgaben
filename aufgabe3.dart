import 'package:flutter/material.dart';
import 'style.dart'; // Importiere Styles

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

  PetProfile(this.name, this.weight, this.height, this.favoriteFood,
      this.imageAsset, this.steckbrief);
}

class HomeScreen extends StatelessWidget {
  //profil der Tiere
  final Map<String, PetProfile> petProfiles = {
    'Jones':
        PetProfile('Jones', 32, 57, 'Käse', 'assets/images/jones2.png', 'Hund'),
    'Lilly': PetProfile('Lilly', 1.5, 20, 'Leberwurstcreme',
        'assets/images/lilly.jpeg', 'Katze'),
    'Irnie': PetProfile(
        'Irnie', 0.85, 10, 'Nüsse', 'assets/images/irnie.jpeg', 'Hamster'),
    'Sindy': PetProfile(
        'Sindy', 1.0, 59, 'Salat', 'assets/images/lexi.jpeg', 'Schildkröte'),
    'Red': PetProfile(
        'Red', 3.8, 58, 'Äpfel', 'assets/images/tony.webp', 'Roter Panda'),
  };

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HomeScreen"),
      ),
      body: ListView(
        //Auflistung der Tiere
        children: petProfiles.values.map((profile) {
          return Card(
            child: ListTile(
              leading: const Icon(Icons.pets),
              title: Text(profile.name, style: regularTextStyle),
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
  //Einsicht in die einzelnen Petcards
  @override
  Widget build(BuildContext context) {
    final PetProfile petProfile =
        ModalRoute.of(context)!.settings.arguments as PetProfile;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
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
            const SizedBox(
              height: 10,
            ),
            //aufruf der einzelnen Daten
            Text(
              "Name:",
              style: boldTextStyle,
            ),
            Text(
              "${petProfile.name}",
              style: regularTextStyle,
            ),
            Text(
              "Gewicht:",
              style: boldTextStyle,
            ),
            Text(
              "${petProfile.weight} kg",
              style: regularTextStyle,
            ),
            Text(
              "Größe:",
              style: boldTextStyle,
            ),
            Text(
              "${petProfile.height} cm",
              style: regularTextStyle,
            ),
            Text(
              "Lieblingsessen:",
              style: boldTextStyle,
            ),
            Text(
              "${petProfile.favoriteFood}",
              style: regularTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}

class ImageContainer extends StatelessWidget {
  //bild der Tiere
  final String imageAsset;

  const ImageContainer({super.key, required this.imageAsset});

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
