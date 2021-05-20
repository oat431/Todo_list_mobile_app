import 'package:flutter/material.dart';

class TodoList {
  int todo_no;
  String owner;
  String description;
  DateTime date;
  String title;

  TodoList({
    @required this.todo_no,
    @required this.owner,
    this.description,
    @required this.date,
    @required this.title,
  });
}
