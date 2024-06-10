import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/views/dialog_box.dart';
import 'package:todo_app/views/todo_tile.dart';

class HomePage extends StatefulWidget {
  final Isar isar;

  const HomePage({super.key, required this.isar});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Isar isar;
  List<Todo> todos = [];
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    isar = widget.isar;
    loadTodos();
  }

  Future<void> loadTodos() async {
    final loadedTodos = await isar.todos.where().findAll();
    setState(() {
      todos = loadedTodos;
    });
  }

  void checkboxChanged(bool? value, int index) async {
    var todo = todos[index];
    todo.isCompleted = !todo.isCompleted;
    updateTodo(todo);
  }

  Future<void> updateTodo(Todo todo) async {
    await isar.writeTxn(() async {
      await isar.todos.put(todo);
    });
    loadTodos();
  }

  Future<void> deleteTodo(int id) async {
    await isar.writeTxn(() async {
      await isar.todos.delete(id);
    });
    loadTodos();
  }

  void onSaveTask() {
    var todo = Todo(name: _controller.text, isCompleted: false);
    updateTodo(todo);
    setState(() {
      _controller.clear();
    });
    Navigator.pop(context);
  }

  void onCancel() {
    Navigator.pop(context);
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: onSaveTask,
          onCancel: onCancel,
        );
      },
    );
  }

  void deleteTask(int index) {
    var todo = todos[index];
    deleteTodo(todo.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.red[200],
        appBar: AppBar(
          title: Text("R Todo"),
          elevation: 0,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        body: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) {
            return TodoTile(
              taskName: todos[index].name,
              taskCompleted: todos[index].isCompleted,
              onChanged: (value) => checkboxChanged(value, index),
              onDelete: (value) => deleteTask(index),
            );
          },
        ));
  }
}
