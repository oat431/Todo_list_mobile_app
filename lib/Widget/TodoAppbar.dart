import 'package:flutter/material.dart';

class TodoAppbar extends StatelessWidget implements PreferredSizeWidget {
  String title;
  String leadPath;
  List<Widget> actionPath;
  TodoAppbar({
    @required String title,
    String leadPath,
    List<Widget> actionPath,
  });

  @override
  Size get preferredSize => Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: GestureDetector(),
      title: Text(title ?? 'Default Text'),
      actions: actionPath,
    );
  }
}
