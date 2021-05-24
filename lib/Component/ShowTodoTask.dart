import 'package:flutter/material.dart';
import 'package:todo_list/Model/TodoTask.dart';
import 'package:todo_list/Service/TodoTaskAPI.dart';
import 'package:todo_list/Widget/Text/TodoDate.dart';
import 'package:todo_list/Widget/Text/TodoText.dart';
import 'package:todo_list/Widget/Text/TodoTitle.dart';

class ShowTodoTask extends StatelessWidget {
  List<TodoTask> data;
  TodoTaskAPI task_api;
  ShowTodoTask({this.data});

  Widget notHaveTask() {
    print('not have task');
    return Text("Don't have any task yet please add.");
  }

  Future updateStatus (TodoTask task) {
    return task_api.updateTaskStatus(task.todo_no,task.task_no,1);
  }

  Widget Task(TodoTask task) {
    print("have task");
    return ListTile(
      onLongPress: () {
        updateStatus(task);
      },
      title: TodoTitle(title: task.task),
      subtitle: TodoText(content: task.description),
      trailing: TodoDate(
        date: task.status == 1 ? "Finish" : "Not finish",
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data == null ? 0 : data.length,
      itemBuilder: (context, index) {
        final item = data[index];
        return Container(
          child: Card(
            child: Task(item),
          ),
        );
      },
    );
  }
}
