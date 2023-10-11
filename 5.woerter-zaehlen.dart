import 'dart:math';

void main() {
  final textList = [
    "To tell you I was wrong, but you already know. Believe me, I won't stop at nothing to see you. So I've started running",
    "Kann sich ein Leben von heute auf morgen komplett verändern? Kann ein Mann ihre Welt aus den Fugen geraten lassen und welches Geheimnis kann Alexandras gesamte Gedankenwelt in Frage stellen?",
    "Wie geht es dir heute?",
    "Apfelkuchen Hundewiese Hammerzeh Apfel Kindergarten"
  ];

  final random = Random();
  final selectedText = getRandomItem(textList, random);

  final wordCount = countWords(selectedText);
  final sentenceCount = countSentences(selectedText);
  final textLength = selectedText.length;

  print('Zufällig ausgewählter Satz/Wort:');
  print('Eingegebener Text: $selectedText');
  print('Anzahl der Wörter: $wordCount');
  print('Anzahl der Sätze: $sentenceCount');
  print('Gesamtlänge des Textes: $textLength');
}

String getRandomItem(List<String> items, Random random) {
  final randomIndex = random.nextInt(items.length);
  return items[randomIndex];
}

int countWords(String text) {
  //\s+: Sucht nach einem/oder mehr Leerzeichen 
  
  final words = text.split(RegExp(r'\s+'));
  return words.length;
}

int countSentences(String text) {
  //suche nach . ! ?
  final sentences = text.split(RegExp(r'[.!?]'));
  return sentences.length - 1;
}
