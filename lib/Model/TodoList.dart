import 'package:flutter/material.dart';

class TodoList {
  int todo_no;
  String owner;
  String description;
  String date;
  String title;

  TodoList({
    @required this.todo_no,
    @required this.owner,
    this.description,
    @required this.date,
    @required this.title,
  });

  factory TodoList.fromJson(Map<String, dynamic> json) {
    return TodoList(
      todo_no: json['todo_no'],
      owner: json['owner'],
      description: json['description'],
      date:json['date'].toString(),
      title:json['title']
    );
  }
}
