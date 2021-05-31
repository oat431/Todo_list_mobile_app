import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:todo_list/Service/TodoTaskAPI.dart';
import 'package:todo_list/Widget/Text/TodoTitle.dart';
import 'package:todo_list/Widget/TodoButton.dart';
import 'package:todo_list/Widget/TodoInput.dart';

class AddingTodoTask extends StatefulWidget {
  int todo_no;
  Function fun;
  AddingTodoTask({this.todo_no, this.fun});
  @override
  _AddingTodoTaskState createState() => _AddingTodoTaskState();
}

class _AddingTodoTaskState extends State<AddingTodoTask> {
  final _task = TextEditingController();
  final _description = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    _task.dispose();
    _description.dispose();
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
            TodoTitle(title: "Adding some task"),
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
                await TodoTaskAPI.addtodoTask(
                  _task.text,
                  _description.text,
                  widget.todo_no,
                );
                widget.fun();
                SmartDialog.showToast("Task added");
              },
            ),
          ],
        ),
      ),
    );
  }
}
