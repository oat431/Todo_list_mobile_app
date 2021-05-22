import 'package:flutter/material.dart';
import 'package:todo_list/Widget/TodoAppbar.dart';

class HomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  String title;
  HomeAppbar({this.title});

  @override
  Size get preferredSize => Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return TodoAppbar(title: title ?? 'Home page Default Text');
  }
}
