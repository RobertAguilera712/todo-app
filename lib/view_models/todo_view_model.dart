import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:todo_app/models/todo.dart';

class TodoViewModel extends ChangeNotifier {
  final Isar isar;
  List<Todo> _todos = [];

  List<Todo> get todos => _todos;

  TodoViewModel(this.isar) {
    loadTodos();
  }

  Future<void> loadTodos() async {
    _todos = await isar.todos.where().findAll();
    notifyListeners();
  }

  Future<void> upsertTodo(Todo todo) async {
    await isar.writeTxn(() async {
      await isar.todos.put(todo);
    });
    loadTodos();
  }

  Future<void> deleteTodoById(int id) async {
    await isar.writeTxn(() async {
      await isar.todos.delete(id);
    });
    loadTodos();
  }
}
