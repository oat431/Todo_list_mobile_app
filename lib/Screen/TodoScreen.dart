import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:todo_list/Component/HomePageAppbar.dart';
import 'package:todo_list/Component/ShowTodoList.dart';
import 'package:todo_list/Model/TodoList.dart';
import 'package:todo_list/Service/TosoListAPI.dart';

class TodoScreen extends StatefulWidget {
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
      appBar: HomeAppbar(title: 'Home page'),
      body: ShowTodoList(data:_todoList),
    );
  }
}
