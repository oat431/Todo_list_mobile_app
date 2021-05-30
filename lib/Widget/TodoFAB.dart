import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:todo_list/Component/TodoListComponent/AddingTodoList.dart';

class TodoFAB extends StatelessWidget {
  String name;
  Widget hiddenWidget;
  TodoFAB({this.hiddenWidget, this.name});

  void showDialog() {
    SmartDialog.show(
      alignmentTemp: Alignment.bottomCenter,
      clickBgDismissTemp: true,
      widget: hiddenWidget,
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => {showDialog()},
      child: Text(name),
    );
  }
}
