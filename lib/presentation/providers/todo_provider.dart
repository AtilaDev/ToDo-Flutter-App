import 'package:flutter/material.dart';
import 'package:todo_app/domain/entities/item.dart';

class TodoProvider extends ChangeNotifier {
  List<Item> items = [];

  Future<void> addTodo(String task) async {
    if (task.isEmpty) return;

    final newTodo = Item(taskName: task, date: DateTime.now());

    items.add(newTodo);
    notifyListeners();
  }

  Future<void> deleteTodo(int index) async {
    items.removeAt(index);
    notifyListeners();
  }
}
