//import 'package:flutter/material.dart';

class TodoList {
  String? id;
  String? todoText;
  bool isDone;

  TodoList({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  static List<TodoList> todoList() {
    return [
      TodoList(id: '01', todoText: 'Morning Excercise', isDone: true),
      TodoList(id: '02', todoText: 'Buy Groceries', isDone: true),
      TodoList(
        id: '03',
        todoText: 'Check Emails',
      ),
      TodoList(
        id: '04',
        todoText: 'Team Meeting',
      ),
    ];
  }
}
