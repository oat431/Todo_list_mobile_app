import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:todo_list/Component/ShowTodoTask.dart';
import 'package:todo_list/Model/TodoTask.dart';
import 'package:todo_list/Service/TodoTaskAPI.dart';
import 'package:todo_list/Widget/TodoAppbar.dart';
import 'package:todo_list/Widget/TodoFAB.dart';

import 'TodoScreen.dart';

class TodoTaskScreen extends StatefulWidget {
  static String tag = "TodoTaskScreen";

  int todo_no;
  String title;

  TodoTaskScreen({this.todo_no, this.title});

  @override
  _TodoTaskScreenState createState() => _TodoTaskScreenState();
}

class _TodoTaskScreenState extends State<TodoTaskScreen> {
  List<TodoTask> _todoTask;

  Future<String> getAllTaskByTodoList() async {
    var response = await TodoTaskAPI.getallTask(widget.todo_no);
    setState(() {
      List res = json.decode(response.body);
      _todoTask = res.map((data) => TodoTask.fromJson(data)).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    getAllTaskByTodoList();
  }

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
        screen_name: widget.title,
      ),
      body: ShowTodoTask(data: _todoTask),
      floatingActionButton: TodoFAB(fun:(){print("something");}),
    );
  }
}
