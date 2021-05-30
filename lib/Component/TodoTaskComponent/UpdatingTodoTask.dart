import 'package:flutter/material.dart';
import 'package:todo_list/Model/TodoTask.dart';
import 'package:todo_list/Service/TodoTaskAPI.dart';
import 'package:todo_list/Widget/Text/TodoTitle.dart';
import 'package:todo_list/Widget/TodoButton.dart';
import 'package:todo_list/Widget/TodoInput.dart';

class UpdatingTodoTask extends StatefulWidget {
  TodoTask task;
  Function fun;
  UpdatingTodoTask({this.task, this.fun});
  @override
  _UpdatingTodoTaskState createState() => _UpdatingTodoTaskState();
}

class _UpdatingTodoTaskState extends State<UpdatingTodoTask> {
  TextEditingController _task = TextEditingController();
  TextEditingController _description = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _task.dispose();
    _description.dispose();
  }

  @override
  void initState() {
    super.initState();
    _task.text = widget.task.task;
    _description.text = widget.task.description;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: 400, maxWidth: double.infinity),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 20, spreadRadius: 10)
        ],
      ),
      child: Card(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            TodoTitle(title: "Editing a task"),
            TodoInput(
              placeholder: 'Task',
              controller: _task,
            ),
            TodoInput(
              placeholder: 'Description',
              controller: _description,
            ),
            TodoButton(
              buttonLabel: 'submit',
              whenSubmit: () async {
                await TodoTaskAPI.updateTask(
                  widget.task.todo_no,
                  widget.task.task_no,
                  _description.text,
                  _task.text,
                );
                widget.fun();
              },
            ),
          ],
        ),
      ),
    );
  }
}
