import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TodoListProvider(),
      child: MyApp(),
    ),
  );
}

class TodoListProvider extends ChangeNotifier {
  List<TodoItem> todos = [
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

  void toggleTodo(int index, bool value) {
    todos[index].isDone = value;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TodoList(),
    );
  }
}

class TodoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do Liste 08.01.2024'),
      ),
      body: Consumer<TodoListProvider>(
        builder: (context, todoListProvider, child) {
          return ListView.builder(
            itemCount: todoListProvider.todos.length,
            itemBuilder: (context, index) {
              return TodoItemWidget(
                key: Key(todoListProvider.todos[index].name),
                todo: todoListProvider.todos[index],
                onToggle: (value) {
                  todoListProvider.toggleTodo(index, value!);
                },
              );
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

  const TodoItemWidget({Key? key, required this.todo, required this.onToggle})
      : super(key: key);

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
        value: todo.isDone,
        onChanged: onToggle,
      ),
      onTap: () => onToggle(!todo.isDone),
    );
  }
}

class TodoItem {
  final String name;
  bool isDone;

  TodoItem({required this.name, this.isDone = false});
}
