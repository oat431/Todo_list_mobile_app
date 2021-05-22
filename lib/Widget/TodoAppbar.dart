import 'package:flutter/material.dart';

class TodoAppbar extends StatelessWidget implements PreferredSizeWidget {
  String screen_name;
  String leadPath;
  List<Widget> actionPath;
  TodoAppbar({
    @required this.screen_name,
    this.leadPath,
    this.actionPath,
  });

  @override
  Size get preferredSize => Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: GestureDetector(),
      title: Text(screen_name),
      actions: actionPath,
    );
  }
}
