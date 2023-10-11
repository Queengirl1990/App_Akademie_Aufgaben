import 'dart:io';

void main() {
  bool continueCalculating = true;

  while (continueCalculating) {
    int operation = 0;
    double number1 = 0.0;
    double number2 = 0.0;

    do {
      print("Welche Operation möchten Sie durchführen?");
      print("1. Addition");
      print("2. Subtraktion");
      print("3. Multiplikation");
      print("4. Division");

      try {
        operation = int.parse(stdin.readLineSync() ?? '');
      } catch (e) {
        print("Ungültige Eingabe. Bitte geben Sie eine Zahl zwischen 1 und 4 ein.");
      }
    } while (operation < 1 || operation > 4);

    print("Geben Sie die erste Zahl ein:");
    try {
      number1 = double.parse(stdin.readLineSync() ?? '');
    } catch (e) {
      print("Ungültige Eingabe. Bitte geben Sie eine gültige Zahl ein.");
      continue;
    }

    print("Geben Sie die zweite Zahl ein:");
    try {
      number2 = double.parse(stdin.readLineSync() ?? '');
    } catch (e) {
      print("Ungültige Eingabe. Bitte geben Sie eine gültige Zahl ein.");
      continue;
    }

    double result = 0.0;

    switch (operation) {
      case 1:
        result = number1 + number2;
        break;
      case 2:
        result = number1 - number2;
        break;
      case 3:
        result = number1 * number2;
        break;
      case 4:
        if (number2 != 0) {
          result = number1 / number2;
        } else {
          print('Division durch Null ist nicht erlaubt.');
          continue;
        }
        break;
    }

    print('Das Ergebnis ist: $result');

    print('Nochmal? (j/n)');
    String? input = stdin.readLineSync()?.toLowerCase();
    if (input != 'j') {
      print('Programm wird beendet.');
      continueCalculating = false;
    }
  }
}
