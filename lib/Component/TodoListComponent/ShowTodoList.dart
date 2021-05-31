import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:todo_list/Screen/TodoTaskScreen.dart';
import 'package:todo_list/Service/TodoListAPI.dart';
import 'package:todo_list/Widget/Text/TodoText.dart';
import 'package:todo_list/Widget/Text/TodoTitle.dart';
import 'package:todo_list/Widget/Text/TodoDate.dart';
import 'package:todo_list/Widget/TodoFAB.dart';
import 'package:todo_list/Model/TodoList.dart';
import 'package:todo_list/Component/TodoListComponent/AddingTodoList.dart';

class ShowTodoList extends StatefulWidget {
  @override
  _ShowTodoListState createState() => _ShowTodoListState();
}

class _ShowTodoListState extends State<ShowTodoList> {
  List<TodoList> _data;

  Future<String> getAllList() async {
    var response = await TodoListAPI.getAllTodoList();
    setState(() {
      List res = json.decode(response.body);
      _data = res.map((todo)=>TodoList.fromJson(todo)).toList();
    });
  }

  Function refresh() {
    return () async {
      getAllList();
    };
  }

  @override
  void initState() {
    super.initState();
    getAllList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 3, bottom: 3),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _data == null ? 0 : _data.length,
              itemBuilder: (context, index) {
                final item = _data[index];
                return Container(
                  child: Card(
                    child: ListTile(
                      onTap: () => {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TodoTaskScreen(
                                todo_no: item.todo_no,
                                title: item.title,
                              ),
                            ),
                            (route) => false)
                      },
                      title: TodoTitle(title: item.title),
                      subtitle: TodoText(content: item.description),
                      trailing: TodoDate(date: item.date),
                    ),
                  ),
                );
              },
            ),
          ),
          TodoFAB(
            name: "add todo list",
            hiddenWidget: AddingTodoList(
              fun: refresh(),
            ),
          ),
        ],
      ),
    );
  }
}
