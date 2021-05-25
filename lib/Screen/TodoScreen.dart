import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:todo_list/Component/TodoListComponent/AddingTodoList.dart';
import 'package:todo_list/Component/TodoListComponent/ShowTodoList.dart';
import 'package:todo_list/Model/TodoList.dart';
import 'package:todo_list/Service/TodoListAPI.dart';
import 'package:todo_list/Widget/TodoAppbar.dart';
import 'package:todo_list/Widget/TodoFAB.dart';

class TodoScreen extends StatefulWidget {
  static String tag = "TodoScreen";

  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  List<TodoList> _todoList;

  Future<String> getAlltodoList() async {
    var response = await TodoListAPI.getAlltodoList;
    setState(() {
      List res = json.decode(response.body);
      _todoList = res.map((data) => TodoList.fromJson(data)).toList();
    });
    return "ok";
  }

  @override
  void initState() {
    super.initState();
    getAlltodoList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TodoAppbar(screen_name: "Home page"),
      body: ShowTodoList(data: _todoList),
      floatingActionButton: TodoFAB(
        hiddenWidget: AddingTodoList(),
      ),
    );
  }
}
