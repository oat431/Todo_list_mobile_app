import 'package:flutter/material.dart';

class TodoAppbar extends StatelessWidget {
  String title;
  String leadPath;
  List<Widget> actionPath;
  TodoAppbar({
    @required String title,
    String leadPath,
    List<Widget> actionPath,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: GestureDetector(),
      title: Text(this.title),
      actions: actionPath,
    );
  }
}
