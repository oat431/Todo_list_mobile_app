import 'package:flutter/material.dart';
import 'package:todo_list/Model/TodoTask.dart';
import 'package:todo_list/Widget/Text/TodoText.dart';
import 'package:todo_list/Widget/Text/TodoTitle.dart';
import 'package:todo_list/Widget/TodoFAB.dart';

class TodoTaskTile extends StatelessWidget {
  TodoTask task;
  int index;
  Function update;
  Function delete;
  Widget edit_data;
  TodoTaskTile({
    this.task,
    this.index,
    this.update,
    this.delete,
    this.edit_data,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor:
          task.status == 1 ? Colors.green.shade100 : Colors.amber.shade50,
      onLongPress: delete,
      onTap: update,
      title: TodoTitle(title: task.task),
      subtitle: TodoText(content: task.description),
      trailing: TodoFAB(
        name: "Edit task",
        hiddenWidget: edit_data,
      ),
    );
    ;
  }
}
