import 'package:flutter/material.dart';

class TodoTask {
  int task_no;
  int todo_no;
  String task;
  String description;
  int status;

  TodoTask({
    @required this.task_no,
    @required this.todo_no,
    @required this.task,
    this.description,
    @required this.status,
  });
}
