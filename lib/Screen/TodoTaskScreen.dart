import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:todo_list/Component/TodoTaskComponent/ShowTodoTask.dart';
import 'package:todo_list/Widget/TodoAppbar.dart';
import 'package:todo_list/Screen/TodoScreen.dart';

class TodoTaskScreen extends StatelessWidget {
  static String tag = "TodoTaskScreen";

  int todo_no;
  String title;

  TodoTaskScreen({this.todo_no, this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TodoAppbar(
        leading_part: GestureDetector(
          child: Icon(Icons.arrow_back),
          onTap: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => TodoScreen(),
                ),
                (route) => false);
          },
        ),
        screen_name: title,
      ),
      body: ShowTodoTask(
        todo_no: todo_no,
      ),
    );
  }
}
