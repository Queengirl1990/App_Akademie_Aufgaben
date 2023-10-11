import 'dart:io';

void main() {
  // Aktuelles Datum 
  DateTime now = DateTime.now();

  // Benutzereingabe 
  print("Geben Sie Ihr Geburtsdatum ein (im Format JJJJ-MM-TT):");
  String birthDateInput = stdin.readLineSync()!;

  // DateTime-Objekt konvertieren
  DateTime birthDate = DateTime.parse(birthDateInput);

  // Differenz berechnen
  int age = now.year - birthDate.year;

  // Überprüfen ob Geburtstag dieses Jahr stattgefunden hat
  if (now.month < birthDate.month || (now.month == birthDate.month && now.day < birthDate.day)) {
    age--;
  }

  print("Ihr Alter beträgt $age Jahre.");
}
