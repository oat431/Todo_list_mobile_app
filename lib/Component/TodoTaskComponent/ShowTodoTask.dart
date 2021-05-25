import 'package:flutter/material.dart';
import 'package:todo_list/Model/TodoTask.dart';
import 'package:todo_list/Screen/TodoTaskScreen.dart';
import 'package:todo_list/Service/TodoTaskAPI.dart';
import 'package:todo_list/Widget/Text/TodoDate.dart';
import 'package:todo_list/Widget/Text/TodoText.dart';
import 'package:todo_list/Widget/Text/TodoTitle.dart';

class ShowTodoTask extends StatefulWidget {
  List<TodoTask> data;

  ShowTodoTask({this.data});

  @override
  _ShowTodoTaskState createState() => _ShowTodoTaskState();
}

class _ShowTodoTaskState extends State<ShowTodoTask> {
  @override
  void initState() {
    super.initState();
  }

  Widget notHaveTask() {
    print('not have task');
    return Text("Don't have any task yet please add.");
  }

  void updateStatus(TodoTask task) async {
    return await TodoTaskAPI.updateTaskStatus(task.todo_no, task.task_no, 1)
        .then((success) {});
  }

  Widget Task(TodoTask task, int index, BuildContext context) {
    return ListTile(
      onLongPress: () {
        updateStatus(task);
        setState(() {
          widget.data[index].status = 1;
        });
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
    return Container(
      margin: EdgeInsets.only(top:3,bottom:3),
      child: ListView.builder(
        itemCount: widget.data == null ? 0 : widget.data.length,
        itemBuilder: (context, index) {
          final item = widget.data[index];
          return Container(
            child: Card(
              child: Task(item, index, context),
            ),
          );
        },
      ),
    );
  }
}
