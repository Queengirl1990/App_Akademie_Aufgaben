int berechneFakultaet(int zahl) {
  if (zahl == 0) {
    return 1; 
  } else {
    int fakultaet = 1;
    for (int i = 1; i <= zahl; i++) {
      fakultaet *= i;
    }
    return fakultaet;
  }
}

void main() {
  int eingabe = 5; 
  int ergebnis = berechneFakultaet(eingabe);
  print('Die Fakultät von $eingabe ist $ergebnis');
}