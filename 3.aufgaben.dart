import 'dart:io';

void main() {
  final taskList = <String>[];

  while (true) {
    print('1. Aufgabe hinzufügen');
    print('2. Aufgabenliste anzeigen');
    print('3. Aufgabe löschen');
    print('4. Beenden');
    stdout.write('Wählen Sie eine Option: ');

    final option = int.tryParse(stdin.readLineSync() ?? '');

    if (option == null) {
      print('Ungültige Eingabe. Bitte wählen Sie eine Nummer.');
      continue;
    }

    switch (option) {
      case 1:
        addTask(taskList);
        break;
      case 2:
        displayTasks(taskList);
        break;
      case 3:
        deleteTask(taskList);
        break;
      case 4:
        exit(0);

      default:
        print('Ungültige Option. Bitte wählen Sie eine gültige Option.');
    }
  }
}

void addTask(List<String> taskList) {
  stdout.write('Geben Sie die Aufgabe ein: ');
  final task = stdin.readLineSync() ?? '';
  taskList.add(task);

  print('Aufgabe hinzugefügt: $task');
}

void displayTasks(List<String> taskList) {
  if (taskList.isEmpty) {
    print('Die Aufgabenliste ist leer.');
  } else {
    print('Aufgabenliste:');
    for (var i = 0; i < taskList.length; i++) {
      print('Aufgabe ${i + 1}: ${taskList[i]}');
    }
  }
}

void deleteTask(List<String> taskList) {
  displayTasks(taskList);
  stdout.write('Geben Sie die Nummer der Aufgabe ein, die Sie löschen möchten: ');
  final taskNumber = int.tryParse(stdin.readLineSync() ?? '');

  if (taskNumber != null && taskNumber >= 1 && taskNumber <= taskList.length) {
    final deletedTask = taskList.removeAt(taskNumber - 1);
    print('Aufgabe gelöscht: $deletedTask');
  } else {
    print('Ungültige Aufgabennummer.');
  }
}
