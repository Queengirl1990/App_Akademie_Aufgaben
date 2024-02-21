import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class TodoItem {
  String name;
  bool isDone;

  TodoItem({required this.name, this.isDone = false});
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TodoList(),
    );
  }
}

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  List<TodoItem> todos = [
    //Liste mit to dos
    TodoItem(name: "Kaffee kochen"),
    TodoItem(name: "Vorlesung"),
    TodoItem(name: "Meet mit Simon"),
    TodoItem(name: "Kochen"),
    TodoItem(name: "TaskSheet"),
    TodoItem(name: "Flutter lernen"),
    TodoItem(name: "Paket wegbringen"),
    TodoItem(name: "Tutorium"),
    TodoItem(name: "Mails bearbeiten"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do Liste 08.01.2024'),
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return TodoItemWidget(
            key: Key(todos[index].name),
            todo: todos[index],
            onToggle: (value) {
              //Checkbox inbteraktion
              setState(() {
                todos[index].isDone = value!;
              });
            },
          );
        },
      ),
    );
  }
}

class TodoItemWidget extends StatelessWidget {
  final TodoItem todo;
  final ValueChanged<bool?> onToggle;

  const TodoItemWidget({super.key, required this.todo, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        todo.name,
        style: TextStyle(
          decoration: todo.isDone ? TextDecoration.lineThrough : null,
        ),
      ),
      leading: Checkbox(
        //prüfung des Status
        value: todo.isDone,
        onChanged: onToggle,
      ),
      onTap: () => onToggle(!todo.isDone), //setzt auf erledigt oder wiederruft
    );
  }
}
