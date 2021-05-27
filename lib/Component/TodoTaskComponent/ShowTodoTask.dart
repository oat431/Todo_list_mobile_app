import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:todo_list/Model/TodoTask.dart';
import 'package:todo_list/Service/TodoTaskAPI.dart';
import 'package:todo_list/Widget/Text/TodoDate.dart';
import 'package:todo_list/Widget/Text/TodoText.dart';
import 'package:todo_list/Widget/Text/TodoTitle.dart';

class ShowTodoTask extends StatefulWidget {
  int todo_no;
  ShowTodoTask({this.todo_no});

  @override
  _ShowTodoTaskState createState() => _ShowTodoTaskState();
}

class _ShowTodoTaskState extends State<ShowTodoTask> {
  List<TodoTask> _todoTask;

  Future<String> getAllTaskByTodoList() async {
    var response = await TodoTaskAPI.getallTask(widget.todo_no);
    setState(() {
      List res = json.decode(response.body);
      _todoTask = res.map((data) => TodoTask.fromJson(data)).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    getAllTaskByTodoList();
  }

  Widget notHaveTask() {
    print('not have task');
    return Text("Don't have any task yet please add.");
  }

  Widget Task(TodoTask task, int index, BuildContext context) {
    return ListTile(
      onLongPress: () async {
        await TodoTaskAPI.deletetodoTask(task.todo_no, task.task_no)
            .then((ok) {});
        getAllTaskByTodoList();
      },
      onTap: () async {
        await TodoTaskAPI.updateTaskStatus(task.todo_no, task.task_no, 1)
            .then((ok) {});
        setState(() {
          _todoTask[index].status = 1;
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
      margin: EdgeInsets.only(top: 3, bottom: 3),
      child: ListView.builder(
        itemCount: _todoTask == null ? 0 : _todoTask.length,
        itemBuilder: (context, index) {
          final item = _todoTask[index];
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
