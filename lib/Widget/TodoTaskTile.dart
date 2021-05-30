import 'package:flutter/material.dart';
import 'package:todo_list/Model/TodoTask.dart';
import 'package:todo_list/Widget/Text/TodoDate.dart';
import 'package:todo_list/Widget/Text/TodoText.dart';
import 'package:todo_list/Widget/Text/TodoTitle.dart';

class TodoTaskTile extends StatelessWidget {
  TodoTask task;
  int index;
  Function update;
  Function delete;
  TodoTaskTile({this.task, this.index, this.update, this.delete});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: delete,
      onTap: update,
      title: TodoTitle(title: task.task),
      subtitle: TodoText(content: task.description),
      trailing: TodoDate(
        date: task.status == 1 ? "Finish" : "Not finish",
      ),
    );
    ;
  }
}
