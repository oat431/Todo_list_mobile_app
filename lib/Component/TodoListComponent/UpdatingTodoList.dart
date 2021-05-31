import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:todo_list/Model/TodoList.dart';
import 'package:todo_list/Service/TodoListAPI.dart';
import 'package:todo_list/Widget/Text/TodoTitle.dart';
import 'package:todo_list/Widget/TodoButton.dart';
import 'package:todo_list/Widget/TodoInput.dart';

class UpdatingTodoList extends StatefulWidget {
  TodoList todo_list;
  String date;
  Function fun;

  UpdatingTodoList({this.todo_list, this.fun,this.date});

  @override
  _UpdatingTodoListState createState() => _UpdatingTodoListState();
}

class _UpdatingTodoListState extends State<UpdatingTodoList> {
  TextEditingController _description = TextEditingController();
  TextEditingController _title = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _description.dispose();
    _title.dispose();
  }

  @override
  void initState() {
    super.initState();
    _description.text = widget.todo_list.description;
    _title.text = widget.todo_list.title;
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
            TodoTitle(title: "Editing a list"),
            TodoInput(
              placeholder: 'Title',
              controller: _title,
            ),
            TodoInput(
              placeholder: 'Description',
              controller: _description,
            ),
            TodoButton(
              buttonLabel: 'submit',
              whenSubmit: () async {
                await TodoListAPI.updateTodoList(
                  widget.todo_list.todo_no,
                  _description.text,
                  widget.date,
                  _title.text,
                );
                widget.fun();
                SmartDialog.showToast("List Updated");
              },
            ),
          ],
        ),
      ),
    );
  }
}
