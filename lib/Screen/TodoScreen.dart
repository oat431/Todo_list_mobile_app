import 'package:flutter/material.dart';
import 'package:todo_list/Component/TodoListComponent/ShowTodoList.dart';
import 'package:todo_list/Widget/TodoAppbar.dart';

class TodoScreen extends StatelessWidget {
  static String tag = "TodoScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TodoAppbar(screen_name: "Home page"),
      body: ShowTodoList(),
    );
  }
}
