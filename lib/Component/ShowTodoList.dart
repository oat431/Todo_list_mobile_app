import 'package:flutter/material.dart';
import 'package:todo_list/Screen/TodoTaskScreen.dart';
import 'package:todo_list/Widget/Text/TodoText.dart';
import 'package:todo_list/Widget/Text/TodoTitle.dart';
import 'package:todo_list/Widget/Text/TodoDate.dart';
import 'package:todo_list/Model/TodoList.dart';

class ShowTodoList extends StatelessWidget {
  List<TodoList> data;

  ShowTodoList({this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top:3,bottom:3),
      child: ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (context, index) {
          final item = data[index];
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
    );
  }
}
