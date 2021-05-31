import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/Service/TodoListAPI.dart';
import 'package:todo_list/Widget/Text/TodoTitle.dart';
import 'package:todo_list/Widget/TodoButton.dart';
import 'package:todo_list/Widget/TodoInput.dart';

class AddingTodoList extends StatefulWidget {
  Function fun;

  AddingTodoList({this.fun});

  @override
  _AddingTodoListState createState() => _AddingTodoListState();
}

class _AddingTodoListState extends State<AddingTodoList> {
  final _title = TextEditingController();
  final _description = TextEditingController();
  final _owner = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _title.dispose();
    _description.dispose();
    _owner.dispose();
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
            TodoTitle(title: "Add new Todo List"),
            TodoInput(
              placeholder: 'Title',
              controller: _title,
            ),
            TodoInput(
              placeholder: 'Description',
              controller: _description,
            ),
            TodoInput(
              placeholder: 'Owner',
              controller: _owner,
            ),
            TodoButton(
              buttonLabel: 'submit',
              whenSubmit: () async {
                await TodoListAPI.addTodoList(
                  _owner.text,
                  _description.text,
                  DateFormat('yyyy-mm-dd').format(DateTime.now()),
                  _title.text,
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
