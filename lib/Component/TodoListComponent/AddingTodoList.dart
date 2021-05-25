import 'package:flutter/material.dart';
import 'package:todo_list/Widget/Text/TodoTitle.dart';
import 'package:todo_list/Widget/TodoButton.dart';
import 'package:todo_list/Widget/TodoInput.dart';

class AddingTodoList extends StatelessWidget {
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
            SizedBox(height: 20,),
            TodoTitle(title:"Add new Todo List"),
            TodoInput(placeholder: 'Title'),
            TodoInput(placeholder: 'Description'),
            TodoInput(placeholder: 'Owner'),
            TodoButton(
              buttonLabel: 'submit',
              whenSubmit: () {
                print("something");
              },
            ),
          ],
        ),
      ),
    );
  }
}
