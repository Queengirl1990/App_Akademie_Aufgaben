import 'dart:math';

void main() {
  
  //Wörterbuch erstellen
  var dictionary = {
    "Flughafen": "Aeropuerto",
    "hotelanlage": "complejo hotelero",
    "Weißwein": "Vino Blanco",
  };

  //neues Wort hinzufügen
  dictionary['Aussichtsturm'] = "Torre de observación";

  var random = Random();
  var keys = dictionary.keys.toList();
  var randomKey = keys[random.nextInt(keys.length)];

  print("$randomKey auf Spanisch heißt: ${dictionary[randomKey]}");
}
