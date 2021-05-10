import 'package:flutter/material.dart';

class Todo {
  String todoTitle;
  String todoDescription;
  bool status;

  Todo({
    @required this.todoTitle,
    @required this.status,
    this.todoDescription,
  });
}
