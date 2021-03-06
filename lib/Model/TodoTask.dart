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

  factory TodoTask.fromJson(Map<String, dynamic> json) {
    return TodoTask(
      task_no:json['task_no'],
      todo_no: json['todo_no'],
      task:json['task'],
      description: json['description'],
      status: json['status'],
    );
  }
}
