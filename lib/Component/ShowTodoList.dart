import 'package:flutter/material.dart';
import 'package:todo_list/Model/TodoList.dart';

class ShowTodoList extends StatelessWidget {
  List<TodoList> data;

  ShowTodoList({this.data});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data == null ? 0 : data.length,
      itemBuilder: (context, index) {
        final item = data[index];
        return ListTile(
          title: Text(item.title),
        );
      },
    );
  }
}
