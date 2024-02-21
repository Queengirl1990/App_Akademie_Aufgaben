//zum testen ausgelagert

void main() {
  int result;
  for (int i = 10; i >= 0; i--) {
    try {
      result = 10 ~/ i;
      print(result);
    } catch (e) {
      print('Error: $e');
    }
  }
}
