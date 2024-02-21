import 'dart:math';

class Person {
  String name;
  int weighting;
  bool selected; 

  Person(this.name, this.weighting) : selected = false; 
}

class Zufallsgenerator {
  List<Person> personList = [
    Person("Laura", 3),
    Person("Sophie", 2),
    Person("Anna", 1),
    Person("Oliver", 1),
    Person("Lisa", 1),
    Person("Marie", 2),
    Person("Carlos", 3),
    Person("James", 1),
    Person("Helena", 2),
    Person("Theo", 1)
  ];

  Person? random() {
    List<Person> availablePeople = [];

    for (var person in personList) {
      if (!person.selected) {
        availablePeople.add(person);
      }
    }

    if (availablePeople.isEmpty) {
      print("Alle Namen wurden verwendet!");
      return null;
    }

    int randomIndex = Random().nextInt(availablePeople.length);
    Person selectedPerson = availablePeople[randomIndex];
    selectedPerson.selected = true; 
    return selectedPerson;
  }
}

void main() {
  Zufallsgenerator randomgenerator = Zufallsgenerator();
  Person? person = randomgenerator.random();
  if (person != null) {
    print(person.name);
  }
}
